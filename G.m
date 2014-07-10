%accepts a list of TFXs and TFYs, obtains for each of the 2557 genes the
%total skewness for the list of TFs. It then sorts the skewnesses, prints
%out the top p+4, and returns the indices of these top p.
function [GList]=G(S,XL,YL,r)
    [C1 I1]=find(XL~=0);
    Xt=XL(I1);
    [C2 I2]=find(YL~=0);
    Yt=YL(I2);
    skX=S(1:size(S,1),Xt);
    size(S,1);
    %(YL)'
    skY=S(1:size(S,1),Yt);
    sk=horzcat(skX,skY);
    n2=sum(isnan(sk),2);
    %GeneSkew=nansum(S(1:size(S,1),XL),2)-nansum(S(1:size(S,1),YL),2);
    GeneSkew=(nansum(skX,2)-nansum(skY,2))./(size(sk,1)*ones(size(S,1),1)-n2);
    %size(GeneSkew)
    GeneSkew(isnan(GeneSkew))=0;
    [Z,I]=sort(GeneSkew);
    p=1;
    for i=1:2556
        if (Z(2557-i)/Z(1) >= r)
            p=p+1;
        end
    end
    %I(2558-p:2557)
    %Y(2558-p:2557)
    GList=(flipud(I(size(S,1)+1-p:size(S,1))))';
    %display('----');
    %horzcat(flipud(I(size(S,1)-1-p:size(S,1)-p)),flipud(Y(size(S,1)-1-p:size(S,1)-p)))
end