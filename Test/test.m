clear all;
close all;
clc;

Fs = 8e3;
F1 = 500;
F2 = 2e3;

t = 0:1/Fs:0.2-1/Fs;

x1 = cos(2*pi*F1*t);
x2 = cos(2*pi*F2*t);
x3 = x1 + x2;

Nfft = length(x3);
f = (-Nfft/2:Nfft/2-1)*Fs/Nfft;

X1 = fft(x1,Nfft);
X2 = fft(x2,Nfft);
X3 = fft(x3,Nfft);

figure
plot(f,20*log10(abs(fftshift(X3))))
xlabel('Frequency in [Hz]')
ylabel('Amplitude in [dB]')
grid on
title('Unfiltered Signal')

