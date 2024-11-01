from numpy import pi, sqrt, exp, cos, log10

c0 = 343 + 3.4j;
x = 0.07
L = 0.2
d = 0.04
f = 1000
P0 = 1
rho = 1.2

k = (2*pi*f) / c0

P = P0 * (exp(1j*k*x) + (exp(1j*k*(L-x) - exp(1j*k*(L+x))))/(2*cos(k*L)))
u = (1 / rho*c0) * (P0 * (exp(1j*k*x) - ((exp(1j*k*(L+x)) + exp(1j*k*(L-x))) / (2*cos(k*L))) ))

z = P/u
Prms = abs(P) / sqrt(2)
SPL = 20*log10(Prms / 2e-5)

fc = abs((1.84*c0) / (pi * d))