% Gradient descent, the optimization function is the same as SVRG.

function [a,e0,e]=GD(x,p,step,delta)
[S,~]=size(x);
a=(1/S).* ones(1,S);
d0=(p-a*x).^2;
e0=d0*d0';
for j=1:1000
    g=mean(variance_jacobi(x,a,p));
    a=a-step*g;          
    d=(p-a*x).^2;
    e=d*d';
    if e<delta
        break;
    end
end