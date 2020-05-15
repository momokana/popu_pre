% To find communities by the unweighted adjacent, i.e. edges only exist in
% communities instead of between them. 
% Input: adjacent matrix E. E(i,j)=1 if a edge exists between node i and j,
%        0 otherwise.
% Outputs: community matrix S. S(i,j)=1 if node i and node j belong to the
%          same community, 0 otherwise.
% S is in fact the reachable matrix of E

function S = community(E)
[sz,~]=size(E);
I=eye(sz);
S=(E+I)^sz;
S((S~=0))=1;

        
        
        
        
        
        