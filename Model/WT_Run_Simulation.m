%%%%%%%%%%%%%%%Initail condition 

frq_in = 0.993465;init_Cp =1.01288;init_Fa = 13.8141;init_Fi = 0.715077;
init_Fi1 = 0.72702;init_Fi2 = 0.677474;init_Fi3 = 7.10027;init_Fi4 = 24.7058;init_Fi5 = 2.54884;
init_Mdt = 7.289;init_Mf = 1.32394;init_Mv = 0.425304;init_Vd = 0.0528963;
init_Vl = 9.99969;init_Vl_Vl = 4.81689;init_Wd = 9.99991;init_Wdp = 2.85547;
init_Wl = 0.0293244;init_Wl_Vl = 6.23369;init_Wl_Vlp = 19.4452;init_Wl_Wl = 0.0174543;init_Wl_Wlp = 0.0100075;
init_Wlp = 0.01;mc_in = 1.87084;mdt_in = 4.89541;
init_Mw = 0.144031/2.5;vvd_in = 2.19901;

x_ini=[init_Mw init_Wd init_Wdp init_Wl init_Wlp init_Wl_Wl init_Wl_Wlp init_Wl_Vl init_Wl_Vlp init_Mv init_Vd init_Vl init_Vl_Vl init_Mf init_Fi init_Fi1 init_Fi2 init_Fi3 init_Fi4 init_Fi5 init_Fa init_Cp init_Mdt frq_in vvd_in mc_in mdt_in];
%%%%%%%%%%%%%%%%signal input Switched on at 72 Hr
start=[72 72+24];
width=[12 12];
height=[0.5 0.5];
signals=[start;width;height];
tspan=[0 200];
options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.001);

%%% solving equations
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);

%%%%%%%% plot model simultaion
subplot(2,2,1);
plot(t,y(:,24),'LineWidth', 2);
legend('\it Frq')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression[a.u]');xlabel('Time (h)');

subplot(2,2,2);
plot(t,y(:,25),'LineWidth', 2);
legend('\it Vvd')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression(a.u.)');xlabel('Time (h)');

subplot(2,2,3);
plot(t,y(:,26),'LineWidth', 2);
legend(' \it csp-1')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression(a.u.)');xlabel('Time (h)');

subplot(2,2,4);
plot(t,y(:,25),'LineWidth', 2);
legend(' \it Fam-3')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression(a.u.)');xlabel('Time (h)');

set(gcf, 'Units', 'Inches', 'Position', [0, 0, 9.25, 9.125], 'PaperUnits', 'Inches', 'PaperSize', [9.25, 9.125])
saveas(gcf,'fig1.pdf')
h4=figure;
set(h4,'PaperSize',[20 10]); %set the paper size to what you want  
print(h4,'Figure-3','-dpdf')

%Figure-4B
subplot(2,2,1);
plot(t,(y(:,15)+y(:,16)+y(:,17)+y(:,18)+y(:,19)+y(:,20)+y(:,21)),'LineWidth', 3);
title('Total FRQ')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
title ('\it frq','FontSize',24,'position',[10 18 2]);

%%%mrnafrq-frq,ffc
subplot(2,2,2);
plot(t,(y(:,14)),'LineWidth', 3);
hold on 
plot(t,(y(:,15)),'LineWidth', 3);
hold on 
plot(t,(y(:,21)),'LineWidth', 3);
legend('mRNAfrq','FRQ','FFC')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;

set(gcf, 'Units', 'Inches', 'Position', [0, 0, 9.25, 9.125], 'PaperUnits', 'Inches', 'PaperSize', [9.25, 9.125])
saveas(gcf,'fig1.pdf')
h4=figure;
set(h4,'PaperSize',[20 10]); %set the paper size to what you want  
print(h4,'Figure-4B','-dpdf')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%light induction plot %%%%%%%%%%


