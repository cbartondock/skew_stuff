%accepts a list of TFXs and TFYs, obtains for each of the 2557 genes the
%total skewness for the list of TFs. It then sorts the skewnesses, prints
%out the top p+4, and returns the indices of these top p.
function [GList]=G(S,XL,YL,r)
    [C1 I1]=find(XL~=0);
    Xt=XL(I1);  %trims away 0s
    [C2 I2]=find(YL~=0);
    Yt=YL(I2);
    skX=S(:,Xt);    %skewnesses for pos
    size(S,1);
    %(YL)'
    skY=S(:,Yt);
    sk=horzcat(skX,skY);
    n1=sum(isnan(skX),2);
    n2=sum(isnan(skY),2);
    %GeneSkew=nansum(S(1:size(S,1),XL),2)-nansum(S(1:size(S,1),YL),2);
    GeneSkew= nansum(skX,2) ./ (size(skX,2)*ones(size(skX,1),1)-n1) - nansum(skY,2) ./ (size(skY,2)*ones(size(skY,1),1)-n2);
    %size(GeneSkew)
    GeneSkew(isnan(GeneSkew))=0;
    [Z,I]=sort(GeneSkew,'descend');
    p=1;
    for i=2:size(Z)
        if Z(i)/Z(1) < r
            p=i-1;
            break;
        end
    end
    %I(2558-p:2557)
    %Y(2558-p:2557)
    GList=I(1:p)';
    %display('----');
    %horzcat(flipud(I(size(S,1)-1-p:size(S,1)-p)),flipud(Y(size(S,1)-1-p:size(S,1)-p)))
end