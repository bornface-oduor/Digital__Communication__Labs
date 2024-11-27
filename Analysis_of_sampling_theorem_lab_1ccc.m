clear all;
close all;
clc;
tot = 1;                       %specifies the total time duration of the signal as 1 second.
td = 0.002;                    %defines the time step (sampling interval)
t = 0:td:tot;                  %creates a time vector t that ranges from 0 to 1 second with increments of 0.002 seconds
x = sin(2*pi*t) - sin(6*pi*t); %generates the signal as a combination of two sinusoidal components:
figure(1);
plot(t, x, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Input Message Signal');
grid on;


L = length(x);                    %calculates the length of the signal x
Lfft = 2^nextpow2(L);             %computes the next power of 2 greater than or equal to L
fmax = 1/(2*td);                  %calculates the maximum frequency
Faxis = linspace(-fmax, fmax, Lfft);
Xfft = fftshift(fft(x, Lfft));    %performs the FFT on the signal x with a zero-padded length of Lfft
figure(2);
plot(Faxis, abs(Xfft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of Input Message Signal');
grid on;


ts = 0.02;   %defines the sampling period
n = 0:ts:tot;
x_sampled = sin(2*pi*n) - sin(6*pi*n);    %is the sampled signal, which consists of two sinusoidal components
figure(3);
stem(n, x_sampled, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sampled Signal');
grid on;


x_sampled_upsampled = upsample(x_sampled, round(ts/td));      %upsamples the previously sampled signal
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