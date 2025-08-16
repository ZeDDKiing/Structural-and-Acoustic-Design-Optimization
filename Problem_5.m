clear
A= optimvar('A');
B= optimvar('B');
%========================================
P=50e3;
E=70e9;
theta=45*pi/180;
S1a=35e6;
S2a=140e6;
rho=2800;
L=1;
u = 0.125e-3;
v = u;
sigma_1=P*cos(theta)/(sqrt(2)*A)+P*sin(theta)/(sqrt(2)*(A+sqrt(2)*B));
sigma_2=sqrt(2)*P*sin(theta)/(A+sqrt(2)*B);
g1=(sigma_1-S1a)/sigma_1<=0;
g2=(sigma_2-S2a)/sigma_2<=0;
Amin=50e-6;
Amax=40000e-6;
g3=Amin-A<=0;
g4=A-Amax<=0;
g5=Amin-B<=0;
g6=B-Amax<=0;
g7=u-sqrt(2)*L*P*cos(theta)/(E*A)==0;
g8=v-sqrt(2)*L*P*sin(theta)/(E*(A+sqrt(2)*B))==0;
obj = rho*L*(A+sqrt(2)*B+A);
prob = optimproblem('Objective',obj);
%==========================================================
prob.Constraints.constr = [g1;g2;g3;g4;g5;g6];
prob.Constraints.constr1 = [g7;g8];
x0.A = 10e-6;
x0.B = 10e-6;
show(prob)
[sol,fval] = solve(prob,x0)