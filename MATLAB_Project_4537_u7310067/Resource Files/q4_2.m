[speech_signal, fs] = audioread('DSP_Speech.wav');
% Load HRIR_1 and perform convolution
hrir1_data = load('HRIR_1.mat');
x1 = hrir1_data.HRIR_1;
y1 = conv(speech_signal, x1);
% Load HRIR_2 and perform convolution
hrir2_data = load('HRIR_2.mat');
x2 = hrir2_data.HRIR_2;
y2 = conv(speech_signal, x2);

% Combine y1 and y2
combined_result = [y1(:), y2(:)];  % Make sure y1 and y2 are column vectors

% Save combined_result as a .wav file
audiowrite('Binaural_Surname.wav', combined_result, fs);

audiowrite('Binaural_Surname.wav', combined_result, fs);
figure;
subplot(2,1,1);
plot(x1);  % Assuming HRIR_1 was loaded earlier
title('Time-domain plot of HRIR_1.mat');

subplot(2,1,2);
plot(x2);  % HRIR_2
title('Time-domain plot of HRIR_2.mat');
