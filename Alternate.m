function [B,Bf]=Alternate(S,GL,r)  %S is the matrix of skewnesses, which we obtain from PartSkew function
    %GL is a row vector of the original numbers of the genes in the initial
    %list
    display('hello');
    B=zeros(250,3,1000); %1st number (1) indicates layer, or iteration
    %2nd number (3) provides for first three columns (Gene=column 1, TFX=column 2, and TFY=column3)
    %3rd number is max number of things we want to deal with in a group of genes or TFs
    %horzcat(S(Blk(i,1,:),Blk(i,2,:)),S(Blk(i,1,:),Blk(i,3,:))); gives array of skewnesses
    B(1,1,1:size(GL,2))=GL;
    [x,y]=T(S,GL,r);
    B(1,2,1:size(x,2))=x;
    B(1,3,1:size(y,2))=y;
    It=0;   %It refers to the number of loops we must complete until we reach a stable block of gene-TFXYs
    for i=2:250
        g=G(S,B(i-1,2,:),B(i-1,3,:),r);
        B(i,1,1:size(g,2))=g;
        if (isequal(B(i-1,1,:),B(i,1,:)))
            It=i-1;
            display('break2');
            break;
        end
        
        [x,y]=T(S,g,r);
        B(i,2,1:size(x,2))=x(1,:);
        B(i,3,1:size(y,2))=y(1,:);
        if (isequal(B(i,2,:),B(i-1,2,:)) && isequal(B(i,3,:),B(i-1,3,:)))
           It=i-1;
           display('break1');
           break;
        end
    end
%     It=-1;
%     if s<=0
%         It=t;
%     end
%     if t<=0
%         It=s;
%     end
%     if (s>0 && t>0)
%         It=max(s,t);
%     end
    display('iterations ');
    display(It);
    i1=find(B(It,1,:)~=0);
    b1=B(It,1,i1);
    i2=find(B(It,2,:)~=0);
    b2=B(It,2,i2);
    i3=find(B(It,3,:)~=0);
    b3=B(It,3,i3);
    B1=S(b1,b2);
    B2=S(b1,b3);
    %display('genes');
    %b1
    %display('X');
    %b2
    %display('Y');
    %b3
    J=horzcat(B1,B2);
    C=[mean(J,2),J];
    C=sortrows(C,1);
    D=C(:,2:size(C,2));
    D=D';
    D=[mean(D,2),D];
    D=sortrows(D,1);
    Bf=D(:,2:size(D,2))';
end
