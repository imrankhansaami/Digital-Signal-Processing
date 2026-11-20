clc;
clear all;
close all;

% Pole-zero plot and stability analysis of an LSI system
b = input('Enter numerator coefficients b (e.g., [1 0.5]): ');
a = input('Enter denominator coefficients a (e.g., [1 -0.8 0.15]): ');

% Poles and zeros
z = roots(b);
p = roots(a);

disp('Zeros:'); disp(z);
disp('Poles:'); disp(p);

% Stability check: all poles must lie inside the unit circle
if all(abs(p) < 1)
    disp('System is STABLE (all poles inside the unit circle).');
else
    disp('System is UNSTABLE (at least one pole on or outside the unit circle).');
end

% Pole-zero plot
figure;
zplane(b, a);
title('Pole-Zero Plot');
grid on;
