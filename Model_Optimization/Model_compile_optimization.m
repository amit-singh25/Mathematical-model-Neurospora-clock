%%%
close all 
clear all
addpath('matlap_d2d/d2d-master/arFramework3')
arInit;
%%%
arLoadModel('DL_model');
arLoadData('DL_final_data');
arLoadData('Delta_DL_model-final_data');
arCompileAll;
%
%
ar.config.useEvents = 1;
ar.config.fiterrors = -1;
arFindInputs;
ar.lb(:)   = -3;
ar.ub(:)   = 3;

arSave('new_comp')

arLoad(1)

arFindInputs;

arSetPars('kdL', log10(1.667),0);
arSetPars('kd1' ,log10(2.5),0);
arSetPars('kd2' ,log10(0.18),0);

%vvd degrad
arSetPars('kd6' ,log10(4),0);
arSetPars('kd7' ,log10(2),0);
arSetPars('kd8' ,log10(2),0);
arSetPars('kd9' ,log10(2),0);
%%mrnaFrq degrad
arSetPars('kd10',log10(4),0);

%arSetPars('K1',log10(0.2),0);
%arSetPars('Kcp1',log10(1.7),0);
%arSetPars('v_basal',log10(17),0);
%arSetPars('k1',log10(12),0);



 
%WCC_phospho_degardation
arSetPars('kdp1',[],[],[],-1.3, -1.2);
arSetPars('kdp2',[],[],[],-1.3, -1.2);
arSetPars('kdp3',[],[],[],-1.3, -1.2);
arSetPars('kdp4',[],[],[],-1.3, -1.2);

%photoaductdecay
arSetPars('k3',[],[],[],-1,0.5);
arSetPars('k4',[],[],[],-1,0.5);
arSetPars('k5',[],[],[],-1,0.5);

% hill co.eff
arSetPars('n1', [],[],[], log10(1),log10(4)); 
arSetPars('n2', [],[],[], log10(1),log10(4)); 
arSetPars('n3', [],[],[], log10(1),log10(4)); 
arSetPars('n4', [],[],[], log10(1),log10(4)); 

%conversion monomer to dimer 
arSetPars('k6',[],[],[],0, 3);
arSetPars('k7',[],[],[],0, 3);

arSetPars('k8',[],[],[],-2, 2);
arSetPars('k9',[],[],[],-2, 2);
arSetPars('k10',[],[],[],-2, 2);
arSetPars('k11',[],[],[],-2, 2);
arSetPars('k12',[],[],[],-2, 2);


%degrdation of wcc monomer to dimer
arSetPars('kd3',[],[],[],-2, 2);
arSetPars('kd4',[],[],[],-2, 2);
arSetPars('kd5',[],[],[],-2, 2);

%Frq protein
arSetPars('v_fd',[], [], [],log10(0.693/5),log10(0.693/(1/60)));%Frq protein_degradation
arSetPars('k_c',[],[],[], log10(0.693/3), log10(0.693/(1/60)));%translation Frq protein(active
arSetPars('k_n',[],[],[], log10(0.693/5), log10(0.693/(1)));


arSetPars('kdpos1',[],[],[],-2, 2);
arSetPars('kdpos2',[],[],[],-2, 2);
arSetPars('kdpos3',[],[],[],-2, 2);
arSetPars('kdpos4',[],[],[],-2, 2);



arSetPars('kpos1',[],[],[],-2, 2);
arSetPars('kpos2',[],[],[],-2,2);
arSetPars('kpos3',[],[],[],-2, 2);
arSetPars('kpos4',[],[],[],-2, 2);

arSetPars('Kcp1',[],[],[],-2, 2);
arSetPars('Kcp2',[],[],[],-2, 2);
arSetPars('Kcp3',[],[],[],-2, 2);
arSetPars('Kcp4',[],[],[],-2, 2);





%%%%%
arSetPars('kd13', [],[],[], log10(0.693/1.2),log10(0.693/0.0833));%csp1degradation
arSetPars('kd14', [],[],[], log10(0.693/1.2),log10(0.693/0.3)); %% desat% degadation


arSetPars('init_Wd',[],[],[],-2,2);
arSetPars('init_Wdp',[],[],[],-2,2);
arSetPars('init_Wl',[],[],[],-2,2);
arSetPars('init_Wlp',[],[],[],-2,2);
arSetPars('init_Wl_Wl',[],[],[],-2,2);
arSetPars('init_Wl_Wlp',[],[],[],-2,2);
arSetPars('init_Wl_Vl',[],[],[],-2,2);
arSetPars('init_Wl_Vlp',[],[],[],-2,2);
arSetPars('init_Mv',[],[],[],-2,2);
arSetPars('init_Vd',[],[],[],-2,2);
arSetPars('init_Vl',[],[],[],-2,2);
arSetPars('init_Vl_Vl',[],[],[],-2,2);
arSetPars('init_Mf',[],[],[],-2,2);
arSetPars('init_Mv' ,[],[],[],-2,2);
arSetPars('init_Fa' ,[],[],[],-2,2);
arSetPars('init_Fi' ,[],[],[],-2,2);
arSetPars('init_Fi1' ,[],[],[],-2,2);
arSetPars('init_Fi2' ,[],[],[],-2,2);
arSetPars('init_Fi3',[],[],[],-2,2);
arSetPars('init_Fi4',[],[],[],-2,2);
arSetPars('init_Fi5' ,[],[],[],-2,2);
arSetPars('init_Cp' ,[],[],[],-2,2);
arSetPars('init_Mdt',[],[],[],-2,2);
arSetPars('dCp_in',[],[],[],-2,2);
arSetPars('dFa_in',[],[],[],-2,2);
arSetPars('dFi1_in',[],[],[],-2,2);
arSetPars('dFi2_in',[],[],[],-2,2);
arSetPars('dFi3_in',[],[],[],-2,2);
arSetPars('dFi4_in',[],[],[],-2,2);
arSetPars('dFi5_in',[],[],[],-2,2);
arSetPars('dMdt_in',[],[],[],-2,2);
arSetPars('dMf_in',[],[],[],-2,2);
arSetPars('dWd_in',[],[],[],-2,2);
arSetPars('dWdp_in',[],[],[],-2,2);;
arSetPars('dWl_Wl_in',[],[],[],-2,2);
arSetPars('dWl_Wlp_in',[],[],[],-2,2);
arSetPars('dWl_in',[],[],[],-2,2);
arSetPars('dWlp_in',[],[],[],-2,2);

%
collectfun = arFitLhsBwCluster(700)
                                                                                        
                                                                                        
%% run the results script
%collect function 
% select the min chi2 value 
[chi2min,imin] = min(ar.chi2s + ar.chi2sconstr);
ar.p = ar.ps(imin,:);

arSave('final_output')


