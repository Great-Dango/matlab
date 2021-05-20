%%
syms x
f = x^5+4*x^4-2*x^3-14*x^2-3*x-18;
r = factor(f);
g = "("+string(r(1))+")";
for i=2:length(r)
    g = g+"*("+string(r(i))+")";
end
g
%%
syms x y
f = x^3+x^2*y+x^2-2*x*y^2+x*y-2*y^2;
r = factor(f);
g = "("+string(r(1))+")";
for i=2:length(r)
    g = g+"*("+string(r(i))+")";
end
g
%%
syms x h
f = x*exp(-x);
limit(f,inf)
f = tan(x)^(tan(2*x));
limit(f,pi/4)
f = (sqrt(x+h)-sqrt(x))/h;
limit(f,h,0)
%%
syms x
f = atan(x)/2-x/(2*(1+x^2)^2);
df = diff(f);
simplify(df)
f = (sin(3*x)-cos(3*x))^2;
df = diff(f);
simplify(df)
%%
syms x
f = (1-x^2)^0.5/x^2;
int(f)
f = log(sin(x));
%%
syms x k
f = 1/x^2;
r = symsum(f,1,inf);
f = 1/(x-k)^3;
r = symsum(f,k,-inf,inf);
%%
syms x
a = 0; n = 5;
f = exp(x);
ft = taylor(f,x,a,'Order',n+1);
ezplot(f,-5,5);
hold on;
grid on;
ezplot(ft,-5,5);
title("e^x");
%%
a = 0; n = 10;
f = sin(x)^2;
ft = taylor(f,x,a,'Order',n+1);
ezplot(f,-3,3);
hold on;
grid on;
ezplot(ft,-3,3);
title("sin(x)^2");
%%
syms x
y = exp(1/(1-x^2))/(1+x^2);
dy = simplify(diff(y));
e = solve(dy);
ezplot(y,[-7 7]);
hold on;
grid on;
axis([-6 6 0 5]);
for i=1:length(e)
    plot(e(i),subs(y,x,e(i)),'r*');
end
ddy = simplify(diff(y,2));
e = solve(ddy);
for i=1:length(e)
    if imag(subs(y,x,e(i)))==0
        plot(e(i),subs(y,x,e(i)),'g*');
    end
end
k1 = limit(y/x,inf);
b1 = limit(y-k1,inf);
y1 = k1*x+b1;
k2 = limit(y/x,-inf);
b2 = limit(y-k2,-inf);
y2 = k2*x+b2;
fplot(y1,[-7 7],'--');
fplot(y2,[-7 7],'--');
for i=-7:0.1:7
    if abs(limit(y,x,i,'left')) == inf || abs(limit(y,x,i,'right')) == inf
        line([i,i],[-10,10],'Color','red','LineStyle','--');
    end
end
%%
syms x
y = sin(x)/(x^2+1);
f = matlabFunction(y);
x_min = fminbnd(f,-5,5);
x_max = fminbnd(matlabFunction(-y),-5,5);
fplot(y,[-5 5]);
hold on;
grid on;
plot(x_min,f(x_min),'r*',x_max,f(x_max),'r*');
%%
syms t u
x = t*cos(u)^2;
y = t^2*cos(u)*sin(u);
z = t^3*sin(u);
dr = [diff(x,u) diff(y,u) diff(z,u)];
ddr = [diff(x,u,2) diff(y,u,2) diff(z,u,2)];
dddr = [diff(x,u,3) diff(y,u,3) diff(z,u,3)];
k = sqrt(dot(cross(dr,ddr),cross(dr,ddr))/dot(dr,dr)^3);
kappa = dot(cross(dr,ddr),dddr)/k^2;