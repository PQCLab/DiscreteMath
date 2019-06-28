function [Q] = getQ(k)
    x = [0:(k-1)]';
    Q = ones(k, 1);
    for i = 1:k - 1
        Q = [Q, mod(Q(:, i) .* x, k)];
    end
end

