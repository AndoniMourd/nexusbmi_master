close all;
MOVE_STN_P = [];
all_beeps = [];
for i=1:length(DAYS)
    block_beeps = MOVE_DATA{i}.dat.beep(1:MOVE_DATA{i}.dat.iter_cnt); %imports beep times (only for number of tasks)
    block_beeps = block_beeps(find(~cellfun(@isempty,MOVE_DATA{i}.dat.rawdata_power_ch2(:)))); %drops beeps for which there is NaN in power
    stnpcell = MOVE_DATA{i}.dat.rawdata_power_ch2(find(~cellfun(@isempty,MOVE_DATA{i}.dat.rawdata_power_ch2(:)))); %loads STN beta power data & drops NaN elements
    stnparray = [stnpcell{:}]; %converts STN beta power in 'out' from cell to array
    stnplist = stnparray(:); %lists all STN beta power as single column (gives 200ms resolution)
    stnplist_norm = stnplist-median(stnplist); %find the difference between each 200ms task and the median of the block
    all_beeps = vertcat(all_beeps,block_beeps); %%concatenates current day/block to the previously iterated
    MOVE_STN_P = vertcat(MOVE_STN_P,stnplist_norm(:)); %concatenates current day/block to the previously iterated
end
add200ms = zeros(length(all_beeps),1);
%all_beeps200 = [add200ms(rem(0:numel(all_beeps)-1,numel(add200ms))+1);all_beeps];
%all_beeps200 = all_beeps200(:);

all_beeps200 = zeros(2*length(all_beeps),1); %array of zeros of length number of tasks at 200ms res
for i=1:length(all_beeps200)
    if rem(i,2)==0
        all_beeps200(i)=all_beeps(i/2); %every even element in all_beeps200 gets replaced with the value in all_beeps
    end %adds a zero before each element in all_beeps. 
end
MOVE_STN_Pr0 = MOVE_STN_P(find(MOVE_STN_P~=0)); %removes 0 elements from STN beta power
all_beepsr0 = all_beeps200(find(MOVE_STN_P~=0)); %removes beep times where STN beta power is 0

figure
subplot(2,1,1)
plot((1:length(MOVE_STN_Pr0))*.2,MOVE_STN_Pr0) %plots STN beta power data with 200ms resolution
hold on;
for i = 1:length(all_beepsr0)
    if all_beepsr0(i)==1
        line([i,i]*.2,[-300,300],'Color','black') %plots the vertical lines at each beep time
    else
    end
end
title('STN Beta Power in Controlled Movements (200ms resolution)')
xlabel('Time (s)')
ylabel('STN Beta Power (Normalized to Median)')

%%%%repeated for m1%%%%%%%%%%%%%%%%%%%%%5

MOVE_M1_P = [];
all_beeps = [];
for i=1:length(DAYS)
    block_beeps = MOVE_DATA{i}.dat.beep(1:MOVE_DATA{i}.dat.iter_cnt); %imports beep times (only for number of tasks)
    block_beeps = block_beeps(find(~cellfun(@isempty,MOVE_DATA{i}.dat.rawdata_power_ch4(:)))); %drops beeps for which there is NaN in power
    m1pcell = MOVE_DATA{i}.dat.rawdata_power_ch4(find(~cellfun(@isempty,MOVE_DATA{i}.dat.rawdata_power_ch4(:)))); %loads M1 beta power data & drops NaN elements
    m1parray = [m1pcell{:}]; %converts M1 beta power in 'out' from cell to array
    m1plist = m1parray(:); %lists all M1 beta power as single column (gives 200ms resolution)
    m1plist_norm = m1plist-median(m1plist); %find the difference between each 200ms task and the median of the block
    all_beeps = vertcat(all_beeps,block_beeps); %%concatenates current day/block to the previously iterated
    MOVE_M1_P = vertcat(MOVE_M1_P,m1plist_norm(:)); %concatenates current day/block to the previously iterated
end
add200ms = zeros(length(all_beeps),1);
%all_beeps200 = [add200ms(rem(0:numel(all_beeps)-1,numel(add200ms))+1);all_beeps];
%all_beeps200 = all_beeps200(:);

