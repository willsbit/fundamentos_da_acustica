from numpy import pi, exp

rho = 1.2
c0 = 343
f = 500
a = 0.1
u0 = 0.05

w = 2*pi*f
k = w / c0
r = 1

p = (-rho*1j*w*u0*(a**2)*exp(1j*k*(r-a))) / (r*(1 - 1j*k*a))
z = (-rho*1j*w*a) / (1 - 1j*k*a)

