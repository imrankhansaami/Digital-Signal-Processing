clc;
close all;
clear all;
n1=input('Enter the required amount of shift'); % 3
n=input('Enter time indices: '); % -3:3
x=input('Enter the signal sequence: '); % [-3 -2 -1 0 3 2 1]
subplot(2,1,1);
stem(n,x);
xlabel('Time sample');
ylabel('Amplitude');
title('Original Signal');
grid on;
m=n+n1;   
subplot(2,1,2);
stem(m,x);
xlabel('Time sample');
ylabel('Amplitude');
title('delay signal');
grid on;