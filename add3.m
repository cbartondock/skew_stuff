function [A] = add3(k,B,g,S)
    TFtoG=zeros(2557);
    GtoTFX=zeros(126);
    GtoTFY=zeros(126);
    for Gnum=1:2557   
        if (~ismember(Gnum,B(g,1,:)))
            s=0;
            for a=1:k
            	s=s+S(Gnum,B(g,2,a));
                s=s-S(Gnum,B(g,3,a));
            end
            Gnum
            s
            TFtoG(Gnum)=s;
        end
    end
    [C0 I0]=max(TFtoG);	
    g=I0;
    B(g,1,k+1)=I0;
    %t=zeros(126);
    for TFXnum=1:126
        if (~ismember(TFXnum,B(g,2,:)))
            r=0;
            for b=1:k+1
                r=r+S(B(g,1,b),TFXnum);
            end
            TFXnum
            r
            GtoTFX(TFXnum)=r;
        end
    end
    [C1 I1]=max(GtoTFX);
    tfx=I1;
    B(g,2,k+1)=I1;
    for TFYnum=1:126
        if (~ismember(TFnum,B(g,3,:)))
            t=0;
            for b=1:k+1
                t=t+S(B(g,1,b),TFYnum);
            end
            GtoTFY(TFYnum)=t;
        end
    end 
    [C2 I2]=min(GtoTFY);
    tfy=I2;
    B(g,3,k+1)=I2;
    A=[g,tfx,tfy];
end