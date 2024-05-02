% Read  original voice recording
[original_voice, fs] = audioread('DSP_Aedan.wav');

% Coefficients for H4
b4 = [1, -1.93, 1];
a4 = [1, -1.91, 0.98];

% Filter the signal
filtered_voice_H4 = filter(b4, a4, original_voice);

% Save and listen to the filtered signal
audiowrite('Filtered_Voice_H4.wav', filtered_voice_H4, fs);
fvtool(b4, a4, filtered_voice_H4, 'MagnitudeDisplay', 'Magnitude (dB)');

fvtool(b4, a4, 'polezero');
title('Pole-Zero Plot of H4');

