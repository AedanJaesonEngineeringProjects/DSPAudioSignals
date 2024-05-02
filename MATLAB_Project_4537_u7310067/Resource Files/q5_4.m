 % Read the audio file
[my_audio, fs] = audioread('DSP_Aedan.wav');

% Define parameters for the spectrogram
window = hamming(512);  % choose different window functions and sizes
noverlap = 256;         % Overlap length
nfft = 1024;            % DFT size

% Generate the spectrogram
[S, F, T] = spectrogram(my_audio, window, noverlap, nfft, fs, 'yaxis');

% Plot the spectrogram
figure;
imagesc(T, F, 10*log10(abs(S)));  % Convert to dB scale for better visibility
axis xy;
colormap('jet');
colorbar;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram of DSP_Aedan.wav');

% Annotate where  voice starts and stops
% Replace 'start_time' and 'end_time' with actual values
start_time = 1.0;  % Example value, in seconds
end_time = 9.0;    % Example value, in seconds
text(start_time, fs/2, 'Voice Starts', 'BackgroundColor', 'white');
text(end_time, fs/2, 'Voice Ends', 'BackgroundColor', 'white');

% Save the plot
saveas(gcf, 'Spectrogram_DSP_Aedan.png');
