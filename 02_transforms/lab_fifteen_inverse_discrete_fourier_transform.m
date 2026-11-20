clc;
clear all;
close all;

% Inverse Discrete Fourier Transform (IDFT)
% x[n] = (1/N) * sum_{k=0}^{N-1} X[k] * exp(j*2*pi*k*n/N)

X = input('Enter the frequency-domain samples X[k] as a vector: ');
N = length(X);

% Manual IDFT computation
x = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        x(n+1) = x(n+1) + X(k+1) * exp(1j*2*pi*k*n/N);
    end
end
x = x / N;

% Compare with built-in ifft
x_ifft = ifft(X);

disp('IDFT computed manually:');
disp(x);
disp('IDFT using built-in ifft():');
disp(x_ifft);

figure;
subplot(2,1,1);
stem(0:N-1, real(x), 'filled');
title('Reconstructed Signal x[n] (real part)');
xlabel('n'); ylabel('x[n]');
grid on;

subplot(2,1,2);
stem(0:N-1, imag(x), 'filled');
title('Reconstructed Signal x[n] (imaginary part)');
xlabel('n'); ylabel('Imaginary');
grid on;
