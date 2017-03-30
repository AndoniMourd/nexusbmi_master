%%perform autocorrelations and cross-correlations
function auto_cross_corr(m1_bp,stn_bp) %input M1 and STN beta power data after editing
DAYS = {'020217','020317','020617','020717','020817','020917','021017','021317','021417','021517'};
MOVE_BLOCKS = {'i','c','c','d','m','a','a','a','a','a'};

%m1_bp=MOVE_M1_P;
%stn_bp=MOVE_STN_P;

%perform and plot cross-correlations
for i=1:length(m1_bp)
    [acor{i},lag{i},Bounds] = crosscorr(m1_bp{i},stn_bp{i},length(stn_bp{i})-1);%coeff scales y axis to -1 --> 1
    %calculate confidence intervals based on fisher's transform
    z_r=0.5*log((1+max(acor{i}))/(1-max(acor{i})));
    zeta_l = z_r-1.96*sqrt(1/(length(m1_bp{i})-3));
    zeta_u = z_r+1.96*sqrt(1/(length(m1_bp{i})-3));
    r_l = (exp(2*zeta_l)-1)/(exp(2*zeta_l)+1);
    r_u = (exp(2*zeta_u)-1)/(exp(2*zeta_u)+1);
    
    if rem(i,2)==1
        figure
        dim=[.67 .699 .3 .3];
    else
        dim=[.67 .225 .3 .3];
    end
    subplot(2,1,-rem(i,2)+2); 
    crosscorr(stn_bp{i},m1_bp{i},length(stn_bp{i})-1); %plot(lag,acor{i}); %plots cross-corr
    title(strcat('Cross-Correlation of STN on M1 Beta Power: ',DAYS{i},MOVE_BLOCKS{i}));
    str=strcat({['max r = ',num2str(max(acor{i}))],['CI: ',num2str(r_l),', ',num2str(r_u)]});
    annotation('textbox',dim,'String',str,'FitBoxToText','on')
    xlabel('Lag')
    ylabel('Cross-Corr')
    lens_lags0(1,i) = length(acor{i}); %finds lengths of the cross-corr for each day
    lens_lags0(2,i) = find(lag{i}==0); %find index for lag=0 (midpoint) for each day 
end
min_len_half = floor(min(lens_lags0(1,:))/2); %finds the cross-corr with the smallest lag length

cross_corr_table(acor,lag);

for i=1:length(m1_bp)
    trim_acor{i} = acor{i}(lens_lags0(2,i)-min_len_half:lens_lags0(2,i)+min_len_half); %for each day, takes # of 
        %points of the smallest cross-corr centered at lag==0
end

avg_crossc = mean([trim_acor{:}]'); %takes the average of all the crosscor 
    %days over the least number of points for the days
figure
plot(-min_len_half:min_len_half,avg_crossc) 
title('Average Cross-Corr of STN on M1 Beta Power: All Control Movement Blocks')
xlabel('Lag')
ylabel('Cross-Corr')