lt=[  0.005 0.01 0.05 0.1 0.5 1 2 3 4 5];

frq=[4.46 5.10 11.30 14.0888  17.9525 18.6955 19.0592 19.1615 19.2046 19.2258];
vvd=[1.87 2.36 9.248 16.3840  36.5804 43.1775 47.4504 48.9057 49.5369 49.8396];

plot(lt,frq, '.-b', 'LineWidth', 2,'MarkerSize',36);
hold on 
plot(lt,vvd, '.-r', 'LineWidth', 2,'MarkerSize',18);
Legend('\itfrq','\itvvd')



lt=[0.005,0.01 0.05 0.1 0.5 1 2 3 4 5 ];
dfrq=[4.0580 4.77 9.47 12.4498 16.6838 17.5500 18.0257 18.1781 18.2452 18.2782];
dvvd=[2.09 2.213  8.47 16.0396 39.8637 47.9542 53.2240 55.0283 55.8154 56.1952];

plot(lt,dfrq, '.-b', 'LineWidth', 2,'MarkerSize',36);
hold on 
plot(lt,dvvd, '.-r', 'LineWidth', 2,'MarkerSize',36);
Legend('\itfrq','\itvvd')

%%%%%%%%%%%%

T=24;
start=[72+T 72+2*T 72+3*T 72+4*T 72+5*T 72+6*T 72+7*T 72+8*T 72+9*T 72+10*T];
width=[12 12 12 12 12 12 12 12 12 12];
height=[1 1 1 1 1 1 1 1 1 1]*0.5;
signals=[start;width;height];
tspan=[0 1000];
options = odeset('RelTol',eps);
%options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.01);
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);
plot(t,y(:,24),'LineWidth', 3);

T=24;
start=[72 100+3*T 100+4*T 100+5*T 100+6*T 100+7*T];
width=[12 12 12 12 12 12];
height=[1 1 1 1 1 1]*0.5;
options = odeset('RelTol',eps);
signals=[start;width;height];
tspan=[0 350];
%options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.01);
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);

xlim([0,350])
subplot(2,2,3)
xlim([0,350])
subplot(2,2,4)
xlim([0,350])
subplot(2,2,2)
xlim([0,350])

subplot(2,2,1)
xlim([0,350])
xticks([0:48:350]);
subplot(2,2,2)
xticks([0:48:350]);
subplot(2,2,3)
xticks([0:48:350]);
subplot(2,2,4)
xticks([0:48:350]);
title('\it{fam-3}')
subplot(2,2,3)
title('\it{csp-1}')
subplot(2,2,2)
title('\it{vvd}')
subplot(2,2,1)
title('\it{frq}')
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
subplot(2,2,2)
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
subplot(2,2,3)
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
subplot(2,2,4)
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
xlabel('Time[h]')
subplot(2,2,3)
xlabel('Time[h]')
ylabel('Expression [a.u]')
subplot(2,2,1)
ylabel('Expression [a.u]')
subplot(2,2,4)
xlabel('Time[h]')
%%%%%%%%%%%


%all wcc
subplot(2,2,1);
plot(t,(y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9)),'LineWidth', 3);
%title('Total WCC')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
hold on 
plot(t,(y(:,3)+y(:,5)+y(:,7)+y(:,9)),'LineWidth', 3);
plot(t,(y(:,2)+y(:,4)+y(:,6)+y(:,8)),'LineWidth', 3);
ylabel('Expression[a.u]')
legend('Total WCC', 'Total WCCp','TotalWCCup')
%all wcc phos
subplot(2,2,2);
plot(t,(y(:,11)+y(:,12)+y(:,13)),'LineWidth', 3);
hold on
plot(t,(y(:,12)+y(:,13)),'LineWidth', 3);
legend('Total VVD','Total VVD(light)')
%title('Total WCC Phosphoraltion')

xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression[a.u]')
 
