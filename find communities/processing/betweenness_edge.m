% To calculate the edge betweenness of an graph.

function [B] = betweenness_edge(adj_matrix)
[N,~]=size(adj_matrix);
B=zeros(N,N);
[D,C]=min_distance(adj_matrix);
for i=1:N
    C(i,i)=1;
end
for n=1:N
    for m=1:N
        for i=1:N
            for j=(i+1):N
                if adj_matrix(n,m)~=0 && C(i,j)~=0 && D(i,j)==D(i,n)+D(n,m)+D(m,j)
                    B(n,m)=B(n,m)+C(i,n)*C(m,j)/C(i,j);
                    B(m,n)=B(n,m);
                end
            end
        end
    end
end
for i=1:N
    B(i,i)=0;
end
