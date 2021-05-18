% линейчатая поверхность по образующей и направляющей
% lx,ly,lz параметрически заданная образующая
% rx,ry,rz параметрически заданная направляющая
% пример вызова функции
% Ruled_surface(@(t)-t,@(t)t.^2,@(t)t.^2,@(t)t-5,@(t)-t+7,@(t)t)
function [] = Ruled_surface(rx,ry,rz,lx,ly,lz)
    u = -5*pi:0.2:5*pi;
    v = -5*pi:0.2:5*pi;
    rz(u)
    plot3(rx(u),ry(u),rz(u),'r','MarkerSize',12); % направляющая
    hold on;
    grid on;
    [U,V] = meshgrid(u,v);
    X = rx(U) + V.*(lx(U)-lx(0))./sqrt((lx(U)-lx(0)).^2 + (ly(U)-ly(0)).^2 + (lz(U)-lz(0)).^2);
    Y = ry(U) + V.*(ly(U)-ly(0))./sqrt((lx(U)-lx(0)).^2 + (ly(U)-ly(0)).^2 + (lz(U)-lz(0)).^2);
    Z = rz(U) + V.*(lz(U)-lz(0))./sqrt((lx(U)-lx(0)).^2 + (ly(U)-ly(0)).^2 + (lz(U)-lz(0)).^2);
    surf(X,Y,Z);
end
