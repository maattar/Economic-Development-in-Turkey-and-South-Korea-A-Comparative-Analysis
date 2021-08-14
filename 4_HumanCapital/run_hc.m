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
%%%%%                     The Human Capital Model                    %%%%%
%%%%%                                                                %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cleaning
clc; clear all; close all;

%% Main algorithm for both countries 
run_TUR_hc;        % This program generates the results for Turkey.
evaluate_TUR_hc;   % This program collects and saves the results for Turkey.

run_KOR_hc;        % This program generates the results for Korea.
evaluate_KOR_hc;   % This program collects and saves the results for Korea.

%% Cleaning
clc; clear all; close all;

%% Loading the benchmark results for both countries
load('Turkey_hc.mat')
load('Korea_hc.mat')

%% Preparation for the figures
year    = Turkey_hc_simulation(:,1);
H_US_m  = Turkey_hc_simulation(:,7);

x_TUR_m = Turkey_hc_simulation(:,2);
x_TUR_d = Turkey_hc_simulation(:,3);
y_TUR_m = Turkey_hc_simulation(:,4);
y_TUR_d = Turkey_hc_simulation(:,5);
h_TUR_m = Turkey_hc_simulation(:,6);
e_TUR_m = Turkey_hc_simulation(:,8);
q_TUR_d = Turkey_hc_simulation(:,9);

x_KOR_m = Korea_hc_simulation(:,2);
x_KOR_d = Korea_hc_simulation(:,3);
y_KOR_m = Korea_hc_simulation(:,4);
y_KOR_d = Korea_hc_simulation(:,5);
h_KOR_m = Korea_hc_simulation(:,6);
e_KOR_m = Korea_hc_simulation(:,8);
q_KOR_d = Korea_hc_simulation(:,9);

%% Figure 9
figure(9)
subplot(1,2,1)
scatter(q_TUR_d,e_TUR_m)
grid on
xlim([1 4])
xlabel('Average Human Capital')
ylabel('Efficiency Term as a Function of Human Capital')
legend('Turkey','Location','SouthEast','Orientation','vertical')
subplot(1,2,2)
scatter(q_KOR_d,e_KOR_m)
grid on
xlim([1 4])
xlabel('Average Human Capital')
ylabel('Efficiency Term as a Function of Human Capital')
legend('South Korea','Location','SouthEast','Orientation','vertical')


%% Figure 10
figure(10)
plot(year,(e_TUR_m./e_KOR_m),'or-','LineWidth',2)
title('Turkey`s Relative Efficiency in Technology Adoption ( \eta^T^U^R_t / \eta^K^O^R_t )')
xlim([1958 2016])
ylim([0.013 0.018])
grid on




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%