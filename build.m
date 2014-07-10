A=db0;
S=zeros(2557,126);
A1=A(:,:,1:10);
A2=A(:,:,11:23);
n1=sum(A1==0,3);
n2=sum(A2==0,3);
S=(sum(A1,3)./(10*ones(2557,126)-n1))-(sum(A2,3)./(13*ones(2557,126)-n2));
B=zeros(2557,3,10);
for i=1:2557
	B(i,1,1)=i;
    U=S(i,:);
    [C1 I1]=max(U);
    B(i,2,1)=I1;
	[C2 I2]=min(U);
    B(i,3,1)=I2;
    skew=S(i,B(i,2,1))-S(i,B(i,3,1));
end 
for k=1:4
	for i=1:2557
        %next3=zeros(3,1);
        %next3=add3(k,B,i,S);
        %next3
        AddG(S,B,i);
        AddTFX(S,B,i);
        AddTFY(S,B,i);
    end
end