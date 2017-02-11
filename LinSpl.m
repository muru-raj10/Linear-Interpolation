function y=LinSpl(X,Y,x) %input column vectors X is sorted and Y
n=length(X);
A=zeros(n-1,1);
K=zeros(n-1,1);

for i = 1 : n-1
    A(i)=Y(i)+((Y(i+1)-Y(i))/(X(i+1)-X(i)))*(x-X(i)); 
    %find value of y for the x in each interval
end

for i = 1 : n-1
    K(i)=x-X(i); 
end
position=find(K>0); %find the position of positive values of K

y=min(A(position)); 
%find the minimum value of A to satisfy the positive value of K