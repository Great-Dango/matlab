% xt,yt,zt параметрически вектор - функция
% a,b промежуток изменения параметра
% c шаг отображения репера Френе
% пример вызова функции
% Rapper_Frenet(@(t)t.^2,@(t)t,@(t)t,-10,10,3)
function [] = Rapper_Frenet(xt,yt,zt,a,b,c)
    j = a:0.3:b;
    plot3(xt(j),yt(j),zt(j),'r');
    grid on;
    %axis equal;
    for i=a:c:b
        syms t;
        dx = subs(diff(xt(t),t,1),t,c);
        dy = subs(diff(yt(t),t,1),t,c);
        dz = subs(diff(zt(t),t,1),t,c);
        l = sqrt(dx^2+dy^2+dz^2);
        line([xt(i),xt(i)+dx/l],[yt(i),yt(i)+dy/l],[zt(i),zt(i)+dz/l]);
        dxx = subs(diff(xt(t),t,2),t,c);
        dyy = subs(diff(yt(t),t,2),t,c);
        dzz = subs(diff(zt(t),t,2),t,c);
        bx = dy * dzz - dz * dyy;
        by = -(dx * dzz - dz * dxx);
        bz = dx * dyy - dy * dxx;
        l = sqrt(bx^2+by^2+bz^2);
        line([xt(i),xt(i)+bx/l],[yt(i),yt(i)+by/l],[zt(i),zt(i)+bz/l]);
        nx = dy * bz - dz * by;
        ny = -(dx * bz - dz * bx);
        nz = dx * by - dy * bx;
        l = sqrt(nx^2+ny^2+nz^2);
        line([xt(i),xt(i)+nx/l],[yt(i),yt(i)+ny/l],[zt(i),zt(i)+nz/l]);
        %axis equal;
    end
end
