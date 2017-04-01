function mean_variance(stn_p_raw,m1_p_raw);
%m1_p_raw = MOVE_M1_P_NONORM;
%stn_p_raw = MOVE_STN_P_NONORM;

for i=1:length(m1_p_raw)
    m1_means(i) = mean(m1_p_raw{i});
    stn_means(i) = mean(stn_p_raw{i});
    m1_vars(i) = var(m1_p_raw{i});
    stn_vars(i) = var(stn_p_raw{i});
end

figure
subplot(2,2,1)
plot(m1_means,stn_means,'.','MarkerSize',10)
hold on;
x=m1_means;
y=stn_means;
X=[ones(length(x),1) x'];
b=X\y';
yCalc = X*b;
Rsq = 1 - sum((y' - yCalc).^2)/sum((y' - mean(y)).^2);
plot(x,yCalc)
title('Means of M1 & STN Beta Power by Control Block')
xlabel('Mean of M1 Beta Power')
ylabel('Mean of STN Beta Power')
str = strcat('R-squared=',num2str(Rsq));
annotation('textbox',[.23 .35 .3 .3],'String',str,'FitBoxToText','on');

subplot(2,2,2)
plot(m1_means,stn_vars,'.','MarkerSize',10)
hold on;
x=m1_means;
y=stn_vars;
X=[ones(length(x),1) x'];
b=X\y';
yCalc = X*b;
Rsq = 1 - sum((y' - yCalc).^2)/sum((y' - mean(y)).^2);
plot(x,yCalc)
title('Means of M1 & Variance of STN Beta Power by Control Block')
xlabel('Mean of M1 Beta Power')
ylabel('Variance of STN Beta Power')
str = strcat('R-squared=',num2str(Rsq));
annotation('textbox',[.7 .6 .3 .3],'String',str,'FitBoxToText','on');

subplot(2,2,3)
plot(m1_vars,stn_means,'.','MarkerSize',10)
hold on;
x=m1_vars;
y=stn_means;
X=[ones(length(x),1) x'];
b=X\y';
yCalc = X*b;
Rsq = 1 - sum((y' - yCalc).^2)/sum((y' - mean(y)).^2);
plot(x,yCalc)
title('Means of M1 & Variance of STN Beta Power by Control Block')
xlabel('Variance of M1 Beta Power')
ylabel('Mean of STN Beta Power')
str = strcat('R-squared=',num2str(Rsq));
annotation('textbox',[.3 .005 .3 .3],'String',str,'FitBoxToText','on');

subplot(2,2,4)
plot(m1_vars,stn_vars,'.','MarkerSize',10)
hold on;
x=m1_vars;
y=stn_vars;
X=[ones(length(x),1) x'];
b=X\y';
yCalc = X*b;
Rsq = 1 - sum((y' - yCalc).^2)/sum((y' - mean(y)).^2);
plot(x,yCalc)
title('Variance of M1 & Variance of STN Beta Power by Control Block')
xlabel('Variance of M1 Beta Power')
ylabel('Variance of STN Beta Power')
str = strcat('R-squared=',num2str(Rsq));
annotation('textbox',[.7 .005 .3 .3],'String',str,'FitBoxToText','on');
