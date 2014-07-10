A=zeros(10000);
y=randsample(10000,1500);
y=sort(y);
A(y)=1;
x=zeros(1499);
long=0;
for i=1:1499
	x(i)=y(i+1)-y(i);
    if x(i)>15
        long = long + x(i);
    end
end
long/85000