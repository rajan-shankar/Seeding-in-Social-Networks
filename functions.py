import networkx as nx
import numpy as np
import pandas as pd
import random

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