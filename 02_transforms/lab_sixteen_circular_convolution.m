clc;
clear all;
close all;

% Circular convolution of two sequences of equal length
x = input('Enter the first sequence x[n]: ');
h = input('Enter the second sequence h[n]: ');

N = max(length(x), length(h));
% Pad with zeros to length N
x = [x, zeros(1, N-length(x))];
h = [h, zeros(1, N-length(h))];

% Circular convolution via matrix method
y = zeros(1, N);
for n = 0:N-1
    for m = 0:N-1
        y(n+1) = y(n+1) + x(m+1) * h(mod(n-m, N)+1);
    end
end

disp('Circular convolution result y[n]:');
disp(y);

figure;
subplot(3,1,1);
stem(0:N-1, x, 'filled');
title('x[n]'); xlabel('n'); ylabel('x[n]'); grid on;

subplot(3,1,2);
stem(0:N-1, h, 'filled');
title('h[n]'); xlabel('n'); ylabel('h[n]'); grid on;

subplot(3,1,3);
stem(0:N-1, y, 'filled');
title('Circular Convolution y[n]'); xlabel('n'); ylabel('y[n]'); grid on;
