function y = CubSpl(X,Y,x)

n=length(X)-1;
V   =   [zeros(2*n,1);zeros(2*n-2,1);0;0];
Z   =   zeros(length(V),length(V));

j=1;
k=1;
for i = 1:2:2*n %Matching the first 2n equations
    Z(i,k:k+3)          =   [X(j)^3 X(j)^2 X(j) 1];
    V(i)                =   Y(j);
    j                   =   j+1;
    Z(i+1,k:k+3)        =   [X(j)^3 X(j)^2 X(j) 1];  
    V(i+1)              =   Y(j);
    k                   =   k+4;
end

j=1;
l=2;
for i=2*n+1:3*n-1 %smoothing condition for first derivative  
    Z(i,j:j+2)            =   [3*X(l)^2 2*X(l) 1];
    Z(i,j+4:j+6)          =   [-3*X(l)^2 -2*X(l) -1];
    j                     =   j+4;
    l                     =   l+1;
end

j=1;
l=2;
for i=3*n:4*n-2 %smoothing condition for second derivative  
    Z(i,j:j+1)            =   [6*X(l) 2];
    Z(i,j+4:j+5)          =   [-6*X(l) -2];
    j                     =   j+4;
    l                     =   l+1;
end
 

Z(4*n-1,1)=6*X(1);
Z(4*n-1,2)=2;
Z(4*n,4*n-3)=6*X(n+1);
Z(4*n,4*n-2)=2;
%final 2 equations 
Z
V
%to check
Coeff = Z\V;
Coeff

for m=1:n
    for i = 1 : 4 : 4*n
        A(m)=Coeff(i)*(x^3)+Coeff(i+1)*(x^2)+Coeff(i+2)*x+Coeff(i+3);   
        %find value of y for the x in each interval
    end
end

for m = 1 : n
    K(m)=x-X(m); 
end
position=find(K>0); %find the position of positive values of K


y=min(A(position)); 
%find the minimum value of A to satisfy the positive value of K


end