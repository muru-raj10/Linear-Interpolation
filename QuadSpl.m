function y=QuadSpl(X,Y,x) %input a column vectors X(sorted) and Y of length n+1
%there is a mistake in this function please check!!
n=length(X)-1;
V   =   [zeros(2*n,1);zeros(n-1,1);0];
Z   =   zeros(length(V),length(V));

j=1;
k=1;
for i = 1:2:2*n %Matching the first 2n equations
    Z(i,k:k+2)          =   [X(j)^2 X(j) 1];
    V(i)                =   Y(j);
    j                   =   j+1;
    Z(i+1,k:k+2)        =   [X(j)^2 X(j) 1];  
    V(i+1)              =   Y(j);
    k                   =   k+3;
end

j=1;
l=2;
for i=2*n+1:3*n-1 %smoothing condition   
    Z(i,j:j+1)            =   [2*X(l) 1];
    Z(i,j+3:j+4)          =   [-2*X(l) -1];
    j                     =   j+3;
    l                     =   l+1;
end
 
Z(3*n,1)=1;
%adjusting a1 to be = 1
Coeff       =       Z\V;

for m=1:n
    for i = 1 : 3 : 3*n
        A(m)=Coeff(i)*(x^2)+Coeff(i+1)*x+Coeff(i+2);   
        %find value of y for the x in each interval
    end
end

for m = 1 : n
    K(m)=x-X(m); 
end
position=find(K>0); %find the position of positive values of K

y=min(A(position)); 
%find the minimum value of A to satisfy the positive value of K

