clc;
clear all;
close all;

% Demonstration of sampling and aliasing
f0 = 5; % Signal frequency in Hz
t = 0:0.001:1; % High-resolution time for the "continuous" signal
x_cont = sin(2*pi*f0*t);

fs1 = 100; % Adequate sampling rate (fs > 2*f0)
fs2 = 8;   % Inadequate sampling rate (fs < 2*f0) -> aliasing

t1 = 0:1/fs1:1;
x1 = sin(2*pi*f0*t1);

t2 = 0:1/fs2:1;
x2 = sin(2*pi*f0*t2);

figure;
subplot(3,1,1);
plot(t, x_cont, 'b');
title('Continuous Signal x(t) = sin(2\pi f_0 t), f_0 = 5 Hz');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(t, x_cont, 'b', t1, x1, 'ro-');
title(sprintf('Sampled at f_s = %d Hz (No Aliasing)', fs1));
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(t, x_cont, 'b', t2, x2, 'ro-');
title(sprintf('Sampled at f_s = %d Hz (Aliasing)', fs2));
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