all_beeps200 = zeros(2*length(all_beeps),1); %array of zeros of length number of tasks at 200ms res
for i=1:length(all_beeps200)
    if rem(i,2)==0
        all_beeps200(i)=all_beeps(i/2);%every even element in all_beeps200 gets replaced with the value in all_beeps
    end%adds a zero before each element in all_beeps.
end
MOVE_M1_Pr0 = MOVE_M1_P(find(MOVE_M1_P~=0)); %removes 0 elements from M1 beta power
all_beepsr0 = all_beeps200(find(MOVE_M1_P~=0)); %removes beep times where M1 beta power is 0

subplot(2,1,2)
plot((1:length(MOVE_M1_Pr0))*.2,MOVE_M1_Pr0) %plots M1 beta power data with 200ms resolution
hold on;
for i = 1:length(all_beepsr0)
    if all_beepsr0(i)==1
        line([i,i]*.2,[-300,300],'Color','black')%plots the vertical lines at each beep time
    else
    end
end
title('M1 Beta Power in Controlled Movements (200ms resolution)')
xlabel('Time (s)')
ylabel('M1 Beta Power (Normalized to Median)')

%%%%% Below only plots day 021417a%%%%

MOVE_STN_P1 = [];
all_beeps = [];
for i=1:length(DAYS1)
    block_beeps = MOVE_DATA1{i}.dat.beep(1:MOVE_DATA1{i}.dat.iter_cnt); %imports beep times (only for number of tasks)
    block_beeps = block_beeps(find(~cellfun(@isempty,MOVE_DATA1{i}.dat.rawdata_power_ch2(:)))); %drops beeps for which there is NaN in power
    stnpcell = MOVE_DATA1{i}.dat.rawdata_power_ch2(find(~cellfun(@isempty,MOVE_DATA1{i}.dat.rawdata_power_ch2(:)))); %loads STN beta power data & drops NaN elements
    stnparray = [stnpcell{:}]; %converts STN beta power in 'out' from cell to array
    stnplist = stnparray(:); %lists all STN beta power as single column (gives 200ms resolution)
    stnplist_norm = stnplist-median(stnplist); %find the difference between each 200ms task and the median of the block
    all_beeps = vertcat(all_beeps,block_beeps); %%concatenates current day/block to the previously iterated
    MOVE_STN_P1 = vertcat(MOVE_STN_P1,stnplist_norm(:)); %concatenates current day/block to the previously iterated
end
add200ms = zeros(length(all_beeps),1);

all_beeps200 = zeros(2*length(all_beeps),1);
for i=1:length(all_beeps200)
    if rem(i,2)==0
        all_beeps200(i)=all_beeps(i/2);
    end
end
MOVE_STN_P1r0 = MOVE_STN_P1(find(MOVE_STN_P1~=0)); %removes 0 elements from STN beta power
all_beepsr0 = all_beeps200(find(MOVE_STN_P1~=0)); %removes beep times where STN beta power is 0

figure
subplot(2,1,1)
plot((1:length(MOVE_STN_P1r0))*.2,MOVE_STN_P1r0) %plots STN beta power data with 200ms resolution
hold on;
for i = 1:length(all_beepsr0)
    if all_beepsr0(i)==1
        line([i,i]*.2,[-250,250],'Color','black')
    else
    end
end
title('STN Beta Power in Controlled Movements (021417a - 200ms res.)')
xlabel('Time (s)')
ylabel('STN Beta Power (Normalized to Median)')

%%%%repeated for m1%%%%%%%%%%%%%%%%%%%%%

MOVE_M1_P1 = [];
all_beeps = [];
for i=1:length(DAYS1)
    block_beeps = MOVE_DATA1{i}.dat.beep(1:MOVE_DATA1{i}.dat.iter_cnt); %imports beep times (only for number of tasks)
    block_beeps = block_beeps(find(~cellfun(@isempty,MOVE_DATA1{i}.dat.rawdata_power_ch4(:)))); %drops beeps for which there is NaN in power
    m1pcell = MOVE_DATA1{i}.dat.rawdata_power_ch4(find(~cellfun(@isempty,MOVE_DATA1{i}.dat.rawdata_power_ch4(:)))); %loads M1 beta power data & drops NaN elements
    m1parray = [m1pcell{:}]; %converts M1 beta power in 'out' from cell to array
    m1plist = m1parray(:); %lists all M1 beta power as single column (gives 200ms resolution)
    m1plist_norm = m1plist-median(m1plist); %find the difference between each 200ms task and the median of the block
    all_beeps = vertcat(all_beeps,block_beeps); %%concatenates current day/block to the previously iterated
    MOVE_M1_P1 = vertcat(MOVE_M1_P1,m1plist_norm(:)); %concatenates current day/block to the previously iterated
