%%
a = 1;
f = @(x)x*x-1;
r = fzero(f,5)
%%
f = @(x)x.^2+2*x-1-sin(x);
t = -3:0.1:3;
plot(t,f(t),t,0.*t,':');
grid on;
xlabel('x');
ylabel('y');
p = ginput(1);
[x,y] = fzero(f,p(1));
hold on;
plot(p(1),p(2),'g*',x,y,'r*');
%%
f = @(x)sin(exp(x));
t = -3:0.01:3;
plot(t,f(t),t,0*t,'g:');
grid on;
hold on;
x = ginput(1);
[px,py] = fzero(f,x(1));
plot(x(1),x(2),'g*',px,py,'r*');
%%
f = @(x)5*(exp(-0.1*x)).*sin(x)-0.1*x;
t = -2*pi:0.01:6*pi;
plot(t,f(t),t,0*t,'g:');
grid on;
hold on;
x = ginput(1);
[px,py] = fzero(f,x(1));
plot(x(1),x(2),'g*',px,py,'r*');
%%
syms x
fzero('x^2+1',0)
solve(x^2+1,x)
%%
f = @(x)cos(x)-exp(0.001+x.^2);
t = -1:0.05:1;
plot(t,f(t));
grid on;
hold on;
t = ginput(1);
[px,py,flag] = fzero(f,t(1));% flag = -3 корней нет
solve(cos(x)-exp(0.001+x.^2),x);% пустой результат - корней нет
%%
f = @(x)sin(x)./x;
a = input('введите a: ');
b = input('введите b: ');
i = input('введите i: ');
eps = input('введите eps: ');
t = a:0.05:b;
plot(t,f(t),t,0*t,'--');
grid on;
hold on;
[x1, y1] = ginput(1);
while i && abs(f(x1)) > eps
    i = i - 1;
    k = (cos(x1)*x1-sin(x1))/x1^2;
    x = -f(x1)/k+x1;
    vert = line([x,x],[0,f(x)]);
    touch = plot(t,k*(t-x1)+f(x1),x,0,'*',x,f(x),'*');
    pause;
    delete(touch); delete(vert);
    x1 = x;
end
%%
f = @(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
eps = input('введите eps: ');
t = -10:0.05:10;
plot(t,f(t),t,0*t,'--');
grid on;
hold on;
r = ginput(2);
a = r(1); b = r(2);
while abs(f(a)) > eps && f(a)*f(b) < 0
    m = (a+b)/2;
    if f(m) > 0 && f(a) > 0 || m < 0 && f(a) < 0
        a = m;
    else
        b = m;
    end
    plot(m,0,'or');
    pause;
end
