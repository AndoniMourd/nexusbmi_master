function [move_data] = load_bmi_data(days,move_blcks)

for i=1:length(days) %stores all data for each control block as a struct in a cell entry of DATA.date+block.dat
        move_data{i} = load(strcat('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat',days{i},move_blcks{i},'_.mat'));
end
end