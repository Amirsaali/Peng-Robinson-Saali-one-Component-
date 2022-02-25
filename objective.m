function object=objective(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg)
[Pcal Vl Vg Pl Pg PHIg PHIl]=pressure(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL);
[m latentHeatE latentHeatm LH]=latent(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg);
object1=0;
aadvl=0;
object=0;
A=1;
    for j=1:np
        LatentH=sum(LH);
        object0(j)=abs(P(j)-Pcal(j))*100/P(j);
        object1=object1+object0(j);
        aadvl0(j)=abs(Vl(j)-VL(j))*100/VL(j);
        aadvl=aadvl0(j)+aadvl;
        
        object=(A*sum(object1))+((1-A)*sum(LH));%+(sum(aadvl));

    end
       ardP=sum(object1)/np;
       ardV=sum(aadvl)/np; 
       ardLH=sum(LH)/m;
display("Actual Pressure Calculated Pressure")
[P ; Pcal]'
par
Error = object/np
end
