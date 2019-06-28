function [P] = getP(k)
    if (~isprime(k))
        error('k is not prime!');
    end
    
    Q = getQ(k);
    e = zeros(k, 1);
    P = [];
    for i = 1:k
        vec = e;
        vec(i) = 1;
        x = gauss(Q, vec, k);
        P = [P, mod(x, k)];
    end
    
    
        
%     Q = getQ(k);
%     
%     P = inv(Q);
%     
%     [~, D] = rat(P);
%     
%     P = mod(P, k);
    
    
    
%     delta = round(mod(det(Q), k));
%     inv_delta = 0;
%     for x = 1:(k - 1)
%         if (mod(delta * x, k) == 1)
%             inv_delta = x;
%             break
%         end
%     end
%     
%     e = zeros(k, 1);
%     P = [];
%     for i = 1:k
%         vec = e;
%         vec(i) = 1;
%         deltas = zeros(1, k);
%         for j = 1:k
%             Qj = Q;
%             Qj(:, j) = vec; 
%             deltas(j) = det(Qj);
%         end
%         deltas = round(mod(deltas, k));
%         P = [P, mod(deltas' * delta, k)];
%     end
end

