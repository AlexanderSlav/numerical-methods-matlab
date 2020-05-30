function [ ] = MK(a,b,n)
   tic
   hold on;
   Xi = a: 1/n :b;
   plot(Xi,source_func(Xi),'b');
   h = abs(max(source_func(Xi)) - min(source_func(Xi)));
   S = (b-a)*h;
   x = a+(b-a).*rand(n ,1);
   y = min(source_func(Xi)) + h.*rand(n,1);
   k = 0;
   for i = 1:n
       if (((y(i) <source_func(x(i))) && (y(i) > 0)) || ((y(i) >source_func(x(i))) && (y(i) < 0)))
           k = k+1;
           plot(x(i),y(i),'.g');
       else
           plot(x(i),y(i),'.r');
       end
   end
   F = S*k/n;
   s = 0;
   for i = 1:n
        s = s +source_func(x(i));
   end
   t = toc
   Fn = s*(b - a)./n;
   title('Method of Monte-Karlo');
   fprintf('Integration Step: %g \n', h);
   fprintf('Estimation: %g \n', F);
   fprintf('Integral: %g \n', Fn);
   fprintf('Time: %g \n', t);
   X = [a,b];
   Y = [0,0];
   plot(X, Y, 'b');
   hold off
end


