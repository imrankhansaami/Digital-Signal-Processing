clc;
clear all;
close all;

% Chirp signal and spectrogram
fs = 1000; % Sampling frequency in Hz
T = 2;     % Duration in seconds
t = 0:1/fs:T-1/fs;

f_start = 20;
f_end = 200;
x = chirp(t, f_start, T, f_end);

figure;
subplot(2,1,1);
plot(t, x);
title('Chirp Signal (Linear Frequency Sweep)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(2,1,2);
spectrogram(x, 128, 120, 128, fs, 'yaxis');
title('Spectrogram');
