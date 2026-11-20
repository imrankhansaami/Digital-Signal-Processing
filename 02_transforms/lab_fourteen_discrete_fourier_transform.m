clc;
clear all;
close all;

% Discrete Fourier Transform (DFT) of a sequence
% DFT: X[k] = sum_{n=0}^{N-1} x[n] * exp(-j*2*pi*k*n/N)

x = input('Enter the discrete signal x[n] as a vector (e.g., [1 2 3 4]): ');
N = length(x);

% Manual DFT computation
X = zeros(1, N);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j*2*pi*k*n/N);
    end
end

% Compare with built-in FFT
X_fft = fft(x);

disp('DFT computed manually:');
disp(X);
disp('DFT using built-in fft():');
disp(X_fft);

% Magnitude and phase
mag = abs(X);
phase = angle(X);

figure;
subplot(2,1,1);
stem(0:N-1, mag, 'filled');
title('Magnitude Spectrum |X[k]|');
xlabel('k'); ylabel('|X[k]|');
grid on;

subplot(2,1,2);
stem(0:N-1, phase, 'filled');
title('Phase Spectrum \angle X[k]');
xlabel('k'); ylabel('Phase (rad)');
grid on;
