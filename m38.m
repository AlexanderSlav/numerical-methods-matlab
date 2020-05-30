function [ ] = m38( a, b, eps )
tic
n=2;
Ii=1;
I=2;
while abs(Ii-I)>eps
    m=3*n-1;
    h=(b-a)/(3*n);
    S=0;
    X(1)=a;
    for i=1:m
        x=a+i*h;
        X(i+1)=x;
        if (mod(i,3)==0)
            S=S+2*source_func(x);
        else 
            S=S+3*source_func(x);
        end
    end
    X(m+2)=b;
    n=2*n;
    I=Ii;
    Ii=(3*S*h)/8;
end
for k = 1:m+1
    plot([X(k) X(k)], [0 source_func(X(k))], 'b');         
    XX(1)=X(k);
    XX(4)=X(k+1);
    XX=linspace(XX(1), XX(end), 4);
    Y=source_func(XX);
    p=polyfit(XX, Y, 3);
    xx=linspace(XX(1), XX(end), 10);
    yy=polyval(p, xx);
    plot(xx, yy, 'b');
    hold on;  
end
t = toc;
title('Method of 3/8');
fprintf('Integral: %g \n',Ii);
fprintf('Integration step: %g \n', h);
fprintf('Amount of integration step: %i \n', m+1)
fprintf('Time: %g \n', t); 
plot([X(m+2) X(m+2)], [0 source_func(X(m+2))], 'b');
X1=linspace(a, b, 50);
Y1=source_func(X1);
plot(X1, Y1, 'r');
end
