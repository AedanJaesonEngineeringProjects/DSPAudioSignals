% Step 1: Load the voice recording
[voice_signal, fs] = audioread('DSP_Aedan.wav');

% Step 2: Use the dft2 function to analyze its frequency content
dft2(voice_signal, fs);

% Step 3: Save this plot for your report
saveas(gcf, 'Frequency_Content_DSP_Aedan.png');
