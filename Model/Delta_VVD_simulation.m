%wt setupinitial condition
dCp_in = 1.34316;dFa_in = 0.375514;dFi1_in = 16.9682;dFi2_in = 4.88676;dFi3_in = 0.756205;
dFi4_in = 0.134454;dFi5_in = 22.5794;dFi_in = 0.00384622;dMdt_in = 0.0131978;dMf_in = 0.01;
dWd_in = 9.9986;dWdp_in = 0.299799;dWl_Wl_in = 0.0100015;dWl_Wlp_in = 0.0937191;dWl_in = 0.0789666;
dWlp_in = 0.101956;dfrq_in = 2.49607;dmc_in = 4.37139;dmdt_in = 3.20728;dvvd_in = 3.62173;
init_Mw=0.144031/2.5;d_Wl_Vl=0; d_Wl_Vlp=0; d_Mv=0; d_Vd=0; d_Vl=0; d_Vl_Vl=0;

%x_ini=[init_Mw init_Wd init_Wdp init_Wl init_Wlp init_Wl_Wl init_Wl_Wlp init_Wl_Vl init_Wl_Vlp init_Mv init_Vd init_Vl init_Vl_Vl init_Mf init_Fi init_Fi1 init_Fi2 init_Fi3 init_Fi4 init_Fi5 init_Fa init_Cp init_Mdt frq_in vvd_in mc_in  mdt_in];
x_ini=[init_Mw dWd_in dWdp_in dWl_in dWlp_in dWl_Wl_in dWl_Wlp_in d_Wl_Vl d_Wl_Vlp d_Mv d_Vd d_Vl d_Vl_Vl dMf_in dFi_in dFi1_in dFi2_in dFi3_in dFi4_in dFi5_in dFa_in dCp_in dMdt_in dfrq_in dvvd_in dmc_in dmdt_in];

start=[72 72+24];width=[12 12];height=[0.5 0.5];
signals=[start;width;height];
tspan=[0 200];
options=odeset('Abstol',1e-8,'Reltol',1e-8,'MaxStep',0.001);
% % solving equations
[t,y]=ode15s(@DDL_model,tspan,x_ini,options,signals);
%%%%%%%%%%%%%%%%%%%%%%

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
legend(' \it Dfam-3')
xticks([0:24:200]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
ylabel('Expression(a.u.)');xlabel('Time (h)');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 9.25, 9.125], 'PaperUnits', 'Inches', 'PaperSize', [9.25, 9.125])
saveas(gcf,'Figure-3.pdf')
h4=figure;
set(h4,'PaperSize',[20 10]); %set the paper size to what you want  
print(h4,'Figure-3','-dpdf')

%%%%%%%%%%%%%%%%%%%%%%%Figure-5(Delta vvd data)%%%%%%%%%%%%%%


lt=[0 0.001 0.005 0.1 0.5 1 2 3 4 5 ];
dfrq=[0 2.6904 4.0580 12.4498 16.6838 17.5500 18.0257 18.1781 18.2452 18.2782];
dvvd=[0 3.6217 3.6217 16.0396 39.8637 47.9542 53.2240 55.0283 55.8154 56.1952];

plot(lt,dfrq, '.-b', 'LineWidth', 2,'MarkerSize',36);
hold on 
plot(lt,dvvd, '.-r', 'LineWidth', 2,'MarkerSize',18);
Legend('\itfrq(\Delta vvd)','\itvvd (\Delta vvd)')