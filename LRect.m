function [ ] = LRect( a, b, eps )
tic
n = 2;
h = (b - a) / n;
f = false;
prev = 0;
while(1)
    S = 0;
    for k = 1 : n
        x = a + (k - 1) * h;
        S = S +source_func(x);
        X(k)= x;
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
t = toc;
fprintf('Integral: %g \n',int);
fprintf('Integration step: %g \n', h);
fprintf('Amount of integration step: %i \n', n)
fprintf('Time: %g \n', t); 
bar(X, source_func(X),'histc');
hold on;
title('Method of left rectangles');
X1=linspace(a, b, 100);
Y1=source_func(X1);
plot(X1, Y1, 'r');
legend('Calculated function graphic', 'Source function graphic f(x) = 1./x.*sqrt(x.^2-1)', 'Location', 'northwest');
end
    

