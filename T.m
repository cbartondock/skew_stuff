function [XList,YList]=T(S,GL,r)
    size(GL);
    [C I]=find(GL~=0);
    GL=GL(I);
    TFSkew=S(GL,1:size(S,2)); 
    size(TFSkew);
    n1=sum(isnan(TFSkew),1);
    size(n1);
    TFSkew=nansum(TFSkew)./(size(GL,2)*ones(1,size(S,2))-n1);
    
    %n2=sum(isnan(A2),3);
    %Skews=(nansum(A1,3)./(size(M,2)*ones(size(A,1),size(A,2))-n1))
    
    TFSkew=TFSkew';
    [X,J]=sort(TFSkew);
    n=1;
    for i=2:126
        if (X(i)/X(1) >= r)
            n=n+1;
        end
    end
    m=1;
    for j=1:125-n
        if (X(126-j)/X(126) >= r)
            m=m+1;
        end
    end
    
    %size(TFSkew)
    XList=(flipud(J((size(S,2)+1-n):size(S,2))))';
    %display('----');
    %flipud((horzcat(J((size(S,2)-1-n):size(S,2)-n),X((size(S,2)-1-n):(size(S,2)-n)))))
    YList=(J(1:m))';
    %display('----');
    %(horzcat(J(m+1:m+2),X(m+1:m+2)))
end