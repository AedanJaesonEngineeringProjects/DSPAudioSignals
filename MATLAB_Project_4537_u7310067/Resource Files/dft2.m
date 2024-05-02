function [DFT_mag_half_scaled] = dft2(signal, fs, plotData)

    % Determine the number of samples of the signal (N)
    N = length(signal);

    % Compute the DFT of the signal using the MATLAB in-built fft function
    Xk = fft(signal);

    % Apply scaling factor to restore the amplitude of the original signal in the time domain
    Xk_scaled = 2 * Xk / N;

    % Compute the magnitude of the scaled DFT of the signal
    DFT_mag_scaled = abs(Xk_scaled);

    % Determine the frequency resolution of the plot, delta_f = fs / N
    delta_f = fs / N;

    % Create a frequency vector from 0 Hz to fs / 2 Hz, using an increment of delta_f Hz
    freq_vector = 0:delta_f:fs/2;

    % Determine the length of this frequency vector (call it N1)
    N1 = length(freq_vector);

    % Create a new vector that consists of the first N1 values of the scaled DFT magnitude
    DFT_mag_half_scaled = DFT_mag_scaled(1:N1);

    % Plot the frequency vector against the first N1 values of the scaled DFT magnitude
  
if nargin < 3  % Check if plotData was provided
    plotData = true;  % Default value
end

if plotData
    figure;
    plot(freq_vector, DFT_mag_half_scaled);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude of Scaled DFT using fft()');
    grid on;
end

    end

