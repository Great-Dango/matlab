%%
t = 0:0.05:6*pi;
x = sin(t);
y = 2 * cos(t);
plot3(x,y,t,-1,0,7 * pi / 2,'r*');
line([-1,-1], [2,-2], [7 * pi / 2 + 1,7 * pi / 2 - 1],'LineStyle','--');
grid on;
%%
t = -10*pi:0.05:10*pi;
x = (cos(2*t).^2).*sin(t);
y = (sin(2*t).^2).*cos(t);
comet3(x,y,t);
grid on;
%% z = -x*sin(x)-y*cos(y)
x = -10:0.3:10;
y = -10:0.3:10;
[X,Y] = meshgrid(x,y);
Z = -X .* sin(X) - Y .* cos(Y);
mesh(X,Y,Z);
%% contour plot z = sin(x)cos(y)
x = -1:0.1:1;
y = -1:0.1:1;
[X,Y] = meshgrid(x,y);
Z = sin(X).*cos(Y);
figure('Position',[200,150,1500,800]);
subplot(1,2,1);
mesh(X,Y,Z);
subplot(1,2,2);
[G,h] = contourf(X,Y,Z);
clabel(G,h);
colorbar;
%%
x = linspace(-pi,pi,40);
y = linspace(-pi,pi,50);
[X,Y]=meshgrid(x,y);
Z = @(a,b)(20 - a.^2 - b.^2);
figure('Position',[500,150,800,800]);
surf(X,Y,Z(X,Y));
axis equal;
line([0,0],[-1,-3],[19,20]);
hold on;
q = 0:0.1:6*pi;
r = 0.1 * q;
plot3(r.*cos(q),r.*sin(q)-1,r.*0,r.*cos(q),r.*sin(q)-1,Z(r.*cos(q),r.*sin(q)-1),'g','LineWidth',2);
colormap(gray);
%% ax+by+cz+d=0
a = 1;
b = 1;
c = 1;
d = 0;
x = -10:0.05:10;
y = -10:0.05:10;
[X,Y] = meshgrid(x,y);
Z = d - a * X - b * Y;
mesh(X,Y,Z);
%% z = a*sin(sqrt(x^2+y^2))/sqrt((x^2+y^2))
a = 1;
x = -10:0.3:10;
y = -10:0.3:10;
[X,Y] = meshgrid(x,y);
Z = a * sin((X.^2 + Y.^2).^0.5) ./ (X.^2 + Y.^2).^0.5;
surfc(X,Y,Z);
view(-38,18);
%shading flat;
%shading interp;
%colorbar;
%% z = axe^(-x^2-y^2)
a = 1;
x = -5:0.1:5;
y = -5:0.1:5;
[X, Y] = meshgrid(x,y);
Z = a*X.*exp(-X.^2-Y.^2);
mesh(X,Y,Z);
view(10,10);
%% single-cavity hyperboloid
c = 1; d = 1;
a = -3*pi:0.05:3*pi;
b = -3*pi:0.05:3*pi;
[A,B] = meshgrid(a,b);
x = c*cosh(A).*cos(B);
y = c*cosh(A).*sin(B);
z = d*sinh(A);
mesh(x,y,z);
%% ellipsoid of rotation
u = 0:0.05:3*pi;
v = -pi/2:0.05:pi/2;
[U,V] = meshgrid(u,v);
x = cos(U).*cos(V);
y = sin(U).*cos(V);
z = sin(V);
surfc(x,y,z);
%%
t = 0:0.05:6*pi;
x = sin(t);
y = cos(t);
plot3(x,y,t,'r',-x,-y,t,'g');
grid on;
axis equal;
for i=0:0.1:6*pi
    line([sin(i),-sin(i)],[cos(i),-cos(i)],[i,i]);
end
%%
c = 1; d = 1;
a = -2*pi:0.1:2*pi;
b = -2*pi:0.1:2*pi;
[A,B] = meshgrid(a,b);
x = c*cosh(A).*cos(B);
y = c*cosh(A).*sin(B);
z = d*sinh(A);
surf(x,y,z);
hold on;
axis equal;
for t=0:0.2:2*pi
   xz = cos(t);
   yz = sin(t);
   lumda = (1 - yz)/xz;
   vx = [xz];vy=[yz];vz=[0];
   while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<400
       vx = [vx(1)+lumda^2-1,vx];
       vy = [vy(1)+2*lumda,vy];
       vz = [vz(1)+1+lumda^2,vz];
   end
   plot3(vx,vy,vz,'r');
   vx = [xz];vy=[yz];vz=[0];
   while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<400
       vx = [vx(1)-lumda^2+1,vx];
       vy = [vy(1)-2*lumda,vy];
       vz = [vz(1)-1-lumda^2,vz];
   end
   plot3(vx,vy,vz,'r');
   vx = [xz];vy=[yz];vz=[0];
   while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<400
       vx = [vx(1)-lumda^2+1,vx];
       vy = [vy(1)-2*lumda,vy];
       vz = [vz(1)+1+lumda^2,vz];
   end
   plot3(vx,vy,vz,'g');
    vx = [xz];vy=[yz];vz=[0];
   while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<400
       vx = [vx(1)+lumda^2-1,vx];
       vy = [vy(1)+2*lumda,vy];
       vz = [vz(1)-1-lumda^2,vz];
   end
   plot3(vx,vy,vz,'g');
end
%%
a = -6*pi:0.5:6*pi;
b = -6*pi:0.5:6*pi;
[A,B] = meshgrid(a,b);
x = A*sqrt(2);
y = B*sqrt(2);
z = A.^2-B.^2;
surf(x,y,z);
hold on;
axis([-20 20 -20 20 -200 200]);
for t=0:1:200
    vx = [0];vy = [t];vz = [t*t/-2];
    while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<200
       vx = [vx(1)+1,vx];
       vy = [vy(1)+1,vy];
       vz = [vz(1)-t,vz];
    end
    plot3(vx,vy,vz,'g',vx,-vy,vz,'g');
    vx = [0];vy = [t];vz = [t*t/-2];
    while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<200
       vx = [vx(1)-1,vx];
       vy = [vy(1)-1,vy];
       vz = [vz(1)+t,vz];
    end
    plot3(vx,vy,vz,'g',vx,-vy,vz,'g');
    vx = [0];vy = [t];vz = [t*t/-2];
    while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<200
       vx = [vx(1)+1,vx];
       vy = [vy(1)-1,vy];
       vz = [vz(1)+t,vz];
    end
    plot3(vx,vy,vz,'r',vx,-vy,vz,'r');
    vx = [0];vy = [t];vz = [t*t/-2];
    while sqrt(vx(1)^2+vy(1)^2+vz(1)^2)<200
       vx = [vx(1)-1,vx];
       vy = [vy(1)+1,vy];
       vz = [vz(1)-t,vz];
    end
    plot3(vx,vy,vz,'r',vx,-vy,vz,'r');
end
%%
f = @(x,y,z)(-x.^2.*z.^3-9*y.^2.*z.^3/80+(x.^2+9*y.^2/4+z.^2-1).^3);
fimplicit3(f);