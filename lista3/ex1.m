rho0 = 1.2;          % kg/m³
c0 = 343 + 0.2i;     % m/s
p0 = 1;              % Pa
Lx = 0.05;           % m
d = 0.04;            % m
dR = 0.003;          % m
Rv = 0.013;          % m
LR = 0.001;          % m
x = 0.047;           % m
f = 1:1:5000;        % Hz
NPS_R = zeros(length(f), 1);
NPS_T = zeros(length(f), 1);


L_prime = LR + 0.75*dR; % m   -- correção do comprimento equivalente
SR = (pi*dR^2)/ 4;      % m^2 -- área do gargalo
S1 = (pi*d^2) / 4;      % m^2 -- área da seção transversal do tubo
V = (4/3)*pi*Rv^3;      % m^3 -- volume do ressonador

% sistema de equações
for n=1:length(f)
    w = 2*pi*f(n); % rad/s
    k = w / c0;    % rad/m

    zR = 0.12 + 1i* ((w*rho0*L_prime - (rho0*(c0^2)*SR) / (V*w)));

    A = [exp(1i*k*Lx), exp(-1i*k*Lx), 0,             0,             0; 
         0,            0,             exp(-1i*k*Lx), -exp(1i*k*Lx), 0;
         1,            1,             -1,            -1,            0;
         1,            1,              0,             0,           -1;
         1,           -1,             -1,             1,      -(rho0*c0*SR) / (zR * S1)
    ];

    B = [p0;
         0;
         0;
         0;
         0
    ];

    P = A\B;

    px = (P(3)*exp(-1i*k*x) + P(4)*exp(1i*k*x)); % amplitude de pressão (Pa)
    prms = abs(px) / sqrt(2);
    NPS_R(n) = 20*log10(prms / 2e-5); % dB

    zR = 1e6; % usado para calcular o nível de potência sonora sem o ressonador
    
    A = [exp(1i*k*Lx), exp(-1i*k*Lx), 0,             0,             0; 
         0,            0,             exp(-1i*k*Lx), -exp(1i*k*Lx), 0;
         1,            1,             -1,            -1,            0;
         1,            1,              0,             0,           -1;
         1,           -1,             -1,             1,      -(rho0*c0*SR) / (zR * S1)
    ];

    B = [p0;
         0;
         0;
         0;
         0
    ];

    P = A\B;

    px = (P(3)*exp(-1i*k*x) + P(4)*exp(1i*k*x)); % amplitude de pressão (Pa)
    prms = abs(px) / sqrt(2);
    NPS_T(n) = 20*log10(prms / 2e-5); % dB
end

% cálculo das frequências naturais do ressonador
fR = (c0 / 2*pi) * sqrt(SR / (L_prime * V)); % Hz

% primeira frequência de ressonância do tubo (aberto-fechado)
f0 = c0 / (4*2*Lx); % Hz

figure
ph1 = plot(f, NPS_R, 'b');
hold on
ph2 = plot(f, NPS_T, 'r');
hold off
legend([ph1(1),ph2(1)],'Com ressonador','Sem ressonador')
xlabel('Frequência [Hz]');
ylabel('Nível de pressão sonora [dB]');
