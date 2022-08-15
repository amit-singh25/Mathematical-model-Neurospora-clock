%%%%%%%Plot data with SD with patch

d1 = 'DL_final_data.xlsx';
DL = readtable(d1);
d2='Delta_DL_model-final_data.xlsx'
DDL = readtable(d2);

subplot(4,2,1)
shadedErrorBar(DL.time,DL.L_frq_obs,DL.L_frq_obs_std,'lineprops','-b','patchSaturation',0.33)
xticks([0:24:217]);ylim([0 40]); 
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;title('\it frq');
subplot(4,2,3)
shadedErrorBar(DL.time,DL.L_vvd_obs,DL.L_vvd_obs_std,'lineprops','-b','patchSaturation',0.33)
xticks([0:24:217]); 
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;title('\it vvd');
subplot(4,2,5)
shadedErrorBar(DL.time,DL.L_mc_obs,DL.L_mc_obs_std,'lineprops','-b','patchSaturation',0.33)
xticks([0:24:217]);ylim([0 20]); title('\it csp-1');
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
subplot(4,2,7)
shadedErrorBar(DL.time,DL.L_mdt_obs,DL.L_mdt_obs_std,'lineprops','-b','patchSaturation',0.33)
xticks([0:24:217]);ylim([0 30]); title('\it fam-3');
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
subplot(4,2,2)
shadedErrorBar(DDL.time,DDL.L_dfrq_obs,DDL.L_dfrq_obs_std,'lineprops','-r','patchSaturation',0.33)
xticks([0:24:217]);title('\it frq');
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;

subplot(4,2,4)
shadedErrorBar(DDL.time,DDL.L_dvvd_obs,DDL.L_dvvd_obs_std,'lineprops','-r','patchSaturation',0.33)
xticks([0:24:217]);title('\it vvd');
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24; 
subplot(4,2,6)
shadedErrorBar(DDL.time,DDL.L_dmc_obs,DDL.L_dmc_obs_std,'lineprops','-r','patchSaturation',0.33)
xticks([0:24:217]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;  title('\it csp-1');
subplot(4,2,8)
shadedErrorBar(DDL.time,DDL.L_dmdt_obs,DDL.L_dmdt_obs_std,'lineprops','-r','patchSaturation',0.33)
xticks([0:24:217]);
ax=gca;ax.LineWidth=2;ax.FontWeight = 'normal';ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24; title('\it fam-3');

