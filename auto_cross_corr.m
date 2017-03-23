%%perform autocorrelations and cross-correlations
function auto_cross_corr(m1_bp,stn_bp) %input M1 and STN beta power data after editing
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%m1_bp=MOVE_M1_P;
%stn_bp=MOVE_STN_P;

figure; %perform and plot cross-correlations
for i=1:length(m1_bp)
    [acor{i},lag] = xcorr(stn_bp{i},m1_bp{i},'coeff');%coeff scales y axis to -1 --> 1
    subplot(5,2,i); 
    plot(lag,acor{i}); %plots cross-corr
    if i==1 || i==2
        title(strcat('Cross-Correlation of STN on M1 Beta Power: ',DAYS{i},MOVE_BLOCKS{i}));
    else   %only sets large titles on the top 2 subplot graphs
        title(strcat(DAYS{i},MOVE_BLOCKS{i}));
    end
    xlabel('Lag')
    ylabel('Cross-Corr')
    lens_lags0(1,i) = length(acor{i}); %finds lengths of the cross-corr for each day
    lens_lags0(2,i) = find(lag==0); %find index for lag=0 (midpoint) for each day 
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
title('Average Cross-Corr of STN on M1 Beta Power: All Control Movement Blocks')
xlabel('Lag')
ylabel('Cross-Corr')

%%%%Autocorrelation M1
for i=1:length(m1_bp)
    figure
    subplot(2,1,1)
    [ACF{1,i},m1lags{i},bounds{1,i}] = autocorr(m1_bp{i},length(m1_bp{i})-1,2); %plots ACF
    autocorr(m1_bp{i},length(m1_bp{i})-1,2);
    title(strcat('Autocorrelation of M1 Beta Power: ',DAYS{i},MOVE_BLOCKS{i}));
    m1lens_lags0(i) = length(ACF{1,i}); %finds lengths of the cross-corr for each day 
    subplot(2,1,2)
    [ACF{2,i},stnlags{i},bounds{2,i}] = autocorr(stn_bp{i},length(stn_bp{i})-1,2); %plots ACF
    autocorr(stn_bp{i},length(stn_bp{i})-1,2);
    title(strcat('Autocorrelation of STN Beta Power: ',DAYS{i},MOVE_BLOCKS{i}));
    stnlens_lags0(i) = length(ACF{1,i}); %finds lengths of the cross-corr for each day 
end
%trim ACF to the smallest day's length and find the average across all days
%from both M1 and STN

min_len_m1 = min(m1lens_lags0(:)); %finds the cross-corr with the smallest lag length
min_len_stn = min(stnlens_lags0(:)); %finds the cross-corr with the smallest lag length
for i=1:length(m1_bp)
    trim_ACF{1,i} = ACF{1,i}(1:min_len_m1);%m1lens_lags0(2,i)-min_len_halfm1:lens_lags0(2,i)+min_len_halfm1); %for each day, takes # of 
        %points of the smallest cross-corr centered at lag==0
    
    trim_ACF{2,i} = ACF{2,i}(1:min_len_stn);%stnlens_lags0(2,i)-min_len_halfstn:stnlens_lags0(2,i)+min_len_halfstn); %for each day, takes # of 
        %points of the smallest cross-corr centered at lag==0
end

avg_autocm1 = mean([trim_ACF{1,:}]'); %takes the average of all the crosscor 
    %days over the least number of points for the days
avg_autocstn = mean([trim_ACF{2,:}]'); %takes the average of all the crosscor 
    %days over the least number of points for the days

figure
subplot(2,1,1)
stem(1:min_len_m1,avg_autocm1,'filled','MarkerSize',3) 
title('Autocorrelation of M1 Beta Power: All Control Movement Blocks')
xlabel('Lag')
ylabel('Cross-Corr')

subplot(2,1,2)
stem(1:min_len_stn,avg_autocstn,'filled','MarkerSize',3) 
title('Autocorrelation of STN Beta Power: All Control Movement Blocks')
xlabel('Lag')
ylabel('Cross-Corr')