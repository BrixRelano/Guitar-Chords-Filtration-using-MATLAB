close all;
clear all;
clf;
pkg load signal;

f1 = 200;
f2 = 2800;
delta_f = f2-f1;
Fs = 48000;
dB  = 6;
N = dB*Fs/(22*delta_f);
[Y,fs] = audioread('E.wav');
t = linspace(0,length(Y)/fs, length(Y));
subplot(3,2,1);
plot(t,Y);
xlabel("Time"); ylabel("Amplitude");
title("Original Audio Signal in Time Domain");

f =  [f1 ]/(Fs/2);
hc = fir1(round(N)-1, f,'low');
sound = filter(hc,1,Y);

figure
plot((-0.5:1/4096:0.5-1/4096)*Fs,20*log10(abs(fftshift(fft(hc,4096)))));
axis([0 20000 -60 20]);
title('Filter Frequency Response');
grid on

audiowrite('EFILTER.wav', sound, Fs);