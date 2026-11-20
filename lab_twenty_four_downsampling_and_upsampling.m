clc;
clear all;
close all;

% Downsampling (decimation) and upsampling (interpolation)
n = 0:99;
x = sin(0.2*pi*n) + 0.5*sin(0.6*pi*n);

% Downsample by factor 2
x_down = x(1:2:end);
n_down = 0:length(x_down)-1;

% Upsample by factor 2 (insert zeros)
x_up = zeros(1, 2*length(x));
x_up(1:2:end) = x;
n_up = 0:length(x_up)-1;

figure;
subplot(3,1,1);
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('n'); ylabel('x[n]'); grid on;

subplot(3,1,2);
stem(n_down, x_down, 'filled');
title('Downsampled by Factor 2');
xlabel('n'); ylabel('x_{down}[n]'); grid on;

subplot(3,1,3);
stem(n_up, x_up, 'filled');
title('Upsampled by Factor 2 (Zero Insertion)');
xlabel('n'); ylabel('x_{up}[n]'); grid on;
