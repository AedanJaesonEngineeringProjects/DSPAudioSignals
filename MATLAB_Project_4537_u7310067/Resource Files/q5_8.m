% Step 1: Load  original audio file
[x, fs] = audioread('DSP_Aedan.wav');

% Step 1a: Use FindSignalStart to find where speech begins
[y_start, StartTime] = FindSignalStart(x, fs);
fprintf('The speech starts at %f seconds.\n', StartTime); % Display start time

% Step 1b: Use FindSignalStop to find where your speech ends
[y_stop, EndTime] = FindSignalStop(y_start, fs);
fprintf('The speech ends at %f seconds.\n', EndTime); % Display end time

% Step 2: Save the trimmed audio
audiowrite('DSP_Chopped_Aedan.wav', y_stop, fs);

% Step 3: Play the trimmed audio to check
sound(y_stop, fs);

% Plotting the spectrogram
figure;
spectrogram(y_stop, 256, 128, 512, fs, 'yaxis');
title('Spectrogram of DSP_Chopped_Aedan.wav');
