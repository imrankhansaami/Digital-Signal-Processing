clc;
clear all;
close all;

% Quantization of a signal and SNR calculation
n = 0:199;
x = sin(0.1*pi*n) + 0.3*sin(0.3*pi*n);

bits = input('Enter the number of quantization bits (e.g., 4): ');

% Normalize to [-1, 1]
x_norm = x / max(abs(x));

% Quantize
L = 2^bits;
step = 2/L;
xq = round(x_norm/step)*step;

% Clipping
xq(xq > 1-step/2) = 1-step/2;
xq(xq < -1) = -1;

% Signal power and noise power
signal_power = mean(x_norm.^2);
noise = x_norm - xq;
noise_power = mean(noise.^2) + eps;
snr = 10*log10(signal_power/noise_power);

fprintf('Number of levels: %d\n', L);
fprintf('Quantization step size: %.4f\n', step);
fprintf('SNR: %.2f dB\n', snr);
fprintf('Theoretical SNR ~ 6.02*bits + 1.76 = %.2f dB\n', 6.02*bits + 1.76);

figure;
subplot(2,1,1);
stem(n, x_norm, 'filled'); hold on;
stem(n, xq, 'r', 'filled');
title('Original and Quantized Signal');
legend('Original', 'Quantized');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(2,1,2);
stem(n, noise, 'filled');
title('Quantization Error');
xlabel('n'); ylabel('Error'); grid on;
