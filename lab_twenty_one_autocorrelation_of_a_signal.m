clc;
clear all;
close all;

% Autocorrelation of a signal
% Requires Signal Processing Toolbox (xcorr)

x = input('Enter the signal x[n]: ');

% Autocorrelation using xcorr
[r, lags] = xcorr(x, 'biased');

% Autocorrelation computed manually for comparison
N = length(x);
r_manual = zeros(1, 2*N-1);
for k = -(N-1):(N-1)
    s = 0;
    for n = 1:N
        if n+k >= 1 && n+k <= N
            s = s + x(n)*x(n+k);
        end
    end
    r_manual(k+N) = s/N;
end

disp('Autocorrelation (xcorr, biased):');
disp(r);
disp('Autocorrelation (manual):');
disp(r_manual);

figure;
subplot(2,1,1);
plot(x);
title('Signal x[n]'); xlabel('n'); ylabel('x[n]'); grid on;

subplot(2,1,2);
stem(lags, r, 'filled');
title('Autocorrelation r_{xx}[l]');
xlabel('Lag l'); ylabel('r_{xx}[l]'); grid on;
