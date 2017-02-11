function Coeff=PolyCoeffN(X,Y)

n= length (X);
A=zeros(n);
A(1,1)=Y(1);

for i = 1 : n
    A(i,1)=Y(i);    %fill up the first column with values of [yi]
end
for i = 2:n
    A(i,2)= (A(i,1)-A(i-1,1))/(X(i)-X(i-1)); %fill up the second column with [yi,yj]
end
for i = 3:n
    for j = 3:n
        A(i,j)=(A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1)); 
        %fnd the rest of the values and assign to a lower triangular matrix
    end
end
Coeff=zeros(n,1);
for i = 1 : n
    Coeff(i)=A(i,i); %Take the diagonal elements
end
