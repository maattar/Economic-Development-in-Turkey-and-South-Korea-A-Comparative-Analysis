%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                %%%%%
%%%%%         Economic Development in Turkey and South Korea:        %%%%%
%%%%%                      A Comparative Analysis                    %%%%%
%%%%%                                                                %%%%%
%%%%%                          M. Aykut Attar                        %%%%%
%%%%%                                                                %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                %%%%%
%%%%%                        The Extended Model                      %%%%%
%%%%%                                                                %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cleaning
clc; clear all; close all;

%% Main algorithm for both countries 
run_TUR;        % This program generates the results for Turkey.
evaluate_TUR;   % This program collects and saves the results for Turkey.

run_KOR;        % This program generates the results for Korea.
evaluate_KOR;   % This program collects and saves the results for Korea.

%% Cleaning
clc; clear all; close all;

%% Loading the benchmark results for both countries
load('Turkey_bm.mat')
load('Korea_bm.mat')

%% Preparation for the figures
year    = Turkey_bm_simulation(:,1);
H_US_m  = Turkey_bm_simulation(:,7);

x_TUR_m = Turkey_bm_simulation(:,2);
x_TUR_d = Turkey_bm_simulation(:,3);
y_TUR_m = Turkey_bm_simulation(:,4);
y_TUR_d = Turkey_bm_simulation(:,5);
h_TUR_m = Turkey_bm_simulation(:,6);

x_KOR_m = Korea_bm_simulation(:,2);
x_KOR_d = Korea_bm_simulation(:,3);
y_KOR_m = Korea_bm_simulation(:,4);
y_KOR_d = Korea_bm_simulation(:,5);
h_KOR_m = Korea_bm_simulation(:,6);

%% Figure 4
figure(4)
subplot(1,2,1)
plot(year,log(y_TUR_d),'or','MarkerFaceColor','red')
hold on
plot(year,log(y_TUR_m),'LineWidth',2)
hold off
title('log(Real GDP per capita) - Turkey')
xlim([1958 2016])
ylim([6.75 10.25])
ylabel('log(2005 constant US Dollars)')
grid on
legend('Data','Model','Location','SouthWest','Orientation','vertical')
subplot(1,2,2)
plot(year,log(y_KOR_d),'or','MarkerFaceColor','red')
hold on
plot(year,log(y_KOR_m),'LineWidth',2)
hold off
title('log(Real GDP per capita) - South Korea')
xlim([1958 2016])
ylim([6.75 10.25])
grid on

%% Figure 5
figure(5)
subplot(1,2,1)
plot(year,x_TUR_d,'or','MarkerFaceColor','red')
hold on
plot(year,x_TUR_m,'LineWidth',2)
hold off
title('Share of Rural Population - Turkey')
xlim([1958 2016])
ylim([0.15 0.75])
ylabel('between 0 and 1')
grid on
legend('Data','Model','Location','SouthWest','Orientation','vertical')
subplot(1,2,2)
plot(year,x_KOR_d,'or','MarkerFaceColor','red')
hold on
plot(year,x_KOR_m,'LineWidth',2)
hold off
title('Share of Rural Population - South Korea')
xlim([1958 2016])
ylim([0.15 0.75])
grid on

%% Figure 6
figure(6)
plot(year,log(H_US_m),'LineWidth',2,'Color','black')
hold on
plot(year,log(h_TUR_m),'+r-','LineWidth',2,'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',7)
plot(year,log(h_KOR_m),'xb-','LineWidth',2,'MarkerEdgeColor','blue','MarkerFaceColor','blue','MarkerSize',7)
hold off
title('log(City Sector Productivity)')
xlim([1958 2016])
grid on
legend('United States','Turkey','South Korea','Location','SouthEast','Orientation','vertical')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%