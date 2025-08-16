clear
b = optimvar('b');
h= optimvar('h');
L= optimvar('L');
Sb=250e6;
Ss=90e6;
E=210e9;
P=10e3;%maximum load
rho=7850;%density
bmin=0.005;
bmax=0.1;
hmin=0.002;
hmax=0.007;
I=b*h^3/12;%Area moment of inertia
S=P*L*h/(2*I);%Bending stress
tau=3*P/(2*b*h);%shear stress
A=b*h;%Area
obj = rho*L*A;
prob = optimproblem('Objective',obj);
g1=(-Sb+S)/Sb<=0;%bending stress condition
g2=(-Ss+tau)/Ss<=0;%shear stress condition
g3=(bmin-b)/bmin<=0;
g4=(b-bmax)/bmax<=0;
g5=(hmin-h)/hmin<=0;
g6=(h-hmax)/hmax<=0;
g7=(h-b)/0.5<=0;
g8=(1.5-L)/1.5<=0;
g9=(L-7)/7<=0;
prob.Constraints.constr = [g1;g2;g3;g4;g5;g6;g7;g8;g9];
x0.b = 0.09;
x0.h = 0.005;
x0.L = 3;
show(prob)
[sol,fval] = solve(prob,x0)