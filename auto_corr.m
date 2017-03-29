function auto_corr(m1_bp,stn_bp) %input M1 and STN beta power data after editing
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%%%%Autocorrelation M1 & STN
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

avg_autocm1 = mean([trim_ACF{1,[1:10]}]'); %takes the average of all the crosscor 
    %days over the least number of points for the days
avg_autocstn = mean([trim_ACF{2,[1:10]}]'); %takes the average of all the crosscor 
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