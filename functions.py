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
    samp = random.sample(list(g.nodes()), k = num_seeds) #sample egos w/out replacement
    
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


def num_2seed_triangles(g, seeds):
    #how many triangles of (target a) - (target b)
    #                          \          /
    #                          (untargeted)
    count = 0
    for comb in itertools.combinations(seeds, 2): #for each size-2 combination of seeds (targets)
        #print(comb)

        #how to identify such a triangle:

        #the seeds are connected
        if g.has_edge(comb[0],comb[1]):
            #AND There is a path length 2 through an UNTARGETED node.

            #we have to exclude paths through another TARGET node. 
            # To do this: get subgraph which removes all other target nodes except comb[0] and comb[1]
            other_seeds = [seed for seed in seeds if seed not in [comb[0],comb[1]]] 
            sub_nodes = [node for node in g.nodes() if node not in other_seeds] #remove the other seeds
            #print(other_seeds)
            gsub = g.subgraph(sub_nodes)
            count += num_paths2(gsub,comb[0],comb[1])
    
    return count

#note: to get the number of connected triplets where 
#                      (target a)  (target b)
#                          \          /
#                          (untargeted)
#just need to remove the check that the seeds are connected


def num_con_triples(g):
    #solve for #connected triples from the transitivity formula:
    # 3*num_triangles/transitivity = #connected triples
    num_triangles = sum(nx.triangles(g).values()) / 3 #triple-counting each triangle
    trans = nx.transitivity(g)
    
    return (3*num_triangles/trans)


def two_seed_tran(g, seeds):
    return(num_2seed_triangles(g, seeds) / num_con_triples(g))


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
