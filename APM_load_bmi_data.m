%loads data for controlled movements
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};
%DAYS1 = {'021417'};
%MOVE_BLOCKS1 = {'a'};

MOVE_DATA = load_bmi_data(DAYS,MOVE_BLOCKS);
[MOVE_STN_P,MOVE_M1_P,BEEPS_STN,BEEPS_M1] = get_bpower_data(MOVE_DATA);
auto_cross_corr(MOVE_M1_P,MOVE_STN_P); %input M1 and STN beta power data after editing
