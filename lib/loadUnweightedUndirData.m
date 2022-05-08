function [A] = loadUnweightedUndirData(path)
%LOADUNWEIGHTEDUNDIRDATA Loads unweighted undirected edge data from a file into an
% adjacency matrix
%   Inputs:
%     path : path to file containing undirected unweighted edge data. This
%            data should be a regular txt file, in the following form:
%            nodeId1 nodeId2
%            Ex:
%            1 2
%            2 3
%            3 1
%            4 5
%            Node numbers should be integers starting at 1 (thank you
%            Matlab)
%
%   Outputs:
%     A : Adjacency matrix of the data. 

rawEdgeData = importdata(path);
numEdges = length(rawEdgeData);
numNodes = max(max(rawEdgeData));

A = zeros(numNodes);
for i = 1:numEdges
    node1 = rawEdgeData(i, 1);
    node2 = rawEdgeData(i, 2);
    A(node1, node2) = 1;
    A(node2, node1) = 1;
end

end

