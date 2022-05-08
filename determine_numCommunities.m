addpath(genpath('./lib')); % functions. Includes loadUnweightedUndirData

% load edge data into unsigned Laplacian matrix
% pathname = './datasets/facebook_combined_corrected.txt';
pathname = './datasets/ucidata-zachary.txt';


L = loadUnweightedUndirData(pathname);

num_singular_values = 100;

sparseL = sparse(L);

% compute the 100 largest singular values of L
S = svds(sparseL, num_singular_values, 'largest');

figure

% plot of 100 largest singular values
% looking at the first 100 values is probably enough 

% 100 largest singular values is usually good
plot(1:num_singular_values, S, 'b*');
xlabel('Singular Values In Decreasing Order of Magnitude');
ylabel('Magnitude of Singular Values');