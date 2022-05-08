% data is facebook friend data from here: http://snap.stanford.edu/data/egonets-Facebook.html
% this is edges in an undirected, unweighted graph representing friendships
% on facebook.com

% functions. Includes:
%   loadUnweightedUndirData
%   makeUnsignedLaplacian
addpath(genpath('./lib')); 

% very simple test adjacency matrix
% A = [0 1 0 1 0 0 0;
%      1 0 1 0 0 0 0;
%      0 1 0 1 0 0 0;
%      1 0 1 0 1 0 1;
%      0 0 0 1 0 1 0;
%      0 0 0 0 1 0 1;
%      0 0 0 1 0 1 0];
% n = length(A);

% load edge data into unsigned Laplacian matrix and Adjacency matrix
% pathname = './datasets/facebook_combined_corrected.txt';
pathname = './datasets/ucidata-zachary.txt';


A = loadUnweightedUndirData(pathname);

L = makeUnsignedLaplacian(A);

% determine number of users in dataset
n = length(L);

% number of communities to detect
numCommunities = 2;

% get svd of k-rank approximation of L 
% using the first numCommunities singular values
[U,S,V] = svds(L, numCommunities);


% community space matrix
comS = U*S; % row i of comS is the direction node i points in "community space"


% EXPERIMENTAL: normalize the rows of comS to avoid the error with kmeans:
% Some points have small relative magnitudes, making them effectively zero.
% Either remove those points, or choose a distance other than 'cosine'.
for i = 1:n
    comS(i,:) = U(i,:)*S/norm(U(i,:)*S);
end

% run clustering algorithm on community space comS, 
% making numCommunities communities
[kmeansclusters, C, sumd, D] = kmeans(comS, numCommunities, 'Distance', 'cosine');

% make graph of nodes and plot
G = graph(A);
h = plot(G, ...
    'EdgeColor', 'black', ...
    'LineWidth', 0.5, ...
    'Layout','force', ...
    'NodeLabel', {});

colors = hsv(numCommunities*2); % create numCommunities colors
% color the communities on the graph
for nodeid = 1:n
    highlight(h, nodeid, 'MarkerSize', 2, 'NodeColor', colors(kmeansclusters(nodeid)*2, :));
end
