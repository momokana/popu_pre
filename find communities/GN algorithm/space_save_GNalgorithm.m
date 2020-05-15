% Do not store S and Q, calculate deltaQ in every iteration. Once deltaQ<0,
% break.

function [community_matrix,Q] = space_save_GNalgorithm(adj_matrix)
[r,~]=size(adj_matrix);
temp_num=r*(r-1)/2;
A=adj_matrix;
E=weighted_to_unweighted(adj_matrix);     % Change the adjacent matrix into an unweighted one
m=sum(A(:))/2;                            % number of edges
B=A-sum(A)'*sum(A)/(2*m);
S=community(E);
M=B.*S;
Q=sum(M(:))/(2*m);                        % Initialization
for i=1:temp_num
    lastQ=Q;
    lastS=S;
    inf_adj=adj_matrix;
    inf_adj((inf_adj==0))=inf;
    [~,edge_betweenness]=betweenness_centrality(sparse(adj_matrix));
    edge_betweenness=(edge_betweenness+edge_betweenness')/2;   % elimate calculation errors (<e-10) in betweenness
    pro=full(edge_betweenness)./inf_adj;  % proportion of edge betweeness to weight
    maxpro=max(pro(:));            % find the largest proportion
    E((pro==maxpro))=0;    % remove the edges with largest proportion
    S=community(E);
    M=B.*S;
    Q=sum(M(:))/(2*m);    % store the current modularity
    if Q<lastQ-0.001
        break;
    end
    adj_matrix((E==0))=0;
end
community_matrix=lastS;
Q=lastQ;
end
