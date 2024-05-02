function [magnitude_half] = dft1(signal, fs)
    % Determine the number of samples
    N = length(signal);

    % Initialize DFT output array
    Xk = zeros(1, N);

    % Compute DFT using a for loop
    for k = 0:N-1
        for n = 0:N-1
            Xk(k+1) = Xk(k+1) + signal(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
    end

    % Compute the magnitude of the DFT
    magnitude = abs(Xk);

    % Frequency resolution
    delta_f = fs / N;

    % Create a frequency vector
    freq_vector = 0:delta_f:fs/2;

    % Length of this frequency vector
    N1 = length(freq_vector);

    % Create a new vector consisting of the first N1 values of the DFT magnitude
    magnitude_half = magnitude(1:N1);

    % Plot the magnitude of the DFT
    figure;
    plot(freq_vector, magnitude_half);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude of DFT');
    grid on;
    
end
