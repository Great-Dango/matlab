function M = blocks(n, m)
    X = zeros(n, m);
    Y = X + 1;
    M = [X Y; Y X];
end