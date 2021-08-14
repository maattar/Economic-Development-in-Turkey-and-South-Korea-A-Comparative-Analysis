% This program generates Figure 1.

%% Cleaning
clc; clear all; close all;

%% Data
D = csvread('Maddison_1870.csv');

T = size(D,1);

year   = D(:,1); 

y_Eng  = D(:,2);
y_USA  = D(:,3);
y_Chi  = D(:,4);
y_Jap  = D(:,5);
y_Kor  = D(:,6);
y_Tur  = D(:,7);

%% Figure 1
figure(1)
plot(year,log(y_Eng),'dk-','MarkerEdgeColor','black','MarkerFaceColor','magenta','MarkerSize',7)
hold on
plot(year,log(y_USA),'sk-','LineWidth',2,'MarkerEdgeColor','black','MarkerFaceColor','white','MarkerSize',6)
plot(year,log(y_Chi),'pr-','MarkerEdgeColor','red','MarkerFaceColor','yellow','MarkerSize',8)
plot(year,log(y_Jap),'ob-','LineWidth',1,'MarkerEdgeColor','blue','MarkerFaceColor','white','MarkerSize',6)
plot(year,log(y_Kor),'sb-','MarkerEdgeColor','blue','MarkerFaceColor','blue','MarkerSize',6)
plot(year,log(y_Tur),'ok-','MarkerEdgeColor','black','MarkerFaceColor','red','MarkerSize',7)
hold off
grid on
title('log(Real GDP per capita)')
ylabel('log(1990 Int. Geary-Khamis Dollars)')
xlim([1868 2012])
legend('England','United States','China','Japan','South Korea','Turkey','Location','NorthWest','Orientation','vertical')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%