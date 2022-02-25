function phi=fugacity(v,P,T,e0,s0,b,a,F,Rg)

%%%%%%%%%%%%%%%%%%%%%%%%% PRSV-TS-EOS %%%%%%%%%%%%%%%%%%%

q=a/(b*Rg*T);
B=b*P/(Rg*T);
Z=P*v/(Rg*T);
I=(1/(s0-e0))*log((Z+s0*B)/(Z+e0*B));
phi=exp(Z-1-log(Z-B)-q.*I-log(1+F./v));



end