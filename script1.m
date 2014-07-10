clear all;
load db0.mat;
Z = (db==0);
A = sum(Z,2);   %A is 3-D array with 1 representing a 0 probability; 0 representing a non-0 probability
gxs=zeros(2557,23); 
gxs=A(:,1,:);    %gxs is 2-D(?) array of number of triples for gene-species pair which have probability 0
ng = gxs==126;  %ng is array of 0's that indicate whether all triples for the gene-species pair have probability 0
ng(2557,23);
ng=reshape(ng,[2557 23]);
%pg = gxs(gxs~=0 & gxs~=126);    %pg is array of values that indicate that some (NOT all) triples for a gene-species pair have probability 0
%sum(sum(pg));    %gives the sum of the number of 0's in one of the "incomplete" columns of original 3-D array
%n = sum(sum(ng))   %gives number of "complete" 0 columns in original 3-D array
%n/(2557*23)     %gives proportion of columns that are "complete" 0 columns
%z = sum(sum(sum(Z)))    %gives number of 0's in original array
%z/(2557*126*23) %proporiton of 0's in original array
%[r,c]=find(gxs~=126 & gxs~=0,1) %finds indices of partial column
%gxs(r,c)    %checks that indices are correct
%gxs(gxs~=0)=200;
%gxs(gxs==0)=1;
%gxs(gxs==200)=0;
%GxS=gxs
%save('DG','ng');
[r c]=find(ng);
net=[r c];
save('DG','net');
%for k=1:8053
    
    %ceil(ind(k)/2557);
    
    %ind(k)-2557*((int)(ind(k)/2557));
%if DG==0
%    print(DG(col),DG(row));