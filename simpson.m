function [] = simpson (a, b, eps)
tic
n = 2;
m = 1;
h = (b - a) / n;
f = false;
pre = 0;
while f==false
    S = 0;
    X(1)=a;
    for k = 1 : m 
        x = a + (2 * k - 1) * h;
        S = S + 2 * source_func(x) + source_func(x + h);
        X(k+1)=x;
    end
    X(m+2)=b;
    int = (source_func(a) - source_func(b) + 2 * S) * h / 3;
    if (abs(int - pre) < eps)
        f = true; 
        for k = 1:m+1
          plot([X(k) X(k)], [0 source_func(X(k))], 'b');         
          XX(1)=X(k);
          XX(3)=X(k+1);
          XX(2)=(XX(1)+XX(3))/2;
          Y=source_func(XX);
          p=polyfit(XX, Y, 2);
          xx=linspace(XX(1), XX(end), 10);
          yy=polyval(p, xx);
          plot(xx, yy, 'b');
          hold on;  
        end   
        plot([X(m+2) X(m+2)], [0 source_func(X(m+2))], 'r');
    else
        m = n;
        n = n *2;
        h = h / 2;
        pre = int;
    end
end
t = toc;
fprintf('Integral: %g \n',int);
fprintf('Integration step: %g \n', h);
fprintf('Amount of integration step: %i \n', n)
fprintf('Time: %g \n', t); 
title('Method of parabols(Simpson)');
X1=linspace(a, b, 50);
Y1=source_func(X1);
plot(X1, Y1, 'r');
end
