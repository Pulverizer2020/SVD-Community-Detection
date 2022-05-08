# SVD Community Detection Algorithm (SVD-CDA)

SVD-CDA is an algorithm for detecting community structure within a social network. This algorithm takes in an adjacency matrix representing an undirected unweighted graph and returns community labels for nodes in the graph.

This algorithm assumes that communities are clusters of nodes with many mutual connections; if two users have many mutual friends, they should be in the same community. If two nodes do not have many mutual friends, they should not be in the same community.

## The Algorithm

The core of this algorithm uses the properties of the SVD to analyze the connections in the adjacency matrix:

The SVD of the adjacency matrix is A=USVt, which is equivalent to AV=US. A is an adjacency matrix, so row i of A is the presence or absense of a connection between i and all the other nodes. V is an orthonormal basis for the rows of A. So, row i of AV is the degree to which user A is in the same community with all the other nodes. This can be thought of as A's direction in "community space;" If two users have many mutual friends, one can see that they will point in the same direction in "community space."

The algorithm then uses a k-means clustering algorithm on the rows of AV to find k communities. k is determined by ploting the values of sigma by descending magnitude and choosing the k most significant sigmas as the number of communities. This is an intentionally subjective choice: there is no ground truth for community structure within most datasets. The sigma value plotting acts as a tool for choosing the number of communities.

## Other Improvements

There are 2 other important improvements to this algorithm which enhance its community detection abilities.

1. For the SVD decomposition, an unsigned Laplacian matrix is used instead of an adjacency matrix. An unsigned Laplacian matrix is identical to a normal adjacency matrix, but its diagonals are the degree of the node. This helps "normalize" for nodes with lots of connections and nodes with very few.
2. a low-rank approximation of the unsigned Laplacian matrix is used to calculate the "community space," with the rank being the k number of communities the user of the algorithm wants to find. This uses the k largest sigma values as the "pattern" and discards the rank(A)-k sigma values as the "noise" within the data, greatly improving results.

## Possible Future Work

The algorithm can be easily expanded to handle directed and bipartite graphs. Weighted graphs may also be possible.

Additionally, a heuristic was used as a definition of a community within a network structure. Perhaps future algorithms could refine this definition.
