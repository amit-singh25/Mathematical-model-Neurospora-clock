function dxdt = DDL_model(t,x,signals)
dxdt = zeros(size(x));
light=m_pulses(t,signals);
%light=0;
 K1 = 0.00236705;
 K2 = 28.1929;
 K3 = 2.09235;
 K4 = 906.216;
 K5 = 0.216079;
 K6 = 758.752;
 K7 = 7.9407;
 Kcp1 = 0.447489;
 Kcp2 = 0.802715;
 Kcp3 = 1.27124;
 Kcp4 = 0.0100047;
 Kpos1 = 7.61913;
 Kpos2 = 3.52903;
 Kpos3 = 5.7;
 Kpos4 = 2.7;
 frqs = 0.954569;
 k1 = 1.37122;
 k10 = 0.100034;
 k11 = 3.59694;
 k12 = 0.344372;
 k2 = 519.795;
 k3 = 0.163611;
 k4 = 0.383899;
 k5 = 0.180726;
 k6 = 11.9218;
 k7 = 0.195904;
 k8 = 0.41287;
 k9 = 3.66495;
 k_c = 1.0214;
 k_f = 15.2451;
 k_n = 0.670229;
 kd1 = 2.5;
 kd10 = 4;
 kd13 = 1.2;
 kd14 = 0.677142;
 kd2 = 0.18;
 kd3 = 1.54914;
 kd4 = 0.54394;
 kd5 = 6.0744;
 kd6 = 4;
 kd7 = 2;
 kd8 = 2;
 kd9 = 2;
 kdL = 1.667;
 kdp1 = 0.9;
 kdp2 = 0.0482085;
 kdp3 = 0.0630953;
 kdp4 = 0.0630729;
 kdpos1 = 0.19;
 kdpos2 = 0.13;
 kdpos3 = 0.063;
 kdpos4 = 1.7;
 kpos1 = 8.7;
 kpos2 = 4.7;
 kpos3 = 1.3;
 kpos4 = 0.027;
l2 = 39.6985;
l1 = 39.6985;
 mcs = 0.98503;
 mdts = 1.63004;
 v1 = 3.59761;
 v2 = 97.2604;
 v2_basal = 0.00102329;
 v3 = 64.0838;
 v4 = 10.5897;
 v5 = 4.56956;
 v7 = 150.28;
 v8 = 45.7615;
 v9 = 386.545;
 v_L_frq = 6.56773;
 v_L_mc = 1.59723;
 v_L_mdt = 2.3022;
 v_L_vvd = 1.07594;
 v_basal = 0.144031;
 v_fd = 0.804693;
 vvds = 1.13593;
f_del_vvd=0;

%%
Mw = x(1);
Wd = x(2);
Wdp = x(3);
Wl = x(4);
Wlp = x(5);
Wl_Wl = x(6);
Wl_Wlp = x(7);
Wl_Vl = x(8);
Wl_Vlp = x(9);
Mv = x(10);
Vd = x(11);
Vl = x(12);
Vl_Vl = x(13);
Mf = x(14);
Fi = x(15);
Fi1 = x(16);
Fi2 = x(17);
Fi3 = x(18);
Fi4 = x(19);
Fi5 = x(20);
Fa = x(21);
Cp = x(22);
Mdt = x(23);
L_frq = x(24);
L_vvd = x(25);
L_mc = x(26);
L_mdt = x(27);


%Wm
dxdt(1)=v_basal+k1*(Wl_Wl/(K1+Wl_Wl))*(Kcp1/(Kcp1+Cp))-kd1*Mw;

%Wd
dxdt(2)=k2*Mw -l1*light*Wd+k3*Wl+k4*Wl_Wl+k5*Wl_Vl-kpos1*(Wd*Fa/(Kpos1+Wd))+kdpos1*Wdp -kd2*Wd;

%Wdp
dxdt(3)=kpos1*(Wd*Fa/(Kpos1+Wd))-kdpos1*Wdp-kdp1*Wdp -l1*light*Wdp+k3*Wlp+k4*Wl_Wlp+k5*Wl_Vlp;

%Wl
dxdt(4)=l1*light*Wd -k3*Wl -k6*(Wl^2) +k7*Wl_Wl +k8*Wl_Vl -k9*Wl*Vl -kpos2*(Wl*Fa/(Kpos2+ Wl))+kdpos2*Wlp-kd3*Wl;

%wlp
dxdt(5)=kpos2*(Wl*Fa/(Kpos2+ Wl))-kdpos2*Wlp-kdp2*Wlp+l1*light*Wdp -k3*Wlp -k6*(Wlp^2) +k7*Wl_Wlp+k8*Wl_Vlp -k9*Wlp*Vl;

