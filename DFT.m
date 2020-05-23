clear;
clc;
fmax = 512;
fs = 1026;  % Smallest
Ts = 1/fs;  % Sampling Period, Ts = 1/1024
%% Time
t = linspace(0,0.5,512);
x_t = 10*sin(2*pi*64.*t) + sin(2*pi*250.*t) + 20*sin(2*pi*256.*t) + 3*sin(2*pi*260.*t) + 10*sin(2*pi*512.*t);
T = 0.5;   % Period
figure
plot(t,x_t);
xlabel('Time/s');
ylabel('x(t)');
grid on;
title('x(t) in Time Domain');
axis([0 T -40 40]);
%% Sampling
n_max = T/Ts;   % Main interval
n = 0:n_max-1;
x_n = 10*sin(2*pi*64.*n*Ts) + sin(2*pi*250.*n*Ts) + 20*sin(2*pi*256.*n*Ts) + 3*sin(2*pi*260.*n*Ts) + 10*sin(2*pi*512.*n*Ts);
figure
stem(n,x_n,'filled');
xlabel('Time/n');
ylabel('x[n]');
grid on;
title('x[n] in Time Domain');
axis([0 n_max -40 40]);
%% Windowing
w = boxcar(n_max);
% w = hann(n_max);
% w = bartlett(n_max);
% w = hamming(n_max);
% w = blackman(n_max);
w = transpose(w);
x_w = x_n.*w;
figure
stem(n,x_w,'filled');
xlabel('Time/n');
ylabel('x[n]');
grid on;
title('x[n] in Time Domain after Rectangular Window');
axis([0 n_max -40 40]);
%% Frequency
X = fft(x_w);
X_abs = abs(X);
figure
stem(2*n,X_abs/1026*4,'filled');
xlabel('Frequency/k');
ylabel('X[k]');
grid on;
title('X[k] in Frequency Domain');
axis([0 512 0 25]);