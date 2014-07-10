
function [Skews]=PartSkew(A,M)
    %A=db0;
    %A(A==0)=NaN;
    Skews=zeros(size(A,1),size(A,2));
    A1=A(:,:,M);
    A2=A(:,:,setdiff(1:size(A,3),M));
    %n1=sum(isnan(A1),3);
    %n1=sum(A1~=0,3);
    %size(n1)
    %n1([4 17 26 46 88 100],:)
    %n2=sum(A2~=0,3);
    %n2=sum(isnan(A2),3);
    Skews=(sum(A1,3)/size(M,2))-(sum(A2,3)/(23-size(M,2)));
end