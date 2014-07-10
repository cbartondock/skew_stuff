function [] = AddTFX(S,B,i)
    Z=zeros(1,126);
    for j=1:126
        if (~ismember(j,B(i,2,:))&&~ismember(j,B(i,3,:)))
            s=0;
            for g=1:2557
                if (ismember(g,B(i,1,:)))
                    s=s+S(g,j);
                end
            end
            Z(j)=s;
        end
    end
    [C I]=max(Z);
    TFX=I;
    v=find(B(i,1,:)==0);
    B(i,2,v)=I;
end