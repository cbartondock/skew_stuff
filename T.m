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
    nmax = size(X, 1);
    for i=2:nmax
        if (X(i)/X(1) >= r)
            n=n+1;
        end
    end
    m=1;
    for j=1:nmax-n
        if (X(nmax+1-j)/X(nmax) >= r)
            m=m+1;
        end
    end
    
    %size(TFSkew)
    XList=(flipud(J((size(S,2)+1-m):size(S,2))))';
    %display('----');
    %flipud((horzcat(J((size(S,2)-1-n):size(S,2)-n),X((size(S,2)-1-n):(size(S,2)-n)))))
    YList=(J(1:n))';
    %display('----');
    %(horzcat(J(m+1:m+2),X(m+1:m+2)))
end