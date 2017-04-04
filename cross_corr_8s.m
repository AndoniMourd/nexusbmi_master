function [corr_8s] = cross_corr_8s(m1_power,stn_power,corr_data,lag_idx);

DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};
%{
m1_power=MOVE_M1_P;
stn_power=MOVE_STN_P;
corr_data=acor;
lag_idx=lag;
%}

r_l={}; r_u={}; err_8s={};
for i=1:length(m1_power)
    corr_8s{i} = corr_data{i}(find(lag_idx{i}==-40):find(lag_idx{i}==40));
    lag_idx_40s = [-40:40]';
    
    for g=1:length(lag_idx_40s)
        z_r=0.5*log((1+max(corr_8s{i}(g)))/(1-max(corr_8s{i}(g))));
        zeta_l = z_r-1.96*sqrt(1/(length(m1_power{i})-3));
        zeta_u = z_r+1.96*sqrt(1/(length(m1_power{i})-3));
        r_l{i}(g) = (exp(2*zeta_l)-1)/(exp(2*zeta_l)+1);
        r_u{i}(g) = (exp(2*zeta_u)-1)/(exp(2*zeta_u)+1);
        err_8s{i}(g) = r_u{i}(g)-r_l{i}(g);
    end
end

for t=1:length(m1_power)
    if rem(t,2)==1
        figure
    else
    end
    subplot(2,1,-rem(t,2)+2);
    errorbar(lag_idx_40s*.2,corr_8s{t},err_8s{t},'LineWidth',1);
    title(strcat('Cross-Correlation of M1 on STN Beta Power: ',DAYS{t},MOVE_BLOCKS{t}));
    xlabel('Time Lag (s)')
    ylabel('Cross-Corr')
    grid on;
end