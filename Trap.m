function [ ] = Trap( a, b, eps )
tic
n = 2;
h = (b - a) / n;
f = false;
prev = 0;
%plot(0,0,'-r');
while(1)
    S = 0;   
    x0=a;
    x=x0+h;
    for k = 1 : n
        X1(k)=x0;
        X2(k)=x;
        x0 = a + k * h - h / 2;
        x = x0 + h;
        S = S + (source_func(x0)+source_func(x))/2;
    end
    int = S * h;
    if(abs(int - prev) < eps)
        f = true; 
        for k=1:n
            hold on;
            plot([X1(k) X2(k)], [source_func(X1(k)) source_func(X2(k))], 'b'); 
            plot([X1(k) X1(k)], [0 source_func(X1(k))], 'b'); 
            plot([X2(k) X2(k)], [0 source_func(X2(k))], 'b'); 
        end 
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
title('Method of trapezoid');
fprintf('Integral: %g \n',int);
fprintf('Integration step: %g \n', h);
fprintf('Amount of integration step: %i \n', n);
fprintf('Time: %g \n', t);
X = a:0.1:b;
Y = source_func(X);
plot (X, Y, 'r');
end