%all frq
subplot(2,2,3);
plot(t,(y(:,15)+y(:,16)+y(:,17)+y(:,18)+y(:,19)+y(:,20)+y(:,21)),'LineWidth', 3);
title('Total FRQ')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;

subplot(2,2,4);
plot(t,(y(:,14)),'LineWidth', 3);
hold on 
plot(t,(y(:,15)),'LineWidth', 3);
hold on 
plot(t,(y(:,21)),'LineWidth', 3);

plot(t,10*(y(:,14)),'LineWidth', 3);
legend('mRNAfrq','FRQ','FFC','10XmRNAfrq')

























%%%%%%%%%prcsetup%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.001);
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);

subplot(5, 3, 1);
start=[72 87];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
tspan=[0 220];
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);
plot(t,y(:,24),'LineWidth', 3);
format shortG
[~,peaklocs] = findpeaks(y(:,24));
peaklocs/1000
hold on
plot(t,m_pulses(t,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([72 216]);
hold off

%%%%%%%%%%%%%%%%%%%%%% 90h
subplot(5, 3, 2);
start=[72 90];
width=[12 0.1667];
height=[0.5 20];
signals=[start;width;height];
[t1,y1]=ode15s(@DL_model,tspan,x_ini,options,signals);
[l1,peaklocs1] = findpeaks(y1(:,24));
peaklocs1/1000
plot(t,y(:,24),'LineWidth', 3);

hold on
plot(t1,y1(:,24),'LineWidth', 3);
plot(t1,m_pulses(t1,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([84 216])
hold off
%%%%%%%%%%%%%%%%%%%%%%%93h
subplot(5, 3, 3);
start=[72 93];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t2,y2]=ode15s(@DL_model,tspan,x_ini,options,signals);
[l2,peaklocs2] = findpeaks(y2(:,24));
peaklocs2/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t2,y2(:,24),'LineWidth', 3);
plot(t2,m_pulses(t2,signals),'LineWidth', 3);
ylim([0 7]);
xlim([84 216]);
xticks([12:12:216]);
hold off

%%%%%%%%%%%%%%%%%%%%96
subplot(5, 3, 4);
start=[72 96];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t3,y3]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y3(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t3,y3(:,24),'LineWidth', 3);
plot(t3,m_pulses(t3,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([84 216]);
hold off

%%%%%%%%%%%%%%%%%%%%%99h
subplot(5, 3, 5);
start=[72 99];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t4,y4]=ode15s(@DL_model,tspan,x_ini,options,signals);plot(t,y(:,24),'LineWidth', 3);
[~,peaklocs] = findpeaks(y4(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t4,y4(:,24),'LineWidth', 3);
plot(t4,m_pulses(t4,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([84 216]);
hold off

%%%%%%%%%%%%%%%%%%%%%%%99h
subplot(5,3,6);
start=[72 102];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t5,y5]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y5(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t5,y5(:,24),'LineWidth', 3);
xticks([12:12:216]);
xlim([84 216]);
ylim([0 7]);
plot(t5,m_pulses(t5,signals),'LineWidth', 3);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%105h
subplot(5,3,7);
start=[72 105];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t6,y6]=ode15s(@DL_model,tspan,x_ini,options,signals);
plot(t,y(:,24),'LineWidth', 3);
[~,peaklocs] = findpeaks(y6(:,24));
peaklocs/1000
hold on
plot(t6,y6(:,24),'LineWidth', 3);
plot(t6,m_pulses(t6,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%108h
subplot(5,3,8);
start=[72 108];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t7,y7]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y7(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t7,y7(:,24),'LineWidth', 3);
plot(t7,m_pulses(t7,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([84 216]);
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%111hh
subplot(5,3,9);
start=[72 111];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t8,y8]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y8(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t8,y8(:,24),'LineWidth', 3);
plot(t8,m_pulses(t8,signals),'LineWidth', 3);
xticks([12:12:216]);
ylim([0 7]);
xlim([84 216]);
hold off
%%%%%%%%%%%%%%%%%%%%%%%%114h
subplot(5,3,10);
start=[72 114];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t9,y9]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y9(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t9,y9(:,24),'LineWidth', 3);
plot(t9,m_pulses(t9,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off


%%%%%%%%%%%%%%%%%%%%%%%%117h
subplot(5,3,11);
start=[72 117];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t10,y10]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y10(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t10,y10(:,24),'LineWidth', 3);
plot(t10,m_pulses(t10,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off


%%%%%%%%%%%%%%%%%%%%%%%%120h
subplot(5,3,12);
start=[72 120];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t11,y11]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y11(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t11,y11(:,24),'LineWidth', 3);
plot(t11,m_pulses(t11,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off


%%%%%%%%%%%%%%%%%%%%%%%%123h
subplot(5,3,13);
start=[72 123];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t12,y12]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y12(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t12,y12(:,24),'LineWidth', 3);
plot(t12,m_pulses(t12,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%126h
subplot(5,3,14);
start=[72 126];
width=[12 0.0167];
height=[0.5 20];
signals=[start;width;height];
[t13,y13]=ode15s(@DL_model,tspan,x_ini,options,signals);
[~,peaklocs] = findpeaks(y13(:,24));
peaklocs/1000
plot(t,y(:,24),'LineWidth', 3);
hold on
plot(t13,y13(:,24),'LineWidth', 3);
plot(t13,m_pulses(t13,signals),'LineWidth', 3);
ylim([0 7]);
xticks([12:12:216]);
xlim([84 216]);
hold off




%saveas(gcf,'one_secprc.fig')

%%%%%%%%%%3
fig = gcf;
fig.PaperPositionMode = 'auto'
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];
print(fig,'light-tit','-dpdf')

%frq=[0 6.9591 13.0384 14.2385  14.7799 14.9033 14.9453 14.9648 14.9762 14.9837 14.9888 14.9923 14.9948];
%vvd=[0 4.6861 24.9672 37.3707 46.9031 50.5906 52.3708 53.3237 53.8648  54.1844 54.3791  54.5013 54.5803];






%%%%%%%%%%
title('\it frq','FontSize',24,'position',[4 18 2],'FontWeight','normal');
 hLeg = legend('6 steps (model)')
 set(hLeg,'visible','off')
 
 title('\it frq','FontSize',24,'position',[20 15 5],'FontWeight','normal');
 
 hText =  text(120,8,'FRQ->->->->->->FFC','Color','green','FontSize',14)
 delete(hText);
 
 
 %%%%% set height 
 hAxis(1) = subplot( 2, 2, 3 ) ;
 pos = get( hAxis(1), 'Position');
 pos(2) = 0.1800;
 set(hAxis(1), 'Position', pos ) ;
  
hAxis(2) = subplot( 2, 2, 4) ;
pos = get( hAxis(2), 'Position');
pos(2) = 0.1800;
 set(hAxis(2), 'Position', pos ) ;
 
 %%%%%%
 
hAxis(3) = subplot( 2, 2, 2 ) ;
pos = get( hAxis(3), 'Position');
pos(1) = 0.5000;
set(hAxis(3), 'Position', pos ) ;
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
 
hAxis(4) = subplot( 2, 2, 4) ;
pos = get( hAxis(4), 'Position');
pos(1) = 0.5000;
set(hAxis(4), 'Position', pos ) ;
set(gca,'YTickLabel',[]);
 
 hAxis(3) = subplot( 2, 2, 1 ) ;
 set(gca,'XTickLabel',[]);
 
 
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 9.25, 9.125], 'PaperUnits', 'Inches', 'PaperSize', [9.25, 9.125])
saveas(gcf,'fig1.pdf')
h4=figure;
set(h4,'PaperSize',[20 10]); %set the paper size to what you want  
print(h4,'filename','-dpdf')
 
 
 