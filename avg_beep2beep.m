%%plot average beep to beep power for each day
function avg_beep2beep(stn_power,m1_power,stn_beeps,m1_beeps)

DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%%%M1
for q=1:length(m1_power)
    a=find(m1_beeps{q}==1);
    summed = zeros(max(diff(a)),1);
    j=0;
    for i=1:(length(a)-1)
        if (a(i+1)-a(i))==max(diff(a))
            new_beep = m1_power{q}(a(i):a(i+1)-1);
            summed = summed + m1_power{q}(a(i):a(i+1)-1);
            j=j+1;
        else
        end
    end
    avg_bp2bp_m1{q} = summed/j;
end

%%%repeat for STN
for q=1:length(stn_power)
    a=find(stn_beeps{q}==1);
    summed = zeros(max(diff(a)),1);
    j=0;
    for i=1:(length(a)-1)
        if (a(i+1)-a(i))==max(diff(a))
            new_beep = stn_power{q}(a(i):a(i+1)-1);
            summed = summed + stn_power{q}(a(i):a(i+1)-1);
            j=j+1;
        else
        end
    end
    avg_bp2bp_stn{q} = summed/j;
end

for q=1:length(stn_power)
    figure;
    subplot(1,2,1)
    plot(1:length(avg_bp2bp_stn{q}),avg_bp2bp_stn{q},'LineWidth',2)
    title(strcat('M1 Beta Power in Controlled Movements:',DAYS{q},MOVE_BLOCKS{q}))
    xlabel('Time Since Last Beep (s)')
    ylabel('M1 Beta Power (Normalized to Median)')
    
    subplot(1,2,2)
    plot(1:length(avg_bp2bp_m1{q}),avg_bp2bp_m1{q},'LineWidth',2)
    title(strcat('STN Beta Power in Controlled Movements:',DAYS{q},MOVE_BLOCKS{q}))
    xlabel('Time Since Last Beep (s)')
    ylabel('STN Beta Power (Normalized to Median)')
end