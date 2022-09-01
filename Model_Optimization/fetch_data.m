%%
clear
c=parcluster;
num= 6532             ;
j=findJob(c,'ID',num);
ar_cell=fetchOutputs(j);
global ar
ar=ar_cell{1};


%% Job6532 17th

%arPlot
%%% 6496
%%% need to fetchb 6493 15th michal_net_fix_para_add_damping
%% fix_parameter from 6485 old model 15th

c = parcluster('curry0');
j=findJob(c,'Username','amit')

global ar
n=length(ar_cell);
for i=1:47
    ar=ar_cell{i};a
plePlot

end

