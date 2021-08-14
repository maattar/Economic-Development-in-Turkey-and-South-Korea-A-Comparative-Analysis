% This auxiliary program is called by run_benchmark.m for the human capital
% model and for Korea.

clc; clear all; close all;

%% Initial values for the optimization algorithm
x0 = [0.75;1;0.65;0.5;1];      % ( xxii ; zett ; teta ; etta ; omga )

%% Lower and upper bounds 
lb = [0;1;0;0;0];
ub = [1;5;5;1;2];

%% Optimizer
options=optimset('Display','iter','Algorithm','interior-point','MaxFunEvals',1e+100,'MaxIter',1e+100,'TolFun',1e-7,'TolX',1e-7,'TolCon',1e-7);


[x,fval,exitflag] = fmincon(@solve_KOR_hc,x0,[],[],[],[],lb,ub,[],options);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
