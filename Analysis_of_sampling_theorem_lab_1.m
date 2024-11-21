clear all;
close all;
clc;
tot = 1;
td = 0.002;
t = 0:td:tot;
x = sin(2*pi*t) - sin(6*pi*t);
figure(1);
plot(t, x, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Input Message Signal');
grid on;


L = length(x);
Lfft = 2^nextpow2(L);
fmax = 1/(2*td);
Faxis = linspace(-fmax, fmax, Lfft);
Xfft = fftshift(fft(x, Lfft));
figure(2);
plot(Faxis, abs(Xfft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of Input Message Signal');
grid on;


ts = 0.02;
n = 0:ts:tot;
x_sampled = sin(2*pi*n) - sin(6*pi*n);
figure(3);
stem(n, x_sampled, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sampled Signal');
grid on;


x_sampled_upsampled = upsample(x_sampled, round(ts/td));
Lffu = 2^nextpow2(length(x_sampled_upsampled));
fmaxu = 1/(2*td);
Faxisu = linspace(-fmaxu, fmaxu, Lffu);
Xfftu = fftshift(fft(x_sampled_upsampled, Lffu));
figure(4);
plot(Faxisu, abs(Xfftu));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of Sampled Signal');
grid on;