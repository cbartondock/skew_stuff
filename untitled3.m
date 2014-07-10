A=db0;
A(A==0)=NaN;
S=zeros(2557,126);
P=zeros(1,23);
X1=zeros(1,10);
X2=zeros(1,13);
for i=1:2557
    for j=1:126
        B=squeeze(A(i,j,:));
        P=reshape(B,[1,23]);
        X1=P(1,1:10);
        X2=P(1,11:23);
        %n1=0;
        %n2=0;
        m1=mean(X1);
        m2=mean(X2);
        %if (isnan(m1) || isnan(m2))
        %    S(i,j)=NaN;
        %else
        %    syms k;
        %    T1=symsum(B(k),1,10);
        %    m1=T1/(10-n1);
        %    syms k;
        %    T2=symsum(B(k),11,23);
        %    m2=T2/(13-n2);
        %    S(i,j)=m1-m2;
        %end
        S(i,j)=m1-m2;
    end
end

        
        