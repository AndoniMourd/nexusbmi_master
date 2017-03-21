%loads data for controlled movements
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};
DAYS1 = {'021417'};
MOVE_BLOCKS1 = {'a'};

MOVE_DATA={};
for i=1:length(DAYS) %stores all data for each control block as a struct in a cell entry of DATA.date+block.dat
    MOVE_DATA{i} = load(strcat('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat',DAYS{i},MOVE_BLOCKS{i},'_.mat'));
end

MOVE_DATA1={};
for i=1:length(DAYS1) %stores all data for each control block as a struct in a cell entry of DATA.date+block.dat
    MOVE_DATA1{i} = load(strcat('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat',DAYS1{i},MOVE_BLOCKS1{i},'_.mat'));
end


