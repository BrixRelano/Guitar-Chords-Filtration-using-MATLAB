clear all;
close all;
clc;

pkg load audio;
pkg load signal;

[x,fs] = audioread('G.wav');

N = length(x);
t = (0:N-1)/fs;
N/fs;

plot(t,x);
grid on 
xlabel('Time (s)');
ylabel('Amp1');
title('Signal in time domain');

maxValue = max(x);
minValue = min(x);
meanValue = mean(x);
stdValue = std(x);

specgram(x(:,2), 1024,fs);