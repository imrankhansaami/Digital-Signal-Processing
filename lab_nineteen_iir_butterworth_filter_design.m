clc;
clear all;
close all;

% IIR low-pass Butterworth filter design
% Requires Signal Processing Toolbox (butter, freqz, filter)

fc = input('Enter the cutoff frequency (normalized, 0 to 1): '); % e.g., 0.3
order = input('Enter the filter order (e.g., 4): ');

[b, a] = butter(order, fc, 'low');

% Frequency response
[H, w] = freqz(b, a, 512);

% Filter a test signal with low and high frequency components
n = 0:199;
x = sin(0.1*pi*n) + 0.5*sin(0.6*pi*n);
y = filter(b, a, x);

figure;
subplot(2,1,1);
plot(w/pi, 20*log10(abs(H)));
title('Butterworth Filter Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2,1,2);
plot(n, x, 'b', n, y, 'r');
title('Input and Filtered Signals');
legend('Input', 'Filtered');
xlabel('n'); ylabel('Amplitude'); grid on;