end
add200ms = zeros(length(all_beeps),1);

all_beeps200 = zeros(2*length(all_beeps),1);
for i=1:length(all_beeps200)
    if rem(i,2)==0
        all_beeps200(i)=all_beeps(i/2);
    end
end
MOVE_M1_P1r0 = MOVE_M1_P1(find(MOVE_M1_P1~=0)); %removes 0 elements from M1 beta power
all_beepsr0 = all_beeps200(find(MOVE_M1_P1~=0)); %removes beep times where M1 beta power is 0

subplot(2,1,2)
plot((1:length(MOVE_M1_P1r0))*.2,MOVE_M1_P1r0) %plots M1 beta power data with 200ms resolution
for i = 1:length(all_beepsr0)
    if all_beepsr0(i)==1
        line([i,i]*.2,[-300,350],'Color','black')
    else
    end
end
title('M1 Beta Power in Controlled Movements (021417a - 200ms res.)')
xlabel('Time (s)')
ylabel('M1 Beta Power (Normalized to Median)')

%%% Autocorrelation Plots. Repeated for all M1 & STN and for M1 & STN on
%%% 021417a
figure
subplot(2,2,1)
[ACF,lags,bounds] = autocorr(MOVE_M1_P1r0,200,2); %200 is number of lag shifts to plot. 2 is number of lags after which the theoretical ACF is ~0
autocorr(MOVE_M1_P1r0,200,2) %plots ACF
title('Autocorrelation of M1 Beta Power (021417a)')
%bounds

subplot(2,2,2)
[ACF,lags,bounds] = autocorr(MOVE_STN_P1r0,200,2);
autocorr(MOVE_STN_P1r0,200,2)
title('Autocorrelation of STN Beta Power (021417a)')
%bounds

subplot(2,2,3)
[ACF,lags,bounds] = autocorr(MOVE_M1_Pr0,200,2);
autocorr(MOVE_M1_Pr0,200,2)
title('Autocorrelation of M1 Beta Power')
%bounds

subplot(2,2,4)
[ACF,lags,bounds] = autocorr(MOVE_STN_Pr0,200,2);
autocorr(MOVE_STN_Pr0,200,2)
title('Autocorrelation of STN Beta Power')
%bounds

%%%Cross-Correlations. Repeated for all M1 to STN and for M1 to STN on
%%% 021417a
[acor1,lag1] = xcorr(MOVE_STN_P1r0,MOVE_M1_P1r0,'coeff');%coeff scales y axis to -1 --> 1
figure;
subplot(3,1,2);
plot(lag1,acor1);
title('Cross-correlation of STN on M1 Beta Power (021417a)')
xlabel('Lag')
ylabel('Cross-correlation')
[~,I1] = max(acor1); %finds the max cross-correlation. Sotres that value in I1
lagDiff1 = lag1(I1); %difference in lag time
M1_al1 = MOVE_STN_P1r0(lagDiff1+1:end); %crops M1 power data with the lag shift for aligned plotting
time_M1_al1 = (0:length(M1_al1)-1)*.2; %makes time vector for cropped M1 power

[acor,lag] = xcorr(vertcat(MOVE_STN_Pr0,zeros(length(MOVE_M1_Pr0)-length(MOVE_STN_Pr0),1)),MOVE_M1_Pr0,'coeff');
subplot(3,1,1);
plot(lag,acor);
title('Cross-correlation of STN on M1 Beta Power')
xlabel('Lag')
ylabel('Cross-correlation')

%%%%Plot aligned M1 and STN beta power based on cross-correlation max
subplot(3,1,3);
plot(time_M1_al1,M1_al1);
hold;
plot((1:length(MOVE_M1_P1r0))*.2,MOVE_M1_P1r0,'r');
title('Aligned STN & M1 Beta Power (021417a)')
xlabel('Time (s)')
ylabel({'Beta Power','(Normalized to Median)'})
legend('STN (shifted left 1.6s)','M1')%plots STN shifted to the left because it leads M1

%%%%%Mean and Variance of STN and M1