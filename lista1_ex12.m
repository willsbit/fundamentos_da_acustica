mic_sensitivity = 48.5E-3; % V/Pa
conversion_factor = 1 / mic_sensitivity; % Pa/V

[y, Fs] = audioread("transformador_sinal.wav");
% Fs is the sample rate, Fs = 44100 Hz

y = y * conversion_factor; % convert voltage values to Pa

% well now use rms = sqrt(sum((p_i)^2) / #samples)
root_mean_square = sqrt(sum(y.^2) / length(y));

p_0 = 2E-5; % reference pressure
spl = 10 * log10((root_mean_square^2/p_0^2));

disp(root_mean_square)
disp(spl)

% result:
%   RMS: 0.8148 Pa
%   SPL: 92.2 dB
