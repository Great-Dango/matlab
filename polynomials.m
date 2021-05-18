%%
p = [1,-3.55,5.1,-3.1];
x = -2:0.05:2;
y = polyval(p,x);
%k = roots(p)
%k =
%
%   1.5500 + 0.0000i
%   1.0000 + 1.0000i
%   1.0000 - 1.0000i
plot(x,y,1.55,polyval(p,1.55),'rx');
grid on;
%%
p = [1,0.1,0.2,-0.2,-2,1];
r = max(roots(p));
dr = sqrt(real(r)^2 + imag(r)^2);
x = -dr:0.05:dr;
f = polyval(p,x);
subplot(1,2,1);
plot(x,f,'r');
grid on;
x1 = dr/2;
k = polyval(polyder(p),x1);
line([x1 - 1,x1 + 1],[polyval(p,x1) - k,polyval(p,x1) + k]);
x2 = -dr/2;
k = polyval(polyder(p),x2);
line([x2,x2 - k/sqrt(1+k^2)],[polyval(p,x2),polyval(p,x2) + 1/sqrt(1+k^2)]);
axis equal
subplot(1,2,2);
hold on;
grid on;
v = roots(p);
for i = 1:length(v)
    plot(real(v(i)),imag(v(i)),'rx');
end
%%
A = [2,-3,4,-5,6];
B = [1,-3,1];
[q,r] = deconv(A,B)
conv(B,q) + r
%%
p = [1,-2,6,-10,16];
valp = p(1);
xp = 4;
for i = 2:length(p)
    valp = valp * xp + p(i);
end
valp
polyval(p,xp)
q = [1,-2,6,-10,16];
valq = q(1);
xq = -2-i;
for i = 2:length(p)
    valq = valq * xq + q(i);
end
valq
polyval(q,xq)
%%
X = -1:0.05:1;
N = 1:1:10;
%[x,n] = meshgrid(X,N);
%y = x.^(2.*n)-n.*x.^(n+1)+n.*x.^(n-1)+1;
%plot(x,y);
x = -1:0.05:1;
hold on;
grid on;
for n = 1:1:30
    y = x.^(2*n)-n*x.^(n+1)+n*x.^(n-1)-1;
    plot(x,y);
end
%%
% r вектор - столбец коэффициентов в числителях
% p вектор - столбец корней полинома
% k вектор - столбец коэффициентов полинома целой части
a = [1,0,0];
b = poly([-1,-2,-3]);
[r,p,k] = residue(a,b)
a = [1,3];
b = poly([1,j,-j]);
[r,p,k] = residue(a,b)
a = [1,0,0];
b = poly([-1,1,j,-j]);
[r,p,k] = residue(a,b)
%%
n = 7;
y = [];
for i=1:n
    y = [y 1/i];
end
x = [];
for k=1:n
    v = [1];
    for d=1:(n-1)
        v = [v(1)*k v];
    end
    x = [x;v];
end
A = (x^-1 * y.')';
Ax = 1:0.1:n;
Ay = polyval(A,Ax);
plot(Ax,Ay);
grid on;
%%
X = [-1 0 1 2 3];
y = [6 5 0 3 2];
x = [];
for i=1:5
    v = [1];
    for j=1:4
        v = [v(1).*X(i) v];
    end
    x = [x;v];
end
A = (x^-1 * y.')';
Ax = -2:0.1:4;
Ay = polyval(A,Ax);
plot(Ax,Ay);
grid on;
%%
p = [1 -6 15 -14];
x = roots(p);
v = [];
for i=1:length(x)
    if imag(x(i))==0
        v = [v x(i)];
    end
end
a = min(v);
b = max(v);
if a==b
    a = a - 5;
    b = b + 5;
end
t = a:0.05:b;
plot(t,polyval(p,t));
grid on;
%%
p = [1 -2 -8 13 -24];
x = roots(p)
v = [];
for i=1:length(x)
    if imag(x(i))==0
        v = [v x(i)];
    end
end
a = min(v);
b = max(v);
if a==b
    a = a - 5;
    b = b + 5;
end
t = a:0.01:b;
plot(t,polyval(p,t));
grid on;
%%
n = 4;
A = rand(4);
p = charpoly(A);
polyvalm(p,A);
%%
syms x
f = x^4+2*x^3-x^2-4*x-2;
g = x^4+x^3-x^2-2*x-2;
[G,A,B] = gcd(f,g);
A * f + B * g == G
%%
syms x
f = x^4-x^3-4*x^2+4*x+1;
g = x^2-x-1;
[G,A,B] = gcd(f,g);
A * f + B * g == G
%%
k = [];
for i=1:100
    k = [k 1];
end
p = poly(k);
k = roots(p);
subplot(2,1,1);
hold on;
grid on;
for i=1:100
    plot(real(k(i)),imag(k(i)),'rx');
end
subplot(2,1,2);
hold on
for i=1:100
    if imag(k(i))==0
        plot(real(k(i)),imag(k(i)),'rx');
    end
end
x = -2.7:0.01:4.5;
plot(x,polyval(p,x));
grid on;