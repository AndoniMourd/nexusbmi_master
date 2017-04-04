%%plot average beep to beep power for each day
function avg_beep2beep(stn_power,m1_power,stn_beeps,m1_beeps)

DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%stn_power = MOVE_STN_P;
%m1_power = MOVE_M1_P;
%stn_beeps = BEEPS_STN;
%m1_beeps = BEEPS_M1;

%%%M1
err_m1={};
for q=1:length(m1_power)
    a=find(m1_beeps{q}==1); %finds where beeps happen
    summed = zeros(max(diff(a)),1); %makes a column of zeros the length of idxs between beeps
    j=0; b=[];
    for i=1:(length(a)-1)
        if (a(i+1)-a(i))==max(diff(a))%checks if length of current beep window is the expected size
            %new_beep = m1_power{q}(a(i):a(i+1)-1);
            summed = summed + m1_power{q}(a(i):a(i+1)-1);%sum the corresponding indexes from each beep window
            j=j+1; %counts the number of beep windows
            b(j) = a(i); %b has the starting indicies for the beep windows of expected length
        else
        end
    end
    for t=1:unique(diff(b))
        err_m1{q}(t) = std(m1_power{q}(b+t-1))/sqrt(length(b)); %stnd err for the each day {q}, each point (t)
    end
    avg_bp2bp_m1{q} = summed/j;
end

%%%repeat for STN
for q=1:length(stn_power)
    a=find(stn_beeps{q}==1);
    summed = zeros(max(diff(a)),1);
    j=0; b=[];
    for i=1:(length(a)-1)
        if (a(i+1)-a(i))==max(diff(a))
            new_beep = stn_power{q}(a(i):a(i+1)-1);
            summed = summed + stn_power{q}(a(i):a(i+1)-1);
            j=j+1;
            b(j) = a(i); %b has the starting indicies for the beep windows of expected length
        else
        end
    end
    for t=1:unique(diff(b))
        err_stn{q}(t) = std(m1_power{q}(b+t-1))/sqrt(length(b)); %stnd err for the each day {q}, each point (t)
    end
    avg_bp2bp_stn{q} = summed/j;
end

for q=1:length(stn_power)
    figure;
    subplot(2,1,1)
    errorbar((1:length(avg_bp2bp_stn{q}))*.2,avg_bp2bp_stn{q},err_stn{q},'LineWidth',2)
    grid on; grid minor;
    title(strcat('M1 Beta Power in Controlled Movements:',DAYS{q},MOVE_BLOCKS{q}))
    xlabel('Time Since Last Beep (s)')
    ylabel('M1 Beta Power (Normalized to Median)')
    
    subplot(2,1,2)
    errorbar((1:length(avg_bp2bp_m1{q}))*.2,avg_bp2bp_m1{q},err_m1{q},'LineWidth',2)
    grid on; grid minor;
    title(strcat('STN Beta Power in Controlled Movements:',DAYS{q},MOVE_BLOCKS{q}))
    xlabel('Time Since Last Beep (s)')
    ylabel('STN Beta Power (Normalized to Median)')
end