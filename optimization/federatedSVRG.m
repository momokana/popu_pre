% Federated SVRG algorithm
% Correspondig inputs and outputs are the same as SVRG; node is a cell
% array to store the sequence of contents in all nodes. For example, there
% are totally n files, and the 2nd, 4th, 9th, n(n-1)/2 th, and n-1 th files
% are stored in the kth node, then node{k}=[2,4,9,n(n-1)/2,n-1],
% nk=size(node{k})=5.

function [a,e0,e] = federatedSVRG(x,p,node,m,h,delta)
[S,n]=size(x);
[~,K]=size(node);              % K = number of nodes
a=(1/S).* ones(1,S);
d0=p-a*x;
e0=d0*d0';
for j=1:200
    mu=mean(variance_jacobi(x,a,p));
    parfor k=1:K
        [~,nk]=size(node{k});   % nk = number of files in the kth node
        wk=a;
        hk=h/nk;
        for t=1:m
            r=unidrnd(nk);
            rk=node{k}(r);      % the rth file in the kth node is the (rk)th file in x
            gk=variance_jacobi(x(:,rk),wk,p(rk))-variance_jacobi(x(:,rk),a,p(rk))+mu;
            wk=wk-hk*gk;
        end
        weightedWk{1,k}=(nk/n)*wk;
    end
    for kk=1:K
        weightedW(kk,1:S)=weightedWk{kk}; % all the weightedWk must be stored outside the parallel loop
    end
    a=mean(weightedW);  % federated aggregation
    d=p-a*x;
    e=d*d';
    if d<delta
        break;
    end
end
end

