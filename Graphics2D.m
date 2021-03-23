%% r = sin(x)/x
x = -8*pi:0.005:8*pi;
y = sin(x) ./ x;
plot(y .* cos(x),y .* sin(x));
grid on
%% y = humps(x)
x = 0:0.005:2;
A = [];
C = [0 0];
for i = x
    j = humps(i);
    if j >= 20 && j <= 40
        A = [A i];
    end
    if C(1) < j
        C = [j i];
    end
end
plot(x,humps(x),A, humps(A),'go',C(2),C(1),'ro');
grid on
%% y = x + 1/x^2
x = linspace(-20,20,200);
y = x + (1 ./ (x .^ 2));
plot(x,y)
grid on;
title('x+1/x^2');
xlabel('x');
ylabel('f(x)');
%% y = x * sin(Пx)
x = linspace(-10,10,500);
y = x .* sin(pi .* x);
plot(x,y,x,x,'r:',x,-x,'r:')
grid on;
title('x*sin(Пx)');
xlabel('x');
ylabel('f(x)');
%% y = a*(b-sin(kx)-cos(kx))/(a+(x-П/2)^n)
a = 100;
b = 2;
n = 4;
k = 14;
x = -pi/2:0.05:1.5*pi;
f = @(x)(a .* (b - sin(k * x) - cos(k * x))) ./ (a + (x - pi/2) .^ n);
y = f(x);
plot(y .* cos(x),y .* sin(x),0, -f(1.5*pi),'go');
hold on;
plot(0, -f(1.5*pi),'r.','MarkerSize',12);
grid on;
%% x = cos(t)-a*cos(mt)+b*sin(nt);
%  y = sin(t)+a*sin(mt)+b*cos(nt);
a = 1/4;
b = 1/16;
m = 8;
n = 8;
t = -5:0.05:5;
x = cos(t) - a * cos(m * t) + b * sin(n * t);
y = sin(t) + a * sin(m * t) + b * cos(n * t);
hold on;
s = 7;
for k = 1:s
    plot(x/k,y/k);
end
grid on;
%% y = (e^(-0.2*x))*sin(x)
x = linspace(-25,25,500);
y = (exp(-0.2 * x)) .* sin(x);
plot(x,y);
grid on;
%% r = a + |cos(nx)|
a = 1;
n = 4;
x = -pi:0.05:pi;
y = a + abs(cos(n * x));
plot(y .* cos(x),y .* sin(x));
grid on;
%% x = cos(nt)*(cos(t))^m;
%  y = sin(nt)*(sin(t))^m;
n = 2;
m = 2;
t = 0:0.05:2 * pi;
x = cos(n * t) .* ((cos(t)) .^ m);
y = sin(n * t) .* ((sin(t)) .^ m);
plot(x,y);
grid on;