DATA0202i = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020217i_.mat');
DATA0203c = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020317c_.mat');
DATA0206c = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020617c_.mat');
DATA0207d = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020717d_.mat');
DATA0208m = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020817m_.mat');
DATA0209a = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat020917a_.mat');
DATA0210a = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat021017a_.mat');
DATA0213a = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat021317a_.mat');
DATA0214a = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat021417a_.mat');
DATA0215a = load('C:\Users\andon\Desktop\Carmena_Rotation\nexusbmi-master\data2\dat021517a_.mat');

beeps = vertcat(DATA0202i.dat.beep,DATA0203c.dat.beep,DATA0206c.dat.beep,DATA0207d.dat.beep,...
    DATA0208m.dat.beep,DATA0209a.dat.beep,DATA0210a.dat.beep,DATA0213a.dat.beep,DATA0214a.dat.beep,DATA0215a.dat.beep);

close all;
MOVE_STN_P = [];
for i=1:length(DAYS)
    stnpcell = MOVE_DATA{i}.dat.rawdata_power_ch2(find(~cellfun(@isempty,MOVE_DATA{i}.dat.rawdata_power_ch2(:)))); %loads STN beta power data
    stnparray = [stnpcell{:}]; %converts STN beta power in 'out' from cell to array
    stnplist = stnparray(:); %lists all STN beta power as single column (gives 200ms resolution)
    stnplist_norm = stnplist-median(stnplist); %find the difference between each 200ms task and the median of the block
    MOVE_STN_P = vertcat(MOVE_STN_P,stnplist_norm(:)); %concatenates current day/block to the previously iterated
end
%{
close all;
out = DATA0202i.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0202i.dat.rawdata_power_ch2(:))));
ch2p0202i = [out{:}]; ch2p0202i =ch2p0202i(:); norm_ch2p0202i = ch2p0202i/norm(ch2p0202i);
figure
plot(1:length(norm_ch2p0202i),norm_ch2p0202i)

out = DATA0203c.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0203c.dat.rawdata_power_ch2(:))));
ch2p0203c = [out{:}]; ch2p0203c =ch2p0203c(:); norm_ch2p0203c = ch2p0203c/norm(ch2p0203c);
figure
plot(1:length(norm_ch2p0203c),norm_ch2p0203c)

out = DATA0206c.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0206c.dat.rawdata_power_ch2(:))));
ch2p0206c = [out{:}]; ch2p0206c =ch2p0206c(:); norm_ch2p0206c = ch2p0206c/norm(ch2p0206c);
figure
plot(1:length(norm_ch2p0206c),norm_ch2p0206c)

out = DATA0207d.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0207d.dat.rawdata_power_ch2(:))));
ch2p0207d = [out{:}]; ch2p0207d =ch2p0207d(:); norm_ch2p0207d = ch2p0207d/norm(ch2p0207d);
figure
plot(1:length(norm_ch2p0207d),norm_ch2p0207d)

out = DATA0208m.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0208m.dat.rawdata_power_ch2(:))));
ch2p0208m = [out{:}]; ch2p0208m =ch2p0208m(:); norm_ch2p0208m = ch2p0208m/norm(ch2p0208m);
figure
plot(1:length(norm_ch2p0208m),norm_ch2p0208m)

out = DATA0209a.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0209a.dat.rawdata_power_ch2(:))));
ch2p0209a = [out{:}]; ch2p0209a =ch2p0209a(:); norm_ch2p0209a = ch2p0209a/norm(ch2p0209a);
figure
plot(1:length(norm_ch2p0209a),norm_ch2p0209a)

out = DATA0210a.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0210a.dat.rawdata_power_ch2(:))));
ch2p0210a = [out{:}]; ch2p0210a =ch2p0210a(:); norm_ch2p0210a = ch2p0210a/norm(ch2p0210a);
figure
plot(1:length(norm_ch2p0210a),norm_ch2p0210a)

out = DATA0213a.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0213a.dat.rawdata_power_ch2(:))));
ch2p0213a = [out{:}]; ch2p0213a =ch2p0213a(:); norm_ch2p0213a = ch2p0213a/norm(ch2p0213a);
figure
plot(1:length(norm_ch2p0213a),norm_ch2p0213a)

out = DATA0214a.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0214a.dat.rawdata_power_ch2(:))));
ch2p0214a = [out{:}]; ch2p0214a =ch2p0214a(:); norm_ch2p0214a = ch2p0214a/norm(ch2p0214a);
figure
plot(1:length(norm_ch2p0214a),norm_ch2p0214a)

out = DATA0215a.dat.rawdata_power_ch2(find(~cellfun(@isempty,DATA0215a.dat.rawdata_power_ch2(:))));
ch2p0215a = [out{:}]; ch2p0215a =ch2p0215a(:); norm_ch2p0215a = ch2p0215a/norm(ch2p0215a);
figure
plot(1:length(norm_ch2p0215a),norm_ch2p0215a)
%}
%norm_ch2p_control = vertcat(norm_ch2p0202i,norm_ch2p0203c,norm_ch2p0206c,norm_ch2p0207d,norm_ch2p0208m,...
 %   norm_ch2p0209a,norm_ch2p0210a,norm_ch2p0213a,norm_ch2p0214a,norm_ch2p0215a);
MOVE_STN_Prnan0 = MOVE_STN_P(find(MOVE_STN_P~=0));
figure
plot((1:length(MOVE_STN_Prnan0))*.2,MOVE_STN_Prnan0)
title('STN Beta Power in Controlled Movements (200ms resolution)')
xlabel('Time (s)')
ylabel('STN Beta Power (Normalized to Median)')