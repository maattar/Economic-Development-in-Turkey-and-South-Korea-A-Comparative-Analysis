% This program implements the counterfactual experiments at once and
% generates Figure 7.

%% Clean
clc; clear all; close all;

%% Load the benchmark resuls
load('Turkey_bm.mat')
load('Korea_bm.mat')

alfa = 0.6;

%% Design the experiments
numEx = 3;                                              % # of Experiments

phi = NaN(4,1,numEx);                                   % Empty

phi(:,:,1) = Turkey_bm_paramval';                       % Experiment 1

phi(:,:,2) = Korea_bm_paramval';                        % Experiment 2
phi(4,1,2) = Turkey_bm_paramval(1,4);

phi(:,:,3) = Korea_bm_paramval';                        % Experiment 3
phi(4,1,3) = 0.3316*Korea_bm_paramval(1,4);

%% Compute with experimented values

D = csvread('data_korusa.csv');
year = D(:,1);
xd   = 1-(D(:,2)/100);
yd   = D(:,3);

T = size(D,1);
t = 1:1:T;
t = t';

ones = zeros(T,1) + 1;
X = [ones t];
B = regress(log(D(:,4)),X);
mmuu = exp(B(2,1))-1;
H0   = exp(B(1,1));

H = zeros(T+1,1,numEx);
h = H;

x   = zeros(T,1,numEx);
y   = x;

for n = 1:numEx;
    
    phi_n = phi(:,:,n);
    
    xxii = phi_n(1,1);
    zett = phi_n(2,1);
    teta = phi_n(3,1);
    etta = phi_n(4,1);
    
    A  = (yd(1,1)*((((alfa/(xd(1,1)^(1-alfa)))^(xxii/(1-xxii)))*(xd(1,1)^(alfa)) + ((alfa/(xd(1,1)^(1-alfa)))^(1/(1-xxii)))*(1-xd(1,1)))^(-1)))^(1-xxii);
    h0 = ((alfa*A)/(xd(1,1)^(1-alfa)))^(1/(1-xxii));
    
    h(1,1,n) = h0;
    H(1,1,n) = H0;

    for t=1:T;
        x(t,1,n)   = ((alfa*A)/(h(t,1,n)^(1-xxii)))^(1/(1-alfa));
        H(t+1,1,n) = (1+mmuu)*H(t,1,n);
        h(t+1,1,n) = h(t,1,n) + etta*mmuu*((1-x(t,1,n))^(zett))*((H(t,1,n)/h(t,1,n))^(teta))*h(t,1,n);
        y(t,1,n)   = A*(h(t,1,n)^xxii)*(x(t,1,n)^alfa) + h(t,1,n)*(1-x(t,1,n));
    end

    H = H(1:T,1,n); %#ok<*NASGU>
    h = h(1:T,1,n);

end

%% Collect the results
year     = Turkey_bm_simulation(:,1);

x_TUR_bm = Turkey_bm_simulation(:,2);

y_TUR_bm = Turkey_bm_simulation(:,4);

x_KOR_cf1 = x(:,:,1);

y_KOR_cf1 = y(:,:,1);

x_KOR_cf2 = x(:,:,2);

y_KOR_cf2 = y(:,:,2);

x_KOR_cf3 = x(:,:,3);

y_KOR_cf3 = y(:,:,3);


%% Figure 7
figure(7)
subplot(1,2,1)
plot(year,x_TUR_bm,'LineWidth',2,'Color','black')
hold on
plot(year,x_KOR_cf1,'ob-','MarkerEdgeColor','blue','MarkerFaceColor','white','MarkerSize',7)
plot(year,x_KOR_cf2,'^k-','MarkerEdgeColor','black','MarkerFaceColor','cyan','MarkerSize',7)
plot(year,x_KOR_cf3,'vr-','MarkerEdgeColor','red','MarkerFaceColor','yellow','MarkerSize',7)
hold off
title('Share of Rural Population')
ylabel('between 0 and 1')
xlim([1958 2016])
ylim([0.15 0.75])
grid on
subplot(1,2,2)
plot(year,log(y_TUR_bm),'LineWidth',2,'Color','black')
hold on
plot(year,log(y_KOR_cf1),'ob-','MarkerEdgeColor','blue','MarkerFaceColor','white','MarkerSize',7)
plot(year,log(y_KOR_cf2),'^k-','MarkerEdgeColor','black','MarkerFaceColor','cyan','MarkerSize',7)
plot(year,log(y_KOR_cf3),'vr-','MarkerEdgeColor','red','MarkerFaceColor','yellow','MarkerSize',7)
hold off
title('log(Real GDP per capita)')
ylabel('log(2005 constant US Dollars)')
xlim([1958 2016])
ylim([5.25 9.75])
grid on
legend('Turkey (Benchmark)','South Korea (Exp.#1)','South Korea (Exp.#2)','South Korea (Exp.#3)','Location','SouthEast','Orientation','vertical')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%