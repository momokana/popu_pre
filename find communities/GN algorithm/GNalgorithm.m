% Girvan-Newman Algorithum to find the communities of a weighted graph
% Input: adjacent matrix(n*n)
% Outputs: 1) Community matrix(similar as an adjacent matrix.The edge bewteen
%          two nodes in the same community is weighted as one; otherwise is
%          weighted as zero.)
%          2) Modularity Q.
% Algorithm ideas:% 1) Change the adjacent matrix into an unweighted one
% 2) Culculate the bewteenness centrality for each edge;
% 3) Culculate the proportion of the bewteenness centrality and the weight
%    of each edge;
% 4) Caculate Q;
% 5) Find the largest proportion and remove that edge;
% 6) Restore the value of Q and the edge removed;
% 7) Repeat all the above steps until all edges have been removed;
% 8) Find the largest Q and the all the coresponding edges which have been
%    removed before this Q is calculated. These edges stand for the
%    'bridges' bewteen communities.
% Other routines used: weighted_to_unweighted.m;
%                      betweenness_centrality.m(from matlab_bgl);


function [community_matrix,Q] = GNalgorithm(adj_matrix)
[r,~]=size(adj_matrix);
temp_num=r*(r-1)/2;
temp=cell(temp_num,1);
tempQ=zeros(temp_num,1);
A=adj_matrix;
E=weighted_to_unweighted(adj_matrix);     % Change the adjacent matrix into an unweighted one
m=sum(A(:))/2;                            % number of edges
B=A-sum(A)'*sum(A)/(2*m);
t=1;
while isequal(E,zeros(r,r))==0
    inf_adj=adj_matrix;
    inf_adj((inf_adj==0))=inf;
    [~,edge_betweenness]=betweenness_centrality(sparse(adj_matrix));
    edge_betweenness=(edge_betweenness+edge_betweenness')/2;   % elimate calculation errors (<e-10) in betweenness
    pro=full(edge_betweenness)./inf_adj;  % proportion of edge betweeness to weight
    maxpro=max(pro(:));            % find the largest proportion
    E((pro==maxpro))=0;    % remove the edges with largest proportion
    S=community(E);
    temp{t,1}=S;           % store the current unweighted adjacent matrix into a cell array
    tempM=B.*S;
    tempQ(t)=sum(tempM(:))/(2*m);    % store the current modularity
    t=t+1;
    adj_matrix((E==0))=0;
end
tempQ((tempQ==0))=[];
[Q,time]=max(tempQ);
community_matrix=temp{time,1};
end