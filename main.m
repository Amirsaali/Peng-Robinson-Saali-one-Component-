clc
clear
format long
% optimization=1 to find the best adjustable parameters
% optimization=0 to observe model performance based on the adjustable
% values

optimization=1;
Rg=8.31446;

%%%%%%%%%  PRSS %%%%%%%
e0=1+2^0.5;
s0=1-2^0.5;
%%%%%%%%%% SO2 %%%%%%%%  
Tc=430.64 ;  % SO2
Pc=7.8866*1e6;   % SO2
w=0.256;  % SO2

par=[
0.804882349
0.223267583
];


data=[
% SO2 (Sulfur dioxide)
200	0.002033	3.95E-05	0.81664
210	0.0045515	4.01E-05	0.38248
220	0.0093531	4.08E-05	0.19458
230	0.017859	4.14E-05	0.1062
240	0.032012	4.21E-05	0.061562
250	0.054323	4.28E-05	0.037575
260	0.087899	4.36E-05	0.023975
270	0.13644	4.44E-05	0.015895
280	0.2042	4.52E-05	0.010892
290	0.29597	4.61E-05	0.0076804
300	0.417	4.71E-05	0.0055513
310	0.57296	4.81E-05	0.0040988
320	0.76992	4.92E-05	0.0030822
330	1.0142	5.04E-05	0.0023541
340	1.3126	5.17E-05	0.0018215
350	1.6722	5.32E-05	0.0014245
360	2.1001	5.49E-05	0.0011232
370	2.6044	5.69E-05	0.00089055
380	3.1933	5.92E-05	0.00070797
390	3.8759	6.20E-05	0.00056213
400	4.6625	6.56E-05	0.0004432
410	5.5655	7.06E-05	0.00034333
420	6.6018	7.87E-05	0.00025447
430	7.8023	0.00010589	0.00014833
];

n1=size(data);
np=n1(1);
nt=n1(1);
T=data(:,1)';
P=data(:,2)'*1e6;  % Pa
VL=data(:,3)';     % m3
Vgg=data(:,4)';    % m3

if optimization==1
    ParFinal=fminsearch(@ (par) objective(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg),par)
    [Pcal Vl Vg Pl Pg PHIg PHIl]=pressure(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg);
end
if optimization==1
    [Pcal Vl Vg Pl Pg PHIg PHIl]=pressure(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg);
end
[latentHeatE latentHeatm latentheatdev]=latent(par,w,np,e0,s0,P,T,Tc,Pc,Rg,VL,Vgg);

for i=1:nt
    hold on
    plot(T,Pcal,'-',T,P,'^')
end
