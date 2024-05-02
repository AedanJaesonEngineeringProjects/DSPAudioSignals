% Read original voice recording
[original_voice, fs] = audioread('DSP_Aedan.wav');

% Coefficients for H1 (or whichever filter you chose)
b = [0.9504, -1.8484, 0.9504];  
a = [1, -1.8484, 0.9009];  

% Filter the signal
filtered_voice = filter(b, a, original_voice);

% Save and listen to the filtered signal
audiowrite('Filtered_Voice.wav', filtered_voice, fs);
fvtool(b, a, filtered_voice, 'MagnitudeDisplay', 'Magnitude (dB)');
title('Frequency Spectrum of Filtered Signal');
