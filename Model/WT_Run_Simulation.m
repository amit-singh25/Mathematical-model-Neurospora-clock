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

%%%%%%%% Plot model Simulation
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
ylabel('Expression(a.u.)');xlabel('Time(h)');

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
%%%%%%%Figure-5
lt=[  0.005 0.01 0.05 0.1 0.5 1 2 3 4 5];

frq=[4.46 5.10 11.30 14.0888  17.9525 18.6955 19.0592 19.1615 19.2046 19.2258];
vvd=[1.87 2.36 9.248 16.3840  36.5804 43.1775 47.4504 48.9057 49.5369 49.8396];

plot(lt,frq, '.-b', 'LineWidth', 2,'MarkerSize',36);
hold on 
plot(lt,vvd, '.-r', 'LineWidth', 2,'MarkerSize',18);
Legend('\itfrq','\itvvd')

%%%%%%%%%%%% SFig-2A) Simulated response of reporters to 10 repetitive LD cycles.
%%% SFig-2B) can be simulated 
T=24;
start=[72+T 72+2*T 72+3*T 72+4*T 72+5*T 72+6*T 72+7*T 72+8*T 72+9*T 72+10*T];
width=[12 12 12 12 12 12 12 12 12 12];
height=[1 1 1 1 1 1 1 1 1 1]*0.5;
signals=[start;width;height];
tspan=[0 400];
options = odeset('RelTol',eps);
%options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.01);
[t,y]=ode15s(@DL_model,tspan,x_ini,options,signals);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(t,y(:,24),'LineWidth', 3);
title('\it{frq}')
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;xlabel('Time[h]');ylabel('Expression [a.u]');
subplot(2,2,2)
plot(t,y(:,25),'LineWidth', 3);
title('\it{vvd}')
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;xlabel('Time[h]');ylabel('Expression [a.u]');
subplot(2,2,3)
title('\it{csp-1}')
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;xlabel('Time[h]');ylabel('Expression [a.u]');
subplot(2,2,4)
title('\it{fam-3}')
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;xlabel('Time[h]');ylabel('Expression [a.u]');

























