%% Lemniscata Bernoulli
c = 1;
f = @(x,y)(x .^ 2 + y .^ 2) .^ 2 - 2 * c ^ 2 * (x .^ 2 - y .^ 2);
c = c * sqrt(2);
ezplot(f,[-c c -c c]);
grid on;
%% Grandi's roses
a = 15;
k = 6/7;
x = -2*a:0.05:2*a;
y = a * sin(k * x);
plot(y .* cos(x),y .* sin(x));
%% Pascal's Snail
a = 7;
l = 5;
f = @(x,y)(x .^ 2 + y .^ 2 + a .* y) .^ 2 - l ^ 2 .* (x .^ 2 + y .^ 2);
ezplot(f,[-2*a 2*a -2*a 2*a]);
grid on;