%Wl_Wl
dxdt(6)=k6*(Wl^2)-k7*Wl_Wl-k4*Wl_Wl-kpos3*(Wl_Wl*Fa/(Kpos3 +Wl_Wl))+kdpos3*Wl_Wlp-kd4*Wl_Wl;

%Wl_Wlp

dxdt(7)=kpos3*(Wl_Wl*Fa/(Kpos3 +Wl_Wl)) -kdpos3*Wl_Wlp -kdp3*Wl_Wlp+k6*(Wlp^2)-k7*Wl_Wlp-k4*Wl_Wlp;

%Wl_Vl

dxdt(8)=k9*Wl*Vl -k8*Wl_Vl -k5*Wl_Vl -kpos4*(Wl_Vl*Fa/(Kpos4 + Wl_Vl))+kdpos4*Wl_Vlp-kd5*Wl_Vl; 

%Wl_Vlp
dxdt(9)=kpos4*(Wl_Vl*Fa/(Kpos4 + Wl_Vl))-kdpos4*Wl_Vlp-kdp4*Wl_Vlp+k9*Wlp*Vl-k8*Wl_Vlp-k5*Wl_Vlp;                                                                                                                          

%Mv

dxdt(10)=f_del_vvd*(v1*(Wd/(K2+Wd))+v1*(Wl/(K2+Wl))+v2*(Wl_Wl/(K3+ Wl_Wl))+v1*(Wl_Vl/(K2+Wl_Vl))-kd6*Mv);

%Vd

dxdt(11)=v3*Mv  + k10*Vl - l2*light*Vd -kd7*Vd;

%Vl

dxdt(12)=l2*light*Vd -k10*Vl +k11*Vl_Vl -k12*(Vl^2)-kd8*Vl+k8*Wl_Vl-k9*Wl*Vl+k5*Wl_Vl+k8*Wl_Vlp-k9*Wlp*Vl+k5*Wl_Vlp;

%Vl_Vl

dxdt(13)=k12*(Vl^2)-k11*Vl_Vl -kd9*Vl_Vl;
%Mf
dxdt(14)=v4*(Wd/(K4+Wd)) + v4*(Wl/(K4+Wl))+ v5*(Wl_Wl/(K5+Wl_Wl))+ v4*(Wl_Vl/(K4+Wl_Vl))-kd10*Mf;
%fi
dxdt(15)=k_f*Mf - v_fd*Fi;
dxdt(16)=k_c*(Fi - Fi1);
dxdt(17)=k_c*(Fi1 - Fi2);
dxdt(18)=k_c*(Fi2 - Fi3);
dxdt(19)=k_c*(Fi3 - Fi4);
dxdt(20)=k_c*(Fi4 - Fi5);

%faFa
dxdt(21)=k_c*Fi5 - k_n*Fa;
%mc
dxdt(22)=v7*(Wd/(K6+Wd))*(Kcp2/(Cp + Kcp2))+v7*(Wl/(K6+Wl))*(Kcp2/(Cp + Kcp2))+v8*(Wl_Wl/(K7+Wl_Wl))*(Kcp3/(Cp + Kcp3))+v7*(Wl_Vl/(K6+Wl_Vl))*(Kcp2/(Cp + Kcp2))- kd13*Cp;
%
dxdt(23)=v2_basal+v9*(Kcp4/(Cp+Kcp4))-kd14*Mdt;

dxdt(24) = frqs*(v_L_frq*((Wl*v4)/(K4 + Wl) + (Wl_Vl*v4)/(K4 + Wl_Vl) + (Wl_Wl*v5)/(K5 + Wl_Wl) + (Wd*v4)/(K4 + Wd))) - L_frq*kdL;
dxdt(25) = vvds*(v_L_vvd*((Wd*v1)/(K2 + Wd) + (Wl*v1)/(K2 + Wl) + (Wl_Vl*v1)/(K2 + Wl_Vl) + (Wl_Wl*v2)/(K3 + Wl_Wl))) - L_vvd*kdL;
dxdt(26) = mcs*(v_L_mc*((Kcp2*Wd*v7)/((K6 + Wd)*(Cp + Kcp2)) + (Kcp2*Wl*v7)/((K6 + Wl)*(Cp + Kcp2)) + (Kcp2*Wl_Vl*v7)/((K6 + Wl_Vl)*(Cp + Kcp2)) + (Kcp3*Wl_Wl*v8)/((K7 + Wl_Wl)*(Cp + Kcp3)))) - L_mc*kdL;
dxdt(27) = mdts*(v_L_mdt*(v2_basal + (Kcp4*v9)/(Cp + Kcp4))) - L_mdt*kdL;

