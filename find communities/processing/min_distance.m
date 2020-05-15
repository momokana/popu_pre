% To calculate the minimum distance of a graph (weighted or unweighted)
% based on Floyd algorithm.
% Input: adjacent matrix;
% Outputs: 1) D(i,j)= the minimum distance between node i and node j;
%          2) C(i,j)= the number of miniimum-distance paths between node i
%             and node j.

function [D,C] = min_distance(adj_matrix)
[N,~]=size(adj_matrix);
A=adj_matrix;
for i=1:N
    for j=i:N
        if j==i || adj_matrix(i,j)==0   % not connected
            A(i,j)=inf;
            A(j,i)=inf;
        end
    end
end
D=A;
C=A;
C((C==inf))=0;
for i=1:N
    D(i,i)=0;
end
for k=1:N
    for i=1:N
        for j=(i+1):N
            if D(i,j)>D(i,k)+D(k,j)
                D(i,j)=D(i,k)+D(k,j);
                C(i,j)=C(i,k)*C(k,j);
            elseif D(i,j)==D(i,k)+D(k,j)
                    if k~=i && k~=j
                       C(i,j)=C(i,j)+C(i,k)*C(k,j);
                    end
            end
            D(j,i)=D(i,j);
            C(j,i)=C(i,j);
        end
    end
end

