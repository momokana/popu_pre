function [sim] = group_sim(group,sparse_similarity_matrix)
[~,sz]=size(group);
sim=ones(sz);
for i=1:sz
    for j=(i+1):sz
        sim(i,j)=sparse_similarity_matrix(group(i),group(j));
        sim(j,i)=sim(i,j);
    end
end