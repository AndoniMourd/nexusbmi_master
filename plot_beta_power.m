function plot_beta_power(STN_power_data,M1_power_data,STN_beeps_data,M1_beeps_data)

% STN_power_data = MOVE_STN_P;
% STN_beeps_data = BEEPS_STN;
% M1_power_data = MOVE_M1_P;
% M1_beeps_data = BEEPS_M1;

all_STN_p = vertcat(STN_power_data{:});
all_STN_b = vertcat(STN_beeps_data{:});
all_M1_p = vertcat(M1_power_data{:});
all_M1_b = vertcat(M1_beeps_data{:});
day_length_STN = zeros(length(STN_power_data));
day_length_M1 = zeros(length(M1_power_data));
for i=1:length(STN_power_data)
    day_lengths_STN(i) = length(STN_power_data{i});
    day_lengths_M1(i) = length(M1_power_data{i});
end

%plot all STN
figure
subplot(2,1,1)
plot((1:length(all_STN_p))*.2,all_STN_p)
title('STN Beta Power in Controlled Movements (200ms res.)')
xlabel('Time (s)')
ylabel('STN Beta Power (Normalized to Median)')
hold on;
for i = 1:length(all_STN_b)
    if all_STN_b(i)==1
        line([i,i]*.2,[-300,300],'Color','black')%plots the vertical lines at each beep time
    else
    end
end
for i=1:length(day_lengths_STN)
    line([sum(day_lengths_STN(1:i)),sum(day_lengths_STN(1:i))]*.2,[-300,300],'Color','red','LineStyle','--')%plots the vertical lines at each beep time
end

%plot all M1
subplot(2,1,2)
plot((1:length(all_M1_p))*.2,all_M1_p)
title('M1 Beta Power in Controlled Movements (200ms res.)')
xlabel('Time (s)')
ylabel('M1 Beta Power (Normalized to Median)')
hold on;
for i = 1:length(all_M1_b)
    if all_M1_b(i)==1
        line([i,i]*.2,[-300,300],'Color','black')%plots the vertical lines at each beep time
    else
    end
end
for i=1:length(day_lengths_STN)
    line([sum(day_lengths_STN(1:i)),sum(day_lengths_STN(1:i))]*.2,[-300,300],'Color','red','LineStyle','--')%plots the vertical lines at each beep time
end

%%plot just day 021417a
figure
subplot(2,1,1)
plot((1:length(STN_power_data{9}))*.2,STN_power_data{9})
title('STN Beta Power in Controlled Movements (021417a - 200ms res.)')
xlabel('Time (s)')
ylabel('STN Beta Power (Normalized to Median)')
hold on;
for i = 1:length(STN_beeps_data{9})
    if STN_beeps_data{9}(i)==1
        line([i,i]*.2,[-300,300],'Color','black')%plots the vertical lines at each beep time
    else
    end
end

subplot(2,1,2)
plot((1:length(M1_power_data{9}))*.2,M1_power_data{9})
title('M1 Beta Power in Controlled Movements (021417a - 200ms res.)')
xlabel('Time (s)')
ylabel('M1 Beta Power (Normalized to Median)')
hold on;
for i = 1:length(M1_beeps_data{9})
    if M1_beeps_data{9}(i)==1
        line([i,i]*.2,[-300,300],'Color','black')%plots the vertical lines at each beep time
    else
    end
end
