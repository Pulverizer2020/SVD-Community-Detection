G = graph(A);

figure

h = plot(G, ...
    'EdgeColor', 'black', ...
    'LineWidth', 0.5, ...
    'Layout','force', ...
    'NodeLabel', {});

for communityid = 1:numCommunities
    thisCommunitySize = nnz(communityList(communityid, :));
    for thisNodeid = 1:thisCommunitySize
        highlight(h, thisNodeid, 'MarkerSize', 2, 'NodeColor', colors(communityid*2, :));
    end
end