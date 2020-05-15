function [community_matrix,Q] = save_but_slow_GNalgorithm(adj_matrix)
[r,~]=size(adj_matrix);
temp_num=r*(r-1)/2;
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
    tempM=B.*S;
    tempQ(t)=sum(tempM(:))/(2*m);    % store the current modularity
    t=t+1;
    adj_matrix((E==0))=0;
end
tempQ((tempQ==0))=[];
[szQ,~]=size(tempQ);
Q=max(tempQ);

E=weighted_to_unweighted(A);     % Change the adjacent matrix into an unweighted one
m=sum(A(:))/2;                            % number of edges
B=A-sum(A)'*sum(A)/(2*m);
for i=1:szQ
    inf_adj=A;
    inf_adj((inf_adj==0))=inf;
    [~,edge_betweenness]=betweenness_centrality(sparse(A));
    edge_betweenness=(edge_betweenness+edge_betweenness')/2;   
    pro=full(edge_betweenness)./inf_adj;  
    maxpro=max(pro(:));            
    E((pro==maxpro))=0;    
    S=community(E);
    tempM=B.*S;
    tempQ=sum(tempM(:))/(2*m);    
    if tempQ==Q
        break;
    end
    adj_matrix((E==0))=0;
end
community_matrix=S;

