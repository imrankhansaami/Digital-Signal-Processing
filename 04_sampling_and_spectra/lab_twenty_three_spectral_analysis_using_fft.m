clc;
clear all;
close all;

% Spectral analysis of a sum of sinusoids using the FFT
fs = 1000; % Sampling frequency in Hz
T = 1;     % Duration in seconds
t = 0:1/fs:T-1/fs;

f1 = 50; f2 = 120; f3 = 300;
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t) + 0.2*sin(2*pi*f3*t);

N = length(x);
X = fft(x);
X_mag = abs(X)/N;
f = (0:N-1)*(fs/N);

% Keep only positive frequencies
half = floor(N/2)+1;
f_pos = f(1:half);
X_pos = X_mag(1:half);

figure;
subplot(2,1,1);
plot(t, x);
title('Time-Domain Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(2,1,2);
stem(f_pos, X_pos, 'filled');
title('Single-Sided Amplitude Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X(f)|'); grid on;
xlim([0 400]);
