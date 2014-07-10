A=db0;
A(A==0)=NaN;
X=zeros(126,1);
X(X==0)=NaN;
for a=1:126
    for b=1:23
        z=A(:,a,b).';
        X(a,1:(X(a).size+2557))=horzcat(X(a),z);
    end
end
bar3(X);
%Part1=[NaN];
%Part2=[NaN];
%for i=1:10
%    Part1=horzcat(Part1,A(:,:,i));
%end
%for i=11:23
%    Part2=horzcat(Part2,A(:,:,i));
%end

%TFbins=zeros(23*2557,126);
%TFbins=vertcat(
%for i=1:126
%	TFbins(i)=horzcat(TFbins(i),db0(:,i,:));
%end
%hist(TFbins(1),[.1 .3 .5 .7 .9]);
%twoD=sum(db0,2);
%for (twoD~=0)
%TF=zeros(8054,126);
%TF=db0(db0~=zeros(126))
%TF=cat(cat(A,3),1);
%hist(TF,[])
%B=reshape(A,1,[]);    
%hist(B,[.05 .15 .25 .35 .45 .55 .65 .75 .85 .95]);
%Z = (db0==0);
%A = sum(Z,2);   %A is 3-D array with 1 representing a 0 probability; 0 representing a non-0 probability
%gxs=zeros(2557,23); 
%gxs=A(:,1,:);    %gxs is 2-D(?) array of number of triples for gene-species pair which have probability 0
%g = gxs(gxs==0);  %g is array of 1's that indicate whether no triples for the gene-species pair have probability 0