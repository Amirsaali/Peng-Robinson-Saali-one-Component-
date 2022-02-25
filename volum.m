function v=volum(phase,P,T,Rg,e0,s0,a,b,F)

c1=1;
c2=e0*b+s0*b-b-Rg*T./P;
c3=e0*s0*(b.^2)-(b.^2).*(e0+s0)-(e0+s0)*Rg*T*b./P+a./P;
c4=-e0*s0*(b.^3)-e0*s0*Rg*T*(b.^2)./P-a*b./P;
r1=roots([c1 c2 c3 c4]);
n1=0;
r2=[];
for i=1:3
    if isreal(r1(i))==1 & (r1(i)>0)
        r2(n1+1)=r1(i);
        n1=n1+1;
    end
end
r3=[];
r3=sort(r2,'descend');
if phase==1
    v=min(r3);
end
if phase==0
    v=max(r3);
end
end
