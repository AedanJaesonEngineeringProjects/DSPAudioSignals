function [y, StartTime] = FindSignalStart(x, fs)
    % Constants
    window = 256; % window size for STFT
    noverlap = 128; % overlap length for STFT
    nfft = 512; % number of DFT points for STFT

    % Compute the spectrogram
    [S, F, T] = spectrogram(x, window, noverlap, nfft, fs);

    % Select the frequency range corresponding to a male voice
    freq_range = (F >= 85) & (F <= 180); % Adjust if necessary

    % Calculate the energy of the signal in the selected frequency range for each time bin
    Energy = sum(abs(S(freq_range, :)).^2, 1);

    % Define a threshold to detect the start of speech
    threshold = 0.1 * max(Energy); % 10% of the maximum energy, adjust based on tests

    % Use the 'find' function to get the first time where the energy exceeds the threshold
    index = find(Energy > threshold, 1, 'first');

    % Calculate the start time in seconds
    StartTime = T(index);

    % Get the speech signal from that point onwards
    y = x(round(StartTime * fs):end);

    % Visualization
    figure;
    plot(T, Energy);
    hold on;
    line([StartTime, StartTime], ylim, 'Color', 'r', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Energy in Selected Frequency Range');
    title('Energy over Time with Detected Start of Speech');
    legend('Energy', 'Detected Start');
    hold off;
end

