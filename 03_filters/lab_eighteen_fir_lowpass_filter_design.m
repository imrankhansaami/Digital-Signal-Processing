clc;
clear all;
close all;

% FIR low-pass filter design using the window method
% Requires Signal Processing Toolbox (fir1, freqz)

fc = input('Enter the cutoff frequency (normalized, 0 to 1): '); % e.g., 0.3
N = input('Enter the filter order (e.g., 30): ');

% Hamming window
b = fir1(N, fc, 'low', hamming(N+1));

% Frequency response
[H, w] = freqz(b, 1, 512);

figure;
subplot(2,1,1);
stem(0:N, b, 'filled');
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2,1,2);
plot(w/pi, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;
