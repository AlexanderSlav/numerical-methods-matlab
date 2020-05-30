function [ ] = RRect( a, b, eps )
tic
n = 2;
h = (b - a) / n;
f = false;
prev = 0;   
while(1)
    S = 0;
    X(1)=a;
    for k = 1 : n
        x = a + k * h;
        S = S + source_func(x);
        X(k+1)=x;
    end
    int = S * h;
    if(abs(int - prev) < eps)
        f = true;
    else
        n = n * 2;
        h = h / 2;
        prev = int;
    end 
    if(f == true)
        break;
    end 
end
Y=source_func(X);
XX(1)=a-h;
for k=1:n
    XX(k+1)=X(k);
end
t = toc;
fprintf('Integral: %g \n',int);
fprintf('Integration step: %g \n', h);
fprintf('Amount of integration step: %i \n', n)
fprintf('Time: %g \n', t);
bar(XX, Y, 'histc');
hold on;
title('Method of right rectangles');
X1=linspace(a, b, 100);
Y1=source_func(X1);
plot(X1, Y1, 'r');
legend('Calculated function graphic', 'Source function graphic f(x) = 1./x.*sqrt(x.^2-1)', 'Location', 'northwest');
hold off;
end



