function [L] = makeUnsignedLaplacian(A)
%MAKEUNSIGNEDLAPLACIAN Make unsigned Laplacian Matrix from nxn adjacency 
% matrix representing an undirected graph. 
%   Inputs:
%     A : Adjacency matrix. Must be nxn.
%
%   Outputs:
%     L : Unsigned Laplacian matrix of A. A Laplacian matrix is just like a
%         normal adjacency matrix, but the diagonal is the degree of that 
%         node.

numNodes = length(A);

L = A;
for i = 1:numNodes
    L(i,i) = sum(A(i, 1:numNodes));
end


end

