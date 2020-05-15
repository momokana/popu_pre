% To change a weighted graph into an unweighted one by evaluating all
% nonzero elements into 1.

function unweightedGraph = weighted_to_unweighted(weightedGraph)
[r,c]=size(weightedGraph);
unweightedGraph=ones(r,c);
for i=1:r
    for j=1:c
        if j==i || weightedGraph(i,j)==0
            unweightedGraph(i,j)=0;
        end
    end
end

