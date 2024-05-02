function [DFT_mag_half] = dft1(signal, fs)
    N = length(signal);  % Number of samples
    Xk = zeros(1, N);  % Initialize the DFT array

    % Compute DFT
    for k = 0:N-1
        sum_term = 0;
        for n = 0:N-1
            sum_term = sum_term + signal(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
        Xk(k+1) = sum_term;
    end

    % Compute magnitude of DFT
    DFT_mag = abs(Xk);

    % Frequency resolution
    delta_f = fs / N;

    % Frequency vector
    freq_vector = 0:delta_f:fs/2;
    N1 = length(freq_vector);

    % Half of the magnitude
    DFT_mag_half = DFT_mag(1:N1);

    % Plotting
    figure;
    plot(freq_vector, DFT_mag_half);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude of DFT');
    grid on;
end

