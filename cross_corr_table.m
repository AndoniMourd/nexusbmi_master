%write out a table for cross-corr local max 
function cross_corr_table(corr_data,lag_idx,corr_8s)

DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

[num,txt,raw]= xlsread('daily_notes','MetaData','V4:V13');
med_time = txt;
[num,txt,raw]= xlsread('daily_notes','MetaData','W4:W13');
med_notes = raw;
[num,txt,raw]= xlsread('daily_notes','MetaData','O4:O13');
trial_time = txt;
f = figure;
t = uitable(f);
local_max = cell(10,1);
max_lag_time = cell(10,1);
lag_idx_40s = [-40:40]*.2;
for i=1:10
    local_max{i} = max(corr_8s{i});%data{i}(find(lag_idx{i}==-40):find(lag_idx{i}==40)));
    max_lag_time{i} = lag_idx_40s(find(corr_8s{i}==max(corr_8s{i})));%corr_data{i}(find(lag_idx{i}==-40):find(lag_idx{i}==40))==max(corr_data{i}(find(lag_idx{i}==-40):find(lag_idx{i}==40))));
end
days = strcat(DAYS,MOVE_BLOCKS)';
d = [days(:),local_max(:),max_lag_time(:),med_notes,med_time,trial_time];
t.ColumnName = {' Day & Block ',' Cross-Corr Local Max ',' Lag Time of CC Local Max ',' Medication Notes         ',' Medication Time       ','Trial Time'};
t.Data = d;
t.Position = [35 115 670 225];
