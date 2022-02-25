function [Pcal Vl Vg Pl Pg PHIg PHIl]=pressure(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg)

for j=1:np
    %%%%% 2:gas    1:solvent
    t=T(j);
    p=P(j);
    [a,b]=PRSSEOS(par,w,e0,s0,t,Tc,Pc,Rg);
    E=0;
    vi=0;
    F=vi*(exp(E/t)-1);
    err=1;
    e10=1e-6;
    iter=0;
    while err>e10
        iter=iter+1;
        vl=volum(1,p,t,Rg,e0,s0,a,b,F);
        vg=volum(0,p,t,Rg,e0,s0,a,b,F);
        phil=fugacity(vl,p,t,e0,s0,b,a,F,Rg);
        phig=fugacity(vg,p,t,e0,s0,b,a,F,Rg);
        pl=Rg*t./(vl-b)-a./((vl+e0*b)*(vl+s0*b))-Rg*t*F./(vl*(vl+F));
        pg=Rg*t./(vg-b)-a./((vg+e0*b)*(vg+s0*b))-Rg*t*F./(vg*(vg+F));
        FUGl=log(p*phil);
        FUGg=log(p*phig);
        s1=FUGl/FUGg;
        if abs(s1-1)<1e-8
            err=e10/10;
            Pcal(j)=p;
        else
            p=p*s1;
        end
        iter=iter+1;
    end
    Pcal(j)=p;
v0g(j)=vg;
v0l(j)=vl;
phig0(j)=phig;
phil0(j)=phil;
p0g(j)=pg;
p0l(j)=pl;
end
Pcal;
Vl=v0l;
Vg=v0g;
Pg=p0g;
Pl=p0l;
PHIg=phig0;
PHIl=phil0;

end
