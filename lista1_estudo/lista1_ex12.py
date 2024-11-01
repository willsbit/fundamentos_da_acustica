from numpy import pi, sqrt

c0 = 343
Rv = 0.015
L = 0.001
d = 0.0035

L_fix = L + 0.75 * d 
V = (4/3) * pi * Rv**3
S = (pi * d**2) / 4

f = (c0) / (2*pi) * sqrt(S / (V*L_fix))