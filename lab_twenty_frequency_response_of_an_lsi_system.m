clc;
clear all;
close all;

% Frequency response of an LSI system from its difference equation
% y[n] = b0*x[n] + b1*x[n-1] + ... - a1*y[n-1] - ...
% H(e^{jw}) = B(e^{jw}) / A(e^{jw})

b = input('Enter numerator coefficients b (e.g., [1 0.5]): ');
a = input('Enter denominator coefficients a (e.g., [1 -0.5]): ');

[H, w] = freqz(b, a, 512);

mag = abs(H);
phase = angle(H);

figure;
subplot(2,1,1);
plot(w/pi, mag);
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude'); grid on;

subplot(2,1,2);
plot(w/pi, phase);
title('Phase Response \angle H(e^{j\omega})');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (rad)'); grid on;
