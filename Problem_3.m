clear
l = optimvar('l');%Length
b= optimvar('b');%Outer diameter
h= optimvar('h');
E=210e9;
rho=7800;%density
bmin=0.005;
bmax=0.2;
hmin=0.002;
hmax=0.1;
Lmin=0.5;
Lmax=7.0;
knl=1.875;
I=b*h^3/12;%Area moment of inertia
A=b*h;%Area
rho_L=A*rho
kn=knl/l;
fa=500;%allowable frequency
fn=1/2/pi*sqrt(E*I*kn^4*l/rho_L)
Wa=5;
W=rho*A*l;
obj = rho*l*A;
prob = optimproblem('Objective',obj);
%==========constraints=======
g1=fn-fa<=0;
g2=bmin-b<=0
g3=b-bmax<=0
g4=Lmin-l<=0
g5=l-Lmax<=0
g6=h-b<=0
g7=W-Wa<=0;
g8=hmin-h<=0
g9=h-hmax<=0
prob.Constraints.constr = [g1;g2;g3;g4;g5;g6;g7;g8;g9];
x0.l = 1;
x0.b = 1;
x0.h = 1;
show(prob)
[sol,fval] = solve(prob,x0)