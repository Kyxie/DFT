%% Sampling
fmax = 512;
ws = 2*2*pi*fmax;
Ts = 2*pi/ws;  % Ts = 1/1024
n = 0:255;
% 1/8 125/256 1/2 65/128 1
x_n = 10*sin(2*pi*64*n*Ts) + sin(2*pi*250*n*Ts) + 20*sin(2*pi*256*n*Ts) + 3*sin(2*pi*260*n*Ts) + 10*sin(2*pi*512*n*Ts);
W = ones(1,256);
x_w = x_n.*W;
figure
stem(n,x_w,'filled');
axis([0 255 -45 45]);