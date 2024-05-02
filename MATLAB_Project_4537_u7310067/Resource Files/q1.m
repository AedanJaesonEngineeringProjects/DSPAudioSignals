% Gather information about the audio file
info = audioinfo('DSP_Speech.wav');

% Answer to Q 1.1.1: Number of bits per sample
bit_depth = info.BitsPerSample;
disp(['Number of bits per sample: ', num2str(bit_depth)]);

% Answer to Q 1.1.2: Sampling rate
sampling_rate = info.TotalSamples / info.Duration;
disp(['Sampling rate: ', num2str(sampling_rate), ' Hz']);

% Answer to Q 1.1.3: Number of channels
num_channels = info.NumChannels;
disp(['Number of channels: ', num2str(num_channels)]);

% Answer to Q 1.1.4: Duration
duration = info.Duration;
disp(['Duration: ', num2str(duration), ' seconds']);

% Answer to Q 1.1.5: Total number of samples
total_samples = info.TotalSamples;
disp(['Total number of samples: ', num2str(total_samples)]);

% Read the audio clip and segment it from 4th second to 9th second
[startSample, stopSample] = audioread('DSP_Speech.wav', [4*sampling_rate+1, 9*sampling_rate]);
disp('Audio segment read successfully.');

%To play this chopped audio clip, you'd use audioplayer() to create an audio player object, and then play() to actually play it. 
% The two-line code for this question would be:
player = audioplayer(startSample, sampling_rate);
play(player);

[startSample, stopSample] = audioread('DSP_Speech.wav', [4*sampling_rate+1, 9*sampling_rate]);
% Command for Stopping the Audio Playback
stop(player);

