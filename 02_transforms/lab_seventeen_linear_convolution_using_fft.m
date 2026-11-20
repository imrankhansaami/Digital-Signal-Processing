clc;
clear all;
close all;

% Linear convolution using the FFT
x = input('Enter the first signal x[n]: ');
h = input('Enter the second signal h[n]: ');

L = length(x) + length(h) - 1;
Nfft = 2^nextpow2(L);

X = fft(x, Nfft);
H = fft(h, Nfft);
Y = X .* H;
y_fft = ifft(Y);
y_fft = real(y_fft(1:L));  % Remove numerical imaginary part

% Direct convolution for comparison
y_direct = conv(x, h);

disp('Linear convolution using FFT:');
disp(y_fft);
disp('Linear convolution using conv():');
disp(y_direct);

figure;
subplot(3,1,1);
stem(x, 'filled'); title('x[n]'); xlabel('n'); ylabel('x[n]'); grid on;
subplot(3,1,2);
stem(h, 'filled'); title('h[n]'); xlabel('n'); ylabel('h[n]'); grid on;
subplot(3,1,3);
stem(0:L-1, y_fft, 'filled'); title('Linear Convolution via FFT'); xlabel('n'); ylabel('y[n]'); grid on;
