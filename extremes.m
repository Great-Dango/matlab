%%
f = @(x)1./(cos(x)+2*sin(x)).^2;
t = 0:0.05:2*pi/3;
plot(t,f(t));
hold on;
grid on;
xr = ginput(2);
[x_m,y_m] = fminbnd(f,xr(1),xr(2));
plot(xr(1),xr(3),'g*',xr(2),xr(4),'g*',x_m,y_m,'r*');
%%
t = 0:0.05:2*pi;
d = [3,5,2,-1];
f = 0*t;
g = "";
for i=1:length(d)
    g = g +"+("+ string(d(i)) + "-sin("+string(i)+"*x)).^2";
    f = f + (d(i) - sin(i*t)).^2;
end
plot(t,f);
hold on;
grid on;
xr = ginput(2);
[x_m,y_m] = fminbnd(g,xr(1),xr(2));
plot(xr(1),xr(3),'g*',xr(2),xr(4),'g*',x_m,y_m,'r*');
%%
%%
t = 0:0.01:1;
hold on;
grid on;
for a=1:5
    f = @(x)x.^a.*log(x);
    [x_m,y_m] = fminbnd(f,0,1);
    plot(t,f(t),x_m,y_m,'r*');
end
%%
t = -1:0.01:1;
hold on;
grid on;
for a=1:3
    for b=1:3
        f = @(x)x.^a.*exp(-b*x);
        [x_m,y_m] = fminbnd(f,-1,1);
        plot(t,f(t),x_m,y_m,'r*');
    end
end
%%
t = -1:0.01:1;
hold on;
grid on;
for a=1:3
    for b=1:3
        f = @(x)x.^a.*(1-x).^b;
        [x_m,y_m] = fminbnd(f,-1,1);
        plot(t,f(t),x_m,y_m,'r*');
    end
end