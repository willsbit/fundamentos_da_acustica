from numpy import pi, sqrt, exp, log10

c0 = 343;
rho = 1.2;

r = 1;
f = 400;
a = 0.1;
u0 = 0.01;

Q = u0*4*pi*a**2;
w = 2*pi*f;
k = w/c0;

p = ((1j*w*rho*Q)/(4*pi*r*(1 + 1j*k*a)))*exp(1j*k*(-r+a));

prms = abs(p) / sqrt(2);

SPL = 20*log10(prms / 2e-5);
