function Coeff=PolyCoeffV(X,Y) %input X and Y as column vectors
n=length(X)-1;
V=zeros(n+1);  %start with matrix of ones
for i = 1 :n+1 
    for j = 1 : n+1
        V(i,j)= (X(i))^(j-1);       %V(:,i+1)=V(:,i).*X nested multiplication
    end
end
Coeff=V\(Y);
%Coeff=inv(V)*Y;
end
