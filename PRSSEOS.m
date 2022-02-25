function [a,b]=PRSSEOS(par,w,e0,s0,T,Tc,Pc,Rg)
bet(1)=par(1);
bet(2)=par(2);

    b0=0.077796*Rg*Tc/Pc;
    Tr=T/Tc;
    b=b0;
    alpha=(1+((bet(1)*(1-Tr)))+(3*bet(2)*((1-Tr)^3)));
    a=0.457235*(Rg^2)*(Tc^2)*alpha/Pc;
end