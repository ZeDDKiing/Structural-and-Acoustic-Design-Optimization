clear
L = optimvar('L');
R2= optimvar('R2');
SA=250*10^6;
E = 210*10^9;
P=5*10^4;
rho=7.8*10^3;
R1=0.080;
A= pi*(R2^2-R1^2);
obj = rho*A*L;
g1 =(0.088-R2)/R2<=0;
g2 =(R2-0.1)/R2<=0;
g3 =(R1-R2)/R2<=0;
g4 =(2-L)/L<=0;
g5 =(L-7)/L<=0;
g6 =(P/A-SA)/SA<=0;
g7 =(P-(pi^3*E*(R2^4-R1^4)/(16*L^2)))/P<=0;
prob = optimproblem('Objective',obj);
prob.Constraints.constr = [g1,g2,g3,g4,g5,g6,g7];
x0.L = 1;
x0.R2 =1;
show(prob)
[sol,fval] = solve(prob,x0)