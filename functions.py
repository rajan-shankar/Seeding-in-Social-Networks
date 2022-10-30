import networkx as nx
import numpy as np
import pandas as pd
import random
import itertools

## SEEDING ALGORITHM
def get_seeds(g, p, method):
    #NOTE: the proportion p should not be too high. otherwise there'll be lots of nodes with No available alters
    if method not in ['random', 'friend','pair']:
        raise ValueError("invalid input")

    num_seeds = int(p*g.number_of_nodes()) #number of egos
    
    connected_nodes = [node for node in g.nodes() if g.degree[node] != 0]#don't consider disconnected nodes
    samp = random.sample(connected_nodes, k = num_seeds) #sample egos w/out replacement
    
    if method == "random":
        return samp

    #{node: friend} dict
    friend_dict  = dict.fromkeys(samp) #initialise as {node: None, ...}

    samp_degrees = dict(g.degree(samp))#degrees of the egos

    #consider egos in ascending order of degree. to deal with edge cases 
    # \              
    # -(x)-()-(x) 
    nodes_by_degree = [k for k, v in sorted(samp_degrees.items(), key=lambda item: item[1])]

#     print("node, available friends:")
    for n in nodes_by_degree:
        friends = list(g.adj[n])
        available_f = [f for f in friends
            if f not in list(friend_dict.values())
            and f not in list(friend_dict.keys())] #friends that are not alters or egos
#         print(n,available_f)

        if len(available_f) > 0:
            friend_dict[n] = random.choice(available_f) #randomly assign one of the alters as friend          

#     print("\nresulting seeding:")
#     print(friend_dict) 

    #try to replace egos that don't have alters. 
    # -(x)-(x), sometimes, even going in ascending order not enough. 
    for n in list(friend_dict.keys()):
        if friend_dict[n] is None:
            replacements = [n for n in list(g.nodes()) if 
                n not in (list(friend_dict.values()) + list(friend_dict.keys()))]
#             print("\nreplacements")
#             print(n, replacements)

            random.shuffle(replacements) #shuffle the order
            for r in replacements:
                #SAME AS ABOVE
                friends = list(g.adj[r])
                available_f = [f for f in friends if f not in list(friend_dict.values()) and f not in list(friend_dict.keys())] #friends that are not alters or egos
                
                if len(available_f) > 0:
                    friend_dict[r] = random.choice(available_f) #make new key for replacement
                    friend_dict.pop(n, None) #remove old ego that didn't have alter
#                     print("{} replaced {}".format(r,n))
                    break

            if n in list(friend_dict.keys()): # if n is still in the list
                raise Exception('unable to find replacement for node',n)

#     print("\nfinal dict:")
#     print(friend_dict)

    if method == 'friend':
        return list(friend_dict.values())

    else:#method pair
        half_keys = random.sample(list(friend_dict.keys()), 
                        k = int(len(friend_dict.keys())/2)) #sample half the keys
        half_values = [friend_dict[k] for k in half_keys]#their corresponding values
        return half_keys + half_values
    
    
# funcionalise SOURISH'S analysis. for a network g, get:
# DataFrame: simulated probabilities of its nodes being selected (by the seeding methods)
# DataFrame: centrality measures of its nodes
def get_prob_centralities(g, n_samples = 1000, p = 0.2):
    
    #seedDataProbs
    random_counts = dict.fromkeys(g.nodes(), 0)
    friend_counts = dict.fromkeys(g.nodes(), 0)
    pair_counts = dict.fromkeys(g.nodes(), 0)

    for i in range(n_samples):
        random_samp = get_seeds(g, p, 'random')
        friend_samp = get_seeds(g, p, 'friend')
        pair_samp = get_seeds(g, p, 'pair')

        for node in random_samp:
            random_counts[node] += 1
        for node in friend_samp:
            friend_counts[node] += 1
        for node in pair_samp:
            pair_counts[node] += 1
            
    random_probs = {k:v/n_samples for (k,v) in sorted(random_counts.items(), key=lambda item: item[1], reverse = True)}
    friend_probs = {k:v/n_samples for (k,v) in sorted(friend_counts.items(), key=lambda item: item[1], reverse = True)}
    pair_probs = {k:v/n_samples for (k,v) in sorted(pair_counts.items(), key=lambda item: item[1], reverse = True)}
            
    seedNames = ["Random", "Friend", "Pair"]
    listSeedsProbs = [random_probs, friend_probs, pair_probs]
    listSeedsProbs = [dict(sorted(x.items(), key=lambda item: item[0])) for x in listSeedsProbs] #ASCENDING ORDER OF NODES

    seedDataProbs = pd.DataFrame(listSeedsProbs).T
    seedDataProbs.columns = seedNames
    
    # Centrality measures
    measuresNames=["Degree","Eigenvector","Katz","Page Rank","Betweeness"]
    listMeasures = [dict(nx.degree(g)),
                    nx.eigenvector_centrality_numpy(g),
                    nx.katz_centrality_numpy(g),
                    nx.pagerank(g),
                    nx.betweenness_centrality(g)]

    listMeasures = [dict(sorted(x.items(), key=lambda item: item[0])) for x in listMeasures] #ASCENDING ORDER OF NODES

    measuresData = pd.DataFrame(listMeasures).T
    measuresData.columns = measuresNames
    
    
    return seedDataProbs, measuresData


