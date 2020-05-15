% To produce a r*r weighted adjacent matrix for the sake of testing
% algorithms.
% simi_adj is an adjacent matrix whose elements are clode to 1.

function[adj]=produce_adj(r)
adj=rand(r);
for i=1:r
    for j=1:r
        if j>=i
            adj(i,j)=0;
        end
    end
end
adj=adj/5;
adj=adj+adj'+eye(r);
adj((adj<0.05))=0;
