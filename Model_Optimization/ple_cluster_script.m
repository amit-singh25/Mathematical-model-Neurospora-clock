  
function ple_cluster_script

%% To run your code adapt the lines with the hint: % CHANGE !!!
% Define number of jobs and number of tasks
number_of_jobs=1;                                                                  % CHANGE !!!
number_of_tasks_per_job=101;  % put the name parameter 
input_file_name='dl_model.mat';
% format long   MJSProfile1     local
ClusterObject = parcluster ('curry0');
% Create folder to store your results
%  if ~ exist('./Results/JOB_TASK_Cluster_example','dir')                    % CHANGE !!!
%     mkdir('./Results/JOB_TASK_Cluster_example')                            % CHANGE !!!
%  end
%  length_result_all_values=10;                                                           % CHANGE !!!
%  
% storage_matrix=zeros(1,length_result_all_values);
% dlmwrite('./Results/JOB_TASK_Cluster_example/storage_matrix',storage_matrix,'precision','%.30f')  % CHANGE !!!
%% Send Jobs ============================================================================

    
    for j=1:number_of_jobs
        
%         number_of_jobs_until_now=j;   % counter 
        
        
    % start of job loop ===============================================================================================
    % set here optional criteria for the total code to break down


% {'./Data','./Models'}
    JobObject = createJob (ClusterObject);

    set ( ...
                     JobObject,...
                     'AdditionalPaths',{'/Volumes/amit/Final_model_April/delta_DL_model',...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Models',...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Data',...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Compiled',...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Compiled/code_171108',...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Compiled/code_171108/mexa64'...
                     '/Volumes/amit/Final_model_April/delta_DL_model/Results'...
                     });
                 % , ...'AttachedFiles', {'./'}   '/Volumes/AtlasData1/Cong/looping_model_v2/Results/20160728T155120_results_5_frq_vvd_looping_same_tc_2_center_p_23nm'...                  
%                       'AttachedFiles', {'./'}, ...                20160728T155324_results_6_frq_vvd_looping_same_tc_2_center_p_27nm
%                      'AdditionalPaths',{'/Volumes/AtlasData1/amit/arFramework3_latest'}...
                    %                       
%                 ,...
%                      '/Volumes/AtlasData1/Cong/arFramework3_latest'
    
        for jj=1:number_of_tasks_per_job
            
         

%               input_vector=[number_of_jobs_until_now,jj];



             createTask ( ...
                                JobObject, ...
                                @ple_function, ...           % Name of the code to run frq_vvd_fitting                              % CHANGE !!!
                                1,...
                                {jj,input_file_name}); % input variables                                                                         % CHANGE !!! if you have more input
                                

                               

                           
        end
                    % end of parallelisation

                    % There are some options for submitting. Many of those depend on the type
                    % of scheduler you are using.
                    submit (JobObject);

                    % self explaining.
%                     wait (JobObject);

                    % Results are returned as a string array. Indexing is done according to the
                    % task ID.
                   % OutputsObject = fetchOutputs (JobObject);




    
    end

   
    
end



 



