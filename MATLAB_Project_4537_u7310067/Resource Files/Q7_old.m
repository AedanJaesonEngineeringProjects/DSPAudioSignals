% Read the original music signal
[music_signal, fs] = audioread('Modulated_Music.wav');
music_signal = music_signal(:, 1);  % Use only the first channel

% Demodulate the signal
f_sine = 9000;  % Frequency of the sine wave is 9 kHz
t = 0:1/fs:(length(music_signal)-1)/fs;  % Time vector
sine_wave = sin(2 * pi * f_sine * t.');
demodulated_signal = music_signal .* sine_wave;

% Compute DFT of demodulated signal using dft2
[Y_demodulated, f_demodulated] = dft2(demodulated_signal, fs);

% Compute frequency response of the filter
[H, W] = freqz(b, 1, 4096, fs);

% Plot frequency response of the filter
figure;
plot(W, 20*log10(abs(H)));
hold on;
h_fvtool = fvtool(h, 1, 'Fs', fs, 'MagnitudeDisplay', 'Magnitude (dB)');

% Overlay the magnitude spectrum of the demodulated signal
plot(f_demodulated, 20*log10(abs(Y_demodulated)));

title('Magnitude response of the filter and the demodulated signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Filter Response', 'Demodulated Signal Spectrum');
grid on;
hold off;

% dft2 function embedded within this script
function [dft_sig, frequency_vector] = dft2(signal, sample_frequency)
    N = length(signal);
    dft_sig = fft(signal);
    dft_sig = (2/N) * dft_sig;
    delta_f = sample_frequency / N;
    frequency_vector = 0:delta_f:sample_frequency/2;
    N1 = length(frequency_vector);
    dft_sig = dft_sig(1:N1);
end

