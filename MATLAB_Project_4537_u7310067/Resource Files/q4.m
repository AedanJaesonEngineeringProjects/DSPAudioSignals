% Load the data
[x1, fs] = audioread('DSP_Speech.wav');
load('HRIR_1.mat');
x2 = HRIR_1;
% Zero-Padding
N = length(x1) + length(x2) - 1;
x1_padded = [x1; zeros(N-length(x1), 1)];
x2_padded = [x2; zeros(N-length(x2), 1)];

% DFT
X1 = fft(x1_padded);
X2 = fft(x2_padded);

% Pointwise Multiplication
Y = X1 .* X2;

% Inverse DFT
y = ifft(Y);

% MATLAB conv function for comparison
y_matlab = conv(x1, x2, 'same');

% Plotting
figure;
subplot(2,1,1);
plot(y);
title('Using DFT');
subplot(2,1,2);
plot(y_matlab);
title('Using MATLAB conv');

