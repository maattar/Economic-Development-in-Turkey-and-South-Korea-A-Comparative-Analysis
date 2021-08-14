% This auxiliary program is called by run_benchmark.m for the human capital
% model and for Turkey.

alfa = 0.6;
xxii = x(1,1);
zett = x(2,1);
teta = x(3,1);
etta = x(4,1);
omga = x(5,1);

D = csvread('data_turusa.csv');
year = D(:,1);
xd   = 1-(D(:,2)/100);
yd   = D(:,3);
qd   = D(:,5);

T = size(D,1);
t = 1:1:T;
t = t';

ones = zeros(T,1) + 1;
X = [ones t];
B = regress(log(D(:,4)),X);
mmuu = exp(B(2,1))-1;
H0   = exp(B(1,1));

H = zeros(T+1,1);
h = H;

x   = zeros(T,1);
y   = x;
e   = y;

A  = (yd(1,1)*((((alfa/(xd(1,1)^(1-alfa)))^(xxii/(1-xxii)))*(xd(1,1)^(alfa)) + ((alfa/(xd(1,1)^(1-alfa)))^(1/(1-xxii)))*(1-xd(1,1)))^(-1)))^(1-xxii);
h0 = ((alfa*A)/(xd(1,1)^(1-alfa)))^(1/(1-xxii));

h(1,1) = h0;
H(1,1) = H0;

for t=1:T;
    x(t,1)   = ((alfa*A)/(h(t,1)^(1-xxii)))^(1/(1-alfa));
    H(t+1,1) = (1+mmuu)*H(t,1);
    h(t+1,1) = h(t,1) + etta*(qd(t,1)^(omga))*mmuu*((1-x(t,1))^(zett))*((H(t,1)/h(t,1))^(teta))*h(t,1);
    y(t,1)   = A*(h(t,1)^xxii)*(x(t,1)^alfa) + h(t,1)*(1-x(t,1));
    e(t,1)   = etta*(qd(t,1)^(omga));
end

H = H(1:T,1); %#ok<*NASGU>
h = h(1:T,1);

Turkey_hc_simulation = [year x xd y yd h H e qd];
Turkey_hc_paramval = [xxii zett teta etta omga];

save('Turkey_hc.mat','Turkey_hc_simulation','Turkey_hc_paramval');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%