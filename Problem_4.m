clear
wb = optimvar('wb');
wh= optimvar('wh');
A1 = 4*3.5;
A2 = 1.75;
A3 = wb*wh;
TL1 =40;
TL2 =28;
TL3 =22;
tau1 =1/(10^(TL1/10));
tau2 =1/(10^(TL2/10));
tau3 =1/(10^(TL3/10));
taub = (A1*tau1+A2*tau2+A3*tau3)/(A1+A2+A3);
obj = A3;
prob = optimproblem('Objective',obj);
%===============================
g1=(0.6-wb)<=0;
g2=(wb-3)<=0;
g3=(0.4-wh)<=0;
g4=(wh-1.5)<=0;
g5=taub-1/1e3==0;
prob.Constraints.constr = [g1;g2;g3;g4];
prob.Constraints.constr1 = [g5];
x0.wb = 1;
x0.wh = 1;
show(prob)
[sol,fval] = solve(prob,x0)