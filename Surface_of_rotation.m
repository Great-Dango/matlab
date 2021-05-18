% вращение вокруг оси z
% xt,yt,zt параметрически заданная образующая
% пример вызова функции
% Surface_of_rotation(@(t)1./t,@(t)t.^3,@(t)t)
function [] = Surface_of_rotation(xt,yt,zt)
    t = -5*pi:0.2:5*pi;
    v = 0:0.1:2.5*pi;
    plot3(xt(t),yt(t),zt(t),'r'); % образующая
    hold on;
    grid on;
    [T,V] = meshgrid(t,v);
    X = xt(T).*cos(V);
    Y = yt(T).*sin(V);
    Z = zt(T);
    surf(X,Y,Z);
end

