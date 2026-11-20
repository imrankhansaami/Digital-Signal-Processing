clc;
close all;
clear all;

indices = -10:10;
step_function = [zeros(1,10), ones(1,11)];

stem(indices, step_function);
axis([-12, 12, -1, 2]);
xlabel('n (samples)')
ylabel('u[n]');
title('Unit Step');