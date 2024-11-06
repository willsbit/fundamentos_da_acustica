clear; close all; clc

rho0 = 1.2; % kg/m³
c0 = 343; % m/s
p0 = 1; %Pa
L = 0.5; %m
f = 10:0.5:500;
NPS = zeros(length(f), 1);
x = 0.5;

% sistema de equações
for n=1:length(f)
    k = 2*pi*f(n) / c0; % rad/m
    A = [exp(-1i*k*L), -exp(1i*k*L); 
         1,             1];

    B = [0;
        p0];

    P = A\B;

    px = P(1)*exp(-1i*k*x) + P(2)*exp(1i*k*x); % amplitude de pressão (Pa)
    prms = abs(px) / sqrt(2);
    NPS(n) = 20*log10(prms / 2e-5); % dB
end

figure
plot(f, NPS, 'k');
xlabel('Frequência [Hz]');
ylabel('Nível de pressão sonora [dB]');

% clear u v x y k L Pa Pb P rho c0 z
% syms k L x y P
% eqns = [x*exp(-1i*k*L) - y*exp(1i*k*L) == 0, x + y == P];
% S = solve(eqns);
% sol = [S.x;S.y];
% 
