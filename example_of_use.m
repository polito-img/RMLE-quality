% load the matrix of opinion scores   
data=struct2array(load("VQEG-HD3.mat"));  

% solve the RMLE optimization problen and get quality weights as well as
% the noiseless estimate of quality 
[q,w]=run_RMLE(data);

% estimate the subject bias weights as well as the overall bias 
[bias_w]=compute_bias_weights(data,w);
subject_bias=bias_w*[1,2,3,4,5]';

%Estimate the subjects' inconsistency
subject_inc=get_inconsistency (data,bias_w,w);


    