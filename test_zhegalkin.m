% Set logic level
k = 5;

% Defining function of two variables [f(00), f(01), ..., f(0 k-1), f(10), f(11), ...]
func = [4, 3, 1, 1, 0, 0, 1, 2, 3, 2, 2, 2, 1, 3, 2, 1, 4, 4, 0, 1, 1, 1, 1, 2, 3]';

% Get P matrix
P = getP(k);

% Zhegalkin polynomial coefficients
a = mod(kron(P, P) * func, k);

% Check
Q = getQ(k);
func_check = mod(kron(Q, Q) * a, k);
all(func == func_check)