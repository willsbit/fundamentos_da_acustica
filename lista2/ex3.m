rho0 = 1.2;   % kg/m³
c0 = 343;     % m/s
ra = 0.05;    % m
rb = 1;       % m
u0 = 0.001;   % m/s
f = 10:1:500; % Hz
NPS = zeros(length(f), 1);

% sistema de equações
for n=1:length(f)
    w = 2*pi*f(n); % rad/s
    k = w / c0;    % rad/m
    A = [exp(-1i*k*ra) * (1 + 1i*k*ra), exp(1i*k*ra) * (1 - 1i*k*ra); 
         exp(-1i*k*rb) * (1 + 1i*k*rb), exp(1i*k*rb) * (1 - 1i*k*rb)];

    B = [u0*1i*w*rho0*(ra^2);
         0];

    P = A\B;

    p_rb = (1/rb) * (P(1)*exp(-1i*k*rb) + P(2)*exp(1i*k*rb)); % amplitude de pressão (Pa)
    prms = abs(p_rb) / sqrt(2);
    NPS(n) = 20*log10(prms / 2e-5); % dB
end

figure
plot(f, NPS, 'k');
xlabel('Frequência [Hz]');
ylabel('Nível de pressão sonora [dB]');

% syms p(r) Pa Pb k
% p(r) = (1/r) * (Pa*exp(-1i*k*r) + Pb*exp(1j*k*r));
% 
% Df = -diff(p,r);
% my_Df = (Pa*exp(-1i*k*r)*(1 + 1i*k*r) + Pb*exp(1i*k*r)*(1-1i*k*r)) / (r^2);
% 
% isAlways(Df == my_Df)
% 
% clear k L x y ra rb u0 w rho
% syms  k L x y ra rb u0 w rho
% eqns = [x*exp(-1i*k*ra)*(1 + 1i*k*ra) + y*exp(1i*k*ra)*(1 - 1i*k*ra) == u0*1i*w*rho*(ra^2),
%         x*exp(-1i*k*rb)*(1 + 1i*k*rb) + y*exp(1i*k*rb)*(1 - 1i*k*rb) == 0];
% S = solve(eqns);
% sol = [S.x;S.y];