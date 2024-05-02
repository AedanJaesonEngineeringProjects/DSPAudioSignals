% Initialize audiorecorder object
recObj = audiorecorder(48000, 16, 1);

% Display message indicating recording is about to begin
disp('Starting recording. Make sure the background noise is playing.')

% Start recording
recordblocking(recObj, 12);

% Stop recording
disp('Recording stopped.');

% Save the audio data
audioData = getaudiodata(recObj);
audiowrite('DSP_Aedan.wav', audioData, 48000);

% Double-check the recording quality
player = audioplayer(audioData, 48000);
play(player);
