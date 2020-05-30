warning('off')
fprintf('The source function is: y=1/(x*sqrt(x^2-1))\n');
fprintf('Low integration limit: -3\n');
fprintf('High integration limit: -2\n');
fprintf('Calculation accuracy: 1e-6\n');
exp=1e-2;
figure;
fprintf('-------------------------\n');
fprintf('Method of left rectangles\n');
LRect(-3,-2,exp);
figure;
fprintf('-------------------------\n');
fprintf('Method of right rectangles\n');
RRect(-3,-2,exp);
figure;
fprintf('-------------------------\n');
fprintf('Method of center rectangles\n');
CRect(-3,-2,exp);
figure;
fprintf('-------------------------\n');
fprintf('Method of trapezoid\n');
Trap(-3,-2,exp);
figure;
fprintf('-------------------------\n');
fprintf('Method of Simpson\n');
simpson(-3,-2,exp);
figure;
fprintf('Method of 3/8\n');
m38(-3,-2,exp);
figure;
fprintf('-------------------------\n');
fprintf('Method of Monte-Karlo\n');
MK(-3,-2,1000);
fprintf('Check \n');
orig_func = @(x) 1./(x.*sqrt(x.^2-1))
q=integral(orig_func, -3, -2);
fprintf('integral: %.7f\n', q);
x=-3:0.0001:2;
y=source_func(x);
t=trapz(x, y);
fprintf('trapz: %.6f\n', t);