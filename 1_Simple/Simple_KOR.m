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
%%%%%                         The Simple Model                       %%%%%
%%%%%                                                                %%%%%
%%%%%                           South Korea                          %%%%%
%%%%%                                                                %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cleaning
clc; clear all; close all;

%% Parameter Values (Lucas 2099 Benchmark)
alfa = 0.6;
xxii = 0.75;
zett = 1;
teta = 0.65;
etta = 1;

%% Data (World Development Indicators)
D = csvread('data_korusa.csv');
year = D(:,1);
xd   = 1-(D(:,2)/100);
yd   = D(:,3);

%% Model horizon
T = size(D,1);

%% The U.S. growth rate and initial value 
t = 1:1:T;
t = t';

ones = zeros(T,1) + 1;
X = [ones t];
B = regress(log(D(:,4)),X);

mmuu = exp(B(2,1))-1;
H0   = exp(B(1,1));

H = zeros(T+1,1);
h = H;

%% Empty report 
x   = zeros(T,1);
y   = x;

%% Initial value calibration
A  = (yd(1,1)*((((alfa/(xd(1,1)^(1-alfa)))^(xxii/(1-xxii)))*(xd(1,1)^(alfa)) + ((alfa/(xd(1,1)^(1-alfa)))^(1/(1-xxii)))*(1-xd(1,1)))^(-1)))^(1-xxii);
h0 = ((alfa*A)/(xd(1,1)^(1-alfa)))^(1/(1-xxii));

%% The forward recursion
h(1,1) = h0;
H(1,1) = H0;

for t=1:T;
    x(t,1)   = ((alfa*A)/(h(t,1)^(1-xxii)))^(1/(1-alfa));
    H(t+1,1) = (1+mmuu)*H(t,1);
    h(t+1,1) = h(t,1) + etta*mmuu*((1-x(t,1))^(zett))*((H(t,1)/h(t,1))^(teta))*h(t,1);
    y(t,1)   = A*(h(t,1)^xxii)*(x(t,1)^alfa) + h(t,1)*(1-x(t,1));
end

H = H(1:T,1); %#ok<*NASGU>
h = h(1:T,1);

%% Figure 2
figure(2)
subplot(2,1,1)
plot(year,x,'LineWidth',2)
hold on
plot(year,xd,'or','MarkerFaceColor','red')
hold off
title('Share of Rural Population')
ylabel('between 0 and 1')
xlim([1958 2016])
ylim([0.1 0.75])
grid on
legend('Model','Data','Location','SouthWest','Orientation','vertical')
subplot(2,1,2)
plot(year,log(y),'LineWidth',2)
hold on
plot(year,log(yd),'or','MarkerFaceColor','red')
hold off
title('log(Real GDP per capita)')
ylabel('log(2005 constant US Dollars)')
xlim([1958 2016])
ylim([6.75 10.25])
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%