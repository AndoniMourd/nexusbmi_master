%%perform autocorrelations and cross-correlations
function [acor,lag] = auto_cross_corr(m1_bp,stn_bp) %input M1 and STN beta power data after editing
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%m1_bp=MOVE_M1_P;
%stn_bp=MOVE_STN_P;

%perform and plot cross-correlations
for i=1:length(m1_bp)
    [acor{i},lag{i}] = crosscorr(m1_bp{i},stn_bp{i},length(stn_bp{i})-1);%coeff scales y axis to -1 --> 1
    if rem(i,2)==1
        figure
    else
    end
    subplot(2,1,-rem(i,2)+2);
    crosscorr(m1_bp{i},stn_bp{i},length(stn_bp{i})-1); %plot(lag,acor{i}); %plots cross-corr
    title(strcat('Cross-Correlation of M1 on STN Beta Power: ',DAYS{i},MOVE_BLOCKS{i}));
    xlabel('Lag')
    ylabel('Cross-Corr')
    lens_lags0(1,i) = length(acor{i}); %finds lengths of the cross-corr for each day
    lens_lags0(2,i) = find(lag{i}==0); %find index for lag=0 (midpoint) for each day 
end
min_len_half = floor(min(lens_lags0(1,:))/2); %finds the cross-corr with the smallest lag length

for i=1:length(m1_bp)
    trim_acor{i} = acor{i}(lens_lags0(2,i)-min_len_half:lens_lags0(2,i)+min_len_half); %for each day, takes # of 
        %points of the smallest cross-corr centered at lag==0
end

avg_crossc = mean([trim_acor{:}]'); %takes the average of all the crosscor 
    %days over the least number of points for the days
figure
plot(-min_len_half:min_len_half,avg_crossc) 
title('Average Cross-Corr of M1 on STN Beta Power: All Control Movement Blocks')
xlabel('Lag')
ylabel('Cross-Corr')