#combine output from the above function => spearman correlation between each type of seeding and centrality measure

def get_spearman(seedDataProbs, measuresData):
    combinedDataProbs = pd.concat([measuresData, seedDataProbs], axis=1)

    seedNames = ["Random", "Friend", "Pair"]
    meltedDataProbs = pd.melt(combinedDataProbs.reset_index(), id_vars = [*seedNames, "index"], value_name = 'Measure Value', var_name = "Measure")
    meltedDataProbs = pd.melt(meltedDataProbs, id_vars = ["index", "Measure", "Measure Value"], value_name = 'Selection Probability', var_name = "Targeting Method")

    # Calculating Spearman Correlation
    spearmanData = meltedDataProbs.groupby(['Targeting Method', 'Measure'])[['Selection Probability','Measure Value']].corr(method="spearman").iloc[0::2,-1]
    # Dropping level_2 which was artificially created by grouping
    spearmanData = spearmanData.reset_index().drop('level_2', axis = 1).query("`Measure Value` != 1")

    res = spearmanData.sort_values("Measure").reset_index().drop("index", axis = 1)
    res.rename(columns={"Measure Value": "SCorrelation"}, inplace = True)
    return res

def num_paths2(g, i, j):
    #i,j = name of nodes
    #number of paths length 2 between node i and node j in graph g
    #Note: this function covers cases when g.nodes() is not in ascedign order
    
    A = nx.adjacency_matrix(g)#ordering of rows/columns is by G.nodes(), not necessarily ascending
    A = A.todense()
    
    A_sq = np.matmul(A,A) #(A^2)_{ij} = how many paths length 2 betwenn node i and j
    
    #what's the index of node i and node j in g.nodes?
    ns = list(g.nodes())
    ind_i = ns.index(i)
    ind_j = ns.index(j)
    
    return A_sq[ind_i, ind_j]


# def num_2seed_triangles(g, seeds):
#     #how many triangles of (target a) - (target b)
#     #                          \          /
#     #                          (untargeted)
#     count = 0
#     for comb in itertools.combinations(seeds, 2): #for each size-2 combination of seeds (targets)
#         #print(comb)

#         #how to identify such a triangle:

#         #the seeds are connected
#         if g.has_edge(comb[0],comb[1]):
#             #AND There is a path length 2 through an UNTARGETED node.

#             #we have to exclude paths through another TARGET node. 
#             # To do this: get subgraph which removes all other target nodes except comb[0] and comb[1]
#             other_seeds = [seed for seed in seeds if seed not in [comb[0],comb[1]]] 
#             sub_nodes = [node for node in g.nodes() if node not in other_seeds] #remove the other seeds
#             #print(other_seeds)
#             gsub = g.subgraph(sub_nodes)
#             count += num_paths2(gsub,comb[0],comb[1])
    
#     return count

#note: to get the number of connected triplets where 
#                      (target a)  (target b)
#                          \          /
#                          (untargeted)
#just need to remove the check that the seeds are connected

# def two_seed_tran(g, seeds):
#     return(num_2seed_triangles(g, seeds) / num_con_triples(g))

def num_con_triples(g):
    #solve for #connected triples from the transitivity formula:
    # 3*num_triangles/transitivity = #connected triples
    num_triangles = sum(nx.triangles(g).values()) / 3 #triple-counting each triangle
    trans = nx.transitivity(g)
    
    return (3*num_triangles/trans)


# def num_paths3(g, i, j):
#     #i,j = name of nodes
#     #number of paths length 3 between node i and node j in graph g
#     #Note: this function covers cases when g.nodes() is not in ascedign order
    
#     A = nx.adjacency_matrix(g)#ordering of rows/columns is by G.nodes(), not necessarily ascending
#     A = A.todense()
    
#     A_sq = np.matmul(A,A)
#     A_cubed = np.matmul(A_sq,A)
    
#     #what's the index of node i and node j in g.nodes?
#     ns = list(g.nodes())
#     ind_i = ns.index(i)
#     ind_j = ns.index(j)
    
#     return A_cubed[ind_i, ind_j]

# def num_2seed_trianglesV2(g, seeds):
#     #how many triangles of (target a) - (target b)
#     #                          \          /
#     #                          (untargeted)
#     count = 0
#     nonseeds = [n for n in g.nodes if n not in seeds]
    
