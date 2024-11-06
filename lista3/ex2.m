clear u v x y k L Pa Pb P rho c0 z
syms k L x y P rho c0 z
eqns = [x*exp(-1i*k*L) + y*exp(1i*k*L) == P, x*exp(-1i*k*L) - y*exp(1i*k*L) == (P*rho*c0)/z];
S = solve(eqns);
sol = [S.x;S.y];


