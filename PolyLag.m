function val=PolyLag(X,Y,x) %input a column vectors X and Y. Lagrange polynomial
n= length(X);
Knum=zeros(n,1);
Lnum=zeros(n,1);
L=zeros(1,n);
P=zeros(n);

for i = 1 :n
    Knum(i)=(x-X(i));
end

num=prod(Knum); %find the product of all elements

for i = 1:n
    Lnum(i)=num/Knum(i); %divide by the ith to get our numerator
end

for i = 1 :n
    P(:,i)=X(i)-X; 
    %ith element minus the rest and assign as columns of a matrix
end

for i = 1 :n
    P(i,i)=1; %replace the diagonal which have zeros with ones
end

Ldenom=prod(P); %take product column wise to get the denominator

for i = 1:n
    L(1,i) = Y(i)*Lnum(i)/Ldenom(1,i); %compute each term in the polynomial
end
val = sum(L); %take sum
    