% This program generates Figure 8.

%% Cleaning
clc; clear all; close all;

%% Data
D = csvread('hc.csv');

T = size(D,1);

year   = D(11:T,1); 

hc_TUR = D(11:T,2);
hc_KOR = D(11:T,3);


%% Figure 8
figure(8)
plot(year,hc_KOR,'o','MarkerEdgeColor','blue','MarkerFaceColor','white','LineWidth',2)
hold on
plot(year,hc_TUR,'s','MarkerEdgeColor','black','MarkerFaceColor','red')
hold off
grid on
title('Human Capital per person')
ylabel('indexed')
xlim([1959 2015])
legend('South Korea','Turkey','Location','NorthWest','Orientation','vertical')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



