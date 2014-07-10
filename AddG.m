function [] = AddG(S,B,i)
    Z=zeros(1,2557);
    size(S)
    for j=1:2557
        if (~ismember(j,B(i,1,:)))
            s=0;
            %size(s)
            for tf=1:126
                if (ismember(tf,B(i,2,:)))
                    s=s+S(j,tf);
                else
                    if (ismember(tf,B(i,3,:)))
                        s=s-S(j,tf);
                    end
                end
            end
            Z(j)=s;
            if size(s, 1) ~= 1 || size(s, 2) ~= 1
                error('s is not a scalar');
            end
            if size(Z, 1) ~= 1 || size(Z, 2) ~= 2557
                error('Z not a row vector');
            end
        end
    end
    size(Z)
    [C I]=max(Z);
    Gene=I;
    v=find(B(i,1,:)==0);
    size(I)
    B(i,1,v)=I;
end