clc;
close all;
clear all;

time_index = -10:10;
step_sequence = [zeros(1,10), ones(1,11)];
ramp_signal = time_index .* step_sequence;

stem(time_index, ramp_signal);
axis([-12, 12, -5, 5]);
xlabel('Sample Number');
ylabel('Signal Strength');
title('Unit Ramp Signal');