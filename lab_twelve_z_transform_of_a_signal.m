clc;
clear all;
close all;

% Step 1: Take user input
x = input('Enter the discrete signal sequence : ');
n = input('Enter the corresponding indices : ');

% Step 2: Define symbolic variable
syms z

% Step 3: Compute Z-transform manually
X = 0;
for k = 1:length(x)
    X = X + x(k)*z^(-n(k));
end

% Step 4: Display result
disp('Z-transform of x(n) is:');
pretty(X);

% Optional: Display it in readable format
fprintf('\nX(z) = ');
disp(X);