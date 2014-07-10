A=db0;
A(A==0)=NaN;
C=zeros(126,2557*23);
%hold on;
%for i=1:10
%    B=squeeze(A(:,i,:));
%    C(i,:)=reshape(B,[1,2557*23]);
    %hist(C(i,:),[0:.04:1]);
%end
%hist(C,[.1 .3 .5 .7 .9]);
%hold off;
hist(C(70,:),[.01:.03:1]);
%bar3(C);