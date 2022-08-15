function dxdt = DL_model(t,x,signals)
dxdt = zeros(size(x));%
light=m_pulses(t,signals);
%light=0;
p = struct;
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
 dCp_in = 1.34316;
 dFa_in = 0.375514;
 dFi1_in = 16.9682;
 dFi2_in = 4.88676;
 dFi3_in = 0.756205;
 dFi4_in = 0.134454;
 dFi5_in = 22.5794;
 dFi_in = 0.00384622;
 dMdt_in = 0.0131978;
 dMf_in = 0.01;
 dWd_in = 9.9986;
 dWdp_in = 0.299799;
 dWl_Wl_in = 0.0100015;
 dWl_Wlp_in = 0.0937191;
 dWl_in = 0.0789666;
 dWlp_in = 0.101956;
 dfrq_in = 2.49607;
 dmc_in = 4.37139;
 dmdt_in = 3.20728;
 dvvd_in = 3.62173;
 frq_in = 0.993465;
 frqs = 0.954569;
 init_Cp = 1.01288;
 init_Fa = 13.8141;
 init_Fi = 0.715077;
 init_Fi1 = 0.72702;
 init_Fi2 = 0.677474;
 init_Fi3 = 7.10027;
 init_Fi4 = 24.7058;
 init_Fi5 = 2.54884;
 init_Mdt = 7.289;
 init_Mf = 1.32394;
 init_Mv = 0.425304;
 init_Vd = 0.0528963;
 init_Vl = 9.99969;
 init_Vl_Vl = 4.81689;
 init_Wd = 9.99991;
 init_Wdp = 2.85547;
 init_Wl = 0.0293244;
 init_Wl_Vl = 6.23369;
 init_Wl_Vlp = 19.4452;
 init_Wl_Wl = 0.0174543;
 init_Wl_Wlp = 0.0100075;
 init_Wlp = 0.01;
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
 %kd2 = 0.08;
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
%l2 =0;
%l1 = 0;
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
 vvd_in = 2.19901;
 vvds = 1.13593;

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

%//Wm
dxdt(1) =v_basal +k1*(Wl_Wl/(K1+Wl_Wl))*(Kcp1/(Kcp1+Cp)) -kd1*Mw;

%wd
dxdt(2)=k2*Mw -l1*light*Wd +k3*Wl +k4*Wl_Wl+k5*Wl_Vl -kpos1*(Wd*Fa/(Kpos1+Wd)) +kdpos1*Wdp -kd2*Wd;

%wdp
dxdt(3)=kpos1*(Wd*Fa/(Kpos1+Wd)) -kdpos1*Wdp -kdp1*Wdp -l1*light*Wdp +k3*Wlp +k4*Wl_Wlp +k5*Wl_Vlp;

%wl
dxdt(4)=l1*light*Wd -k3*Wl -k6*(Wl^2) +k7*Wl_Wl +k8*Wl_Vl -k9*Wl*Vl -kpos2*(Wl*Fa/(Kpos2+ Wl)) +kdpos2*Wlp -kd3*Wl;

%wlp
dxdt(5)=kpos2*(Wl*Fa/(Kpos2+ Wl)) -kdpos2*Wlp -kdp2*Wlp +l1*light*Wdp -k3*Wlp -k6*(Wlp^2) +k7*Wl_Wlp +k8*Wl_Vlp -k9*Wlp*Vl;

%wl_wl
dxdt(6)=k6*(Wl^2) -k7*Wl_Wl -k4*Wl_Wl -kpos3*(Wl_Wl*Fa/(Kpos3 +Wl_Wl)) +kdpos3*Wl_Wlp -kd4*Wl_Wl;

%wl_wlp
dxdt(7)=kpos3*(Wl_Wl*Fa/(Kpos3 +Wl_Wl)) -kdpos3*Wl_Wlp -kdp3*Wl_Wlp +k6*(Wlp^2) -k7*Wl_Wlp -k4*Wl_Wlp;

