function ar=ple_function(jj,input_file_name)


% global ar
%%
% clear all
global ar

load(input_file_name);
% arLoad(3);
pause(5);
%%

% ar.config.atol = 1e-5;
% ar.config.rtol = 1e-5;

arPLEInit(true,1);
%
%ple_mod(1:length(ar.qFit),1000,[],[],[],[],[])

%for i=1:34
%    ple(i,1000)
%end

ple(jj,1000,0.5,1)

% ple_cluster(jj,1000,0.5,1)

% ple(jj+21,1000,0.5,1)

% ,0.5,1e-1,0.01,0.01,0.2,1e-1
% ple(32,1000)





