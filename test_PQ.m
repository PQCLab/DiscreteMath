% Set logic level
k = 17;

% Get P and Q matrices
P = getP(k);
Q = getQ(k);

% Identity matrix
mod(P * Q, k)