function [x] = gauss(A, B, n)
    r = size(A,1);
    c = size(A,2);
    AB=[A, B];
    if (rank(A) == rank(AB))
        if (rank(A) == c) 
            k = 1;
            while k <= r
                if (AB(k, k) ~= 0)
                    AB(k, :) = mod(AB(k, :) * get_inverse(AB(k, k), n), n);
                    
                    for i = k+1:r
                        AB(i, :) = mod(AB(i, :) + get_additive_inverse(AB(i, k), n) * AB(k, :), n);
                    end
                    k = k + 1;
                else
                    temp = AB(k, :);
                    AB(k, :) = [];
                    AB = [AB; temp];
                end
            end
            
            for i=r-1:-1:1
                for k=i+1:c
                    AB(i, :) = mod(AB(i, :) + get_additive_inverse(AB(i, k), n) * AB(k, :), n);
                end
            end
            x = AB(:, end);
        else
            error('More than one solution!');
        end
    else
        error('No solutions!');
    end
end



function [x_inv] = get_additive_inverse(x, k)
    x_inv = 0;
    for y = 0:(k - 1)
        if (mod(y + x, k) == 0)
            x_inv = y;
            break
        end
    end
end



function [x_inv] = get_inverse(x, k)
    x_inv = 1;
    for y = 1:(k - 1)
        if (mod(y * x, k) == 1)
            x_inv = y;
            break
        end
    end
end