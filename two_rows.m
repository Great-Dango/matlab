function [g] = two_rows(v)
    d = size(v);
    if length(d) == 2 && d(1) == 2
        g = v;
    else
        fprintf('massive must be 2d and have two strings');
        g = zeros(d);
    end
end