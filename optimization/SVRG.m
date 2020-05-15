% SVRG algorithm to find the parameter a=[a1,a2,...as] to minimize the sum
% of [pi-a*xi].^2, i=1,2,...I.
% Inputs: 1) popularity scores matrix x, x(s,i) refers to the populariy score
%            of content i from region s.
%         2) popularity matrix p, p(i) refers to the true popularity of content i.
%         3) integer m, number of stochastic steps per epoch.
%         4) learning rate h.
%         5) error range "delta".
% Outputs 1) matrix a.
%         2) initial error e0.
%         3) the error e after optimization.
% Other sources: variance_jacobi.m

function [a,e0,e] = SVRG(x,p,m,h,delta)
[S,I]=size(x);
a=(1/S).* ones(1,S);
d0=p-a*x;
e0=d0*d0';
for j=1:1000
    A=a;
    mu=mean(variance_jacobi(x,A,p));
    for t=1:m
        r=unidrnd(I);
        g=variance_jacobi(x(:,r),A,(r))-variance_jacobi(x(:,r),a,p(r))+mu;
        A=A-h*g;
    end
    a=A;
    d=p-a*x;
    e=d*d';
    if e<delta
        break;
    end       
end
end

