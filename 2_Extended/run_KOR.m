% This auxiliary program is called by run_benchmark.m for the extended
% model and for Korea.

clc; clear all; close all;

%% Initial values for the optimization algorithm
x0 = [0.75;1;0.65;0.5];      % ( xxii ; zett ; teta ; etta )

%% Lower and upper bounds 
lb = [0;1;0;0];
ub = [1;5;5;1];

%% Optimizer
options=optimset('Display','iter','Algorithm','interior-point');

[x,fval,exitflag] = fmincon(@solve_KOR,x0,[],[],[],[],lb,ub,[],options);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%