%%%%GET BETA POWER DATA%%%%
function [move_STN_p,move_STN_p_nonorm,move_M1_p,move_M1_p_nonorm,beeps_STN,beeps_M1] = get_bpower_data(fulldata)

%fulldata = MOVE_DATA;

for i=1:length(fulldata) %gets STN power
    %gets beeps
    beeps = fulldata{i}.dat.beep(1:fulldata{i}.dat.iter_cnt); %imports beep times (only for number of tasks)
    
    %gets STN power
    stnpcell = fulldata{i}.dat.rawdata_power_ch2(find(~cellfun(@isempty,fulldata{i}.dat.rawdata_power_ch2(:)))); %loads STN beta power data & drops NaN elements
    stnparray = [stnpcell{:}]; %converts STN beta power in 'stncell' from cell to array
    stnplist = stnparray(:); %lists all STN beta power as single column (gives 200ms resolution)
    move_STN_p_nonorm{i} = stnplist(find(stnplist~=0)); %removes 0 elements from STN power list
    move_STN_p{i} = move_STN_p_nonorm{i}-median(move_STN_p_nonorm{i}); %find the difference between each 200ms task and the median of the block
    %beeps STN
    beepsSTN = beeps(find(~cellfun(@isempty,fulldata{i}.dat.rawdata_power_ch2(:)))); %drops beeps for which there is NaN in power
    beepsSTN200 = zeros(2*length(beepsSTN),1); %array of zeros of length number of tasks at 200ms res
   
    for k=1:length(beepsSTN200)
        if rem(k,2)==0
            beepsSTN200(k)=beepsSTN(k/2); %every even element in beeps_STN200 gets replaced with the value in all_beeps
        else
        end
    end %adds a zero before each element in all_beeps.
    beeps_STN{i} = beepsSTN200(find(stnplist~=0)); %removes beeps for which STN power = 0

    %gets M1 power
    m1pcell = fulldata{i}.dat.rawdata_power_ch4(find(~cellfun(@isempty,fulldata{i}.dat.rawdata_power_ch4(:)))); %loads M1 beta power data & drops NaN elements
    m1parray = [m1pcell{:}]; %converts M1 beta power in 'm1cell' from cell to array
    m1plist = m1parray(:); %lists all M1 beta power as single column (gives 200ms resolution)
    move_M1_p_nonorm{i} = m1plist(find(m1plist~=0)); %removes 0 elements from M1 power list
    move_M1_p{i} = move_M1_p_nonorm{i}-median(move_M1_p_nonorm{i}); %find the difference between each 200ms task and the median of the block
    %beeps M1
    beepsM1 = beeps(find(~cellfun(@isempty,fulldata{i}.dat.rawdata_power_ch4(:)))); %drops beeps for which there is NaN in power
    beepsM1200 = zeros(2*length(beepsM1),1); %array of zeros of length number of tasks at 200ms res
    for k=1:length(beepsM1200)
        if rem(k,2)==0
            beepsM1200(k)=beepsM1(k/2); %every even element in beeps_STN200 gets replaced with the value in all_beeps
        else
        end
    end %adds a zero before each element in all_beeps.
    beeps_M1{i} = beepsM1200(find(m1plist~=0)); %removes beeps for which STN power = 0
end


