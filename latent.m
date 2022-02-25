function [m latentHeatE latentHeatm  LH]=latent(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg)

[Pcal Vl Vg]=pressure(par,w,np,e0,s0,P,T,Tc,Pc,Rg);
n1=length(T);
np=n1;
nt=n1;
b=0;
while b<np-1
    b=b+1;
        pp(b)=P(b+1)-P(b);
        TT(b)=log(T(b+1)/T(b));
        VV(b)=abs(Vgg(b)-VL(b));
        latentHeatE(b)=TT(b)/(pp(b)*VV(b)); %%Experimental latent heat
        latentHeatE(b)=(pp(b)*VV(b))/TT(b);
end

ns=np;
j=0;
while j<np-1
    j=j+1;
        ppcal(j)=Pcal(j+1)-Pcal(j);
        TT(j)=log(T(j+1)/T(j));
        VVcal(j)=abs(Vg(j)-Vl(j));
        latentHeatm(j)=TT(j)/(ppcal(j)*VVcal(j)); %%model latent heat
         latentHeatm(j)=(ppcal(j)*VVcal(j))/TT(j);
end
latentHeatE';
latentHeatm';
m=length(latentHeatE);
LE=sum(latentHeatE)/m
LM=sum(latentHeatm)/m
for i=1:m
    LH(i)=abs((latentHeatE(i)-latentHeatm(i))*100/latentHeatE(i));
end
LH';