#     for ns in nonseeds:
#         gsub = g.subgraph(seeds + [ns])
#         count += int(num_paths3(gsub,ns,ns)/2)
        
#         #each path3 is counted twice: as {i,j,k,i} and {i,k,j,i}
   
#     return count
                                                #ROHEN: V4 is the speed god
# def num_2seed_trianglesV4(g, seeds):
  
#     count = 0
#     nonseeds = [n for n in g.nodes if n not in seeds]
#     gsub = g.subgraph(seeds)
    
#     for seed in seeds:
#         for adj_seed in list(gsub.adj[seed]):
#             g_nonseed_neigh = [s for s in g.adj[seed] if s not in seeds] #don't consider seeds as the third vertex
            
#             count += len(set(g_nonseed_neigh).intersection(set(g.adj[adj_seed])))
        
#     return int(count/2) #double counting each triangle

def num_2seed_trianglesV4(g, seeds):
   #this version doesn't double count. should halve speed of the earlier
    count = 0
    nonseeds = [n for n in g.nodes if n not in seeds]
    gsub = g.subgraph(seeds)
    explored = []
    
    for seed in seeds:
        for adj_seed in list(gsub.adj[seed]):
            
            if (adj_seed, seed) in explored or (seed, adj_seed) in explored: #if we already considered this link
                continue
            else:
                g_nonseed_neigh = [s for s in g.adj[seed] if s not in seeds] #don't consider seeds as the third vertex

                count += len(set(g_nonseed_neigh).intersection(set(g.adj[adj_seed])))
                explored.append((seed, adj_seed))
        
    return count 

def two_seed_tranV4(g, seeds):
    return(num_2seed_trianglesV4(g, seeds) / num_con_triples(g))

#for a graph g, simulate seeds nsamp times. Each time, calculate the transiticity measures
#name: string for network name
def sim_2seed_transitivity(g, p, nsamp = 200):
    random_2tran = []
    friend_2tran = []
    pair_2tran = []
    

    for i in range(0,nsamp):
        random_seeds = get_seeds(g, p, 'random')
        friend_seeds = get_seeds(g, p, 'friend')
        pair_seeds = get_seeds(g, p, 'pair')

        random_2tran.append(two_seed_tranV4(g, random_seeds))
        friend_2tran.append(two_seed_tranV4(g, friend_seeds))
        pair_2tran.append(two_seed_tranV4(g, pair_seeds))
    
    #(nsamp x 1 vector, ...)
    return (random_2tran, friend_2tran, pair_2tran)




#Rajan's
def num_2seed_triangles_around_a_node(g, node, targets_connected=True):
    
    adopted = [i for i in g.nodes if g.nodes[i]['state'] == 1]
    
    if g.nodes[node]['state'] in adopted:
        return "node has already adopted"
    
    count = 0
    for comb in itertools.combinations(adopted, 2):  # for each size-2 combination of seeds (targets)
        if g.has_edge(comb[0],node) and g.has_edge(node,comb[1]):  # the node is connected to the targets
            if targets_connected:
                if g.has_edge(comb[0],comb[1]):  # the targets are connected
                    count += 1
            else:
                count += 1
    
    return count

#see threshold model.ipynb
#RUN the above `rep` times, and return a matrix with the corresponding proportions of state 1 (rho/N)
def get_rhos(gk, q, tmax, rep, seed_method, p = 0.2):
    
    N = gk.number_of_nodes()
    all_rhos = np.zeros(shape=(rep, tmax + 1)) # matrix row: one sample, matrix col: time

    for i in range(rep):
        rho=[]

        # Initial Condition
        nx.set_node_attributes(gk,0,name="state")#all state 0 at beginning
        
        seeds = get_seeds(gk, p, seed_method)#except the seeds
        for seed in seeds:
            gk.nodes[seed]['state'] = 1

        rho.append(np.sum([gk.nodes[i]['state'] for i in gk.nodes()]))

        # Dynamics
        for t in range(tmax):
            for t2 in range(N): # Do N updates, one update for each node, on average
                n = random.choice(list(gk.nodes()))
                if gk.nodes[n]['state']==0 and gk.degree[n] > 0:#only change if the state is 0. Once state 1, no going back. 
                    #Also, don't consider disconnected nodes (degree 0)
                    count=0
                    for m in gk.neighbors(n):
                        count = count + gk.nodes[m]['state']
                    if count/gk.degree(n)> q: #if the proportion of 'infected' > q
                        gk.nodes[n]['state']=1

            newstates = [gk.nodes[i]['state'] for i in gk.nodes()]
            rho.append(np.sum(newstates))
        
        rho = np.array(rho)/N #get proportion
        #print(rho)
        all_rhos[i] = rho
    
    return all_rhos
