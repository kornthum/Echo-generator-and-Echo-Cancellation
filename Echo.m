%
[data,fs] = audioread('Input_voice.wav');
%%
%Part1: single Echo
W = [0:1:20]*pi/1000;
time = 0.1;
a = zeros(1,(time*(fs))-1);
num = [1 a 0.5];
den = [1];
h = freqz(num, den, W);
y = impz(num,den);
y_filter = filter(num, den, x(:,1));
figure;
subplot(3,1,1); stem(y); grid;
title('Impulse Respone');
xlabel('\Omega/\pi');
ylabel('Magnitude');
subplot(3,1,2); plot(w,abs(h)); grid;
title('Magnitude Response');
xlabel('\Omega/\pi');
ylabel('Magnitude');
subplot(3,1,3);
zplane(num,den);
title('Z-plane');
%%
%Part2: Multi Echo
a = 0.7;
N = 3;
time = 0.1;
R = time*fs;
num1 = [1,zeros(1,N*R-1), -a*N];
den1 = [1,zeros(1,R-1), -a];
h_inv = frez(num1, den1, W);
y_imp = impz(num1, den1);
y_ifilter = filter(num1, den1, x(:,1));
soundsc(y_ifilter, fs);
%%
timelag = 0.5; %chose the timelag from investigating an auto-corelation
delta = fs*timelag; 
k = 0.8;
num2 = [1,zeros(1,R-1), -a];
den2 = [1,zeros(1,N*R-1), -a*N];
w2 = [0:1:fs]*pi/(fs/2);
filter_cor = filter(num2, den2_ y_ifilter);
gain = 0.1;
output = filter_cor*gain