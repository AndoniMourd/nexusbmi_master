%loads data for controlled movements
close all; clear all;
addpath(genpath('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master'))

DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};
%DAYS1 = {'021417'};
%MOVE_BLOCKS1 = {'a'};

MOVE_DATA = load_bmi_data(DAYS,MOVE_BLOCKS);
[MOVE_STN_P,MOVE_STN_P_NONORM,MOVE_M1_P,MOVE_M1_P_NONORM,BEEPS_STN,BEEPS_M1] = get_bpower_data(MOVE_DATA);
plot_beta_power(MOVE_STN_P,MOVE_M1_P,BEEPS_STN,BEEPS_M1)
[acor,lag] = cross_corr(MOVE_M1_P,MOVE_STN_P); %input M1 and STN beta power data after editing
[CORR_8s] = cross_corr_8s(MOVE_M1_P,MOVE_STN_P,acor,lag);
auto_corr(MOVE_M1_P,MOVE_STN_P); %input M1 and STN beta power data after editing
avg_beep2beep(MOVE_STN_P,MOVE_M1_P,BEEPS_STN,BEEPS_M1)
mean_variance(MOVE_STN_P_NONORM,MOVE_M1_P_NONORM)
cross_corr_table(acor,lag,CORR_8s)