%wl_vl
dxdt(8)=k9*Wl*Vl -k8*Wl_Vl -k5*Wl_Vl -kpos4*(Wl_Vl*Fa/(Kpos4 + Wl_Vl)) +kdpos4*Wl_Vlp -kd5*Wl_Vl;

%wl_vlp
dxdt(9)=kpos4*(Wl_Vl*Fa/(Kpos4 + Wl_Vl)) -kdpos4*Wl_Vlp -kdp4*Wl_Vlp +k9*Wlp*Vl -k8*Wl_Vlp -k5*Wl_Vlp;      

%mv
dxdt(10)=v1*(Wd/(K2+Wd)) +v1*(Wl/(K2+Wl)) +v2*(Wl_Wl/(K3+ Wl_Wl)) +v1*(Wl_Vl/(K2+Wl_Vl))-kd6*Mv;

%vd
dxdt(11)=v3*Mv  + k10*Vl - l2*light*Vd -kd7*Vd;

%vl
dxdt(12)=l2*light*Vd -k10*Vl +k11*Vl_Vl -k12*(Vl^2) -kd8*Vl +k8*Wl_Vl -k9*Wl*Vl +k5*Wl_Vl +k8*Wl_Vlp -k9*Wlp*Vl +k5*Wl_Vlp;

%vl_vl
dxdt(13)=k12*(Vl^2) -k11*Vl_Vl -kd9*Vl_Vl;

%mf
dxdt(14)=v4*(Wd/(K4+Wd)) + v4*(Wl/(K4+Wl)) +v5*(Wl_Wl/(K5+Wl_Wl)) +v4*(Wl_Vl/(K4+Wl_Vl)) -kd10*Mf;

%%Fi1 series
dxdt(15)=k_f*Mf -v_fd*Fi;
dxdt(16)=k_c*(Fi -Fi1);
dxdt(17)=k_c*(Fi1 -Fi2);
dxdt(18)=k_c*(Fi2 -Fi3);
dxdt(19)=k_c*(Fi3 -Fi4);
dxdt(20)=k_c*(Fi4 -Fi5);

%fa
dxdt(21)=k_c*Fi5 -k_n*Fa;

%cp
dxdt(22)=v7*(Wd/(K6+Wd))*(Kcp2/(Cp + Kcp2)) +v7*(Wl/(K6+Wl))*(Kcp2/(Cp + Kcp2)) +v8*(Wl_Wl/(K7+Wl_Wl))*(Kcp3/(Cp + Kcp3)) +v7*(Wl_Vl/(K6+Wl_Vl))*(Kcp2/(Cp + Kcp2))- kd13*Cp;

%mdt
dxdt(23)=v2_basal +v9*(Kcp4/(Cp+Kcp4)) -kd14*Mdt;

%fitting
dxdt(24)=v_L_frq*(v4*(Wd/(K4+Wd)) +v4*(Wl/(K4+Wl)) +v5*(Wl_Wl/(K5+Wl_Wl)) +v4*(Wl_Vl/(K4+Wl_Vl))) -kdL*L_frq;

dxdt(25)=v_L_vvd*(v1*(Wd/(K2+Wd)) +v1*(Wl/(K2+Wl)) +v2*(Wl_Wl/(K3+ Wl_Wl)) +v1*(Wl_Vl/(K2+Wl_Vl))) -kdL*L_vvd;

dxdt(26)=v_L_mc*(v7*(Wd/(K6+Wd))*(Kcp2/(Cp + Kcp2)) +v7*(Wl/(K6+Wl))*(Kcp2/(Cp + Kcp2)) +v8*(Wl_Wl/(K7+Wl_Wl))*(Kcp3/(Cp+ Kcp3)) +v7*(Wl_Vl/(K6+Wl_Vl))*(Kcp2/(Cp + Kcp2))) -kdL*L_mc;

dxdt(27) =v_L_mdt*(v2_basal +v9*(Kcp4/(Cp+Kcp4))) -kdL*L_mdt;



