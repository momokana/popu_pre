% To calculate the jacobi matrix for the variance matrix
% d(i)=[p(i)-a(1)x(1,i)-a(2)x(2,i)-...-a(S)x(S,i)]^2 with respect to
% a=[a(1),a(2),...a(S)] at this point.
% Inputs: 1) x (S*I£©
%         2) a (1*S)
%         3) p (1*I)
% Output: J (I*S), J(i,s) refers to the partial derivative of d(i) with
%         respect to a(s).

function J=variance_jacobi(x,a,p)
[S,~]=size(x);
A=sym ('A',[1,S]);
d=(p-A*x).^2;
J=jacobian(d,A);
J=subs(J,A,a);
end