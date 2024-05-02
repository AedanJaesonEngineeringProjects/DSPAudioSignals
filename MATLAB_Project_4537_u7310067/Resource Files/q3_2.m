% Main function to run both 3.1 and 3.2 parts
function main_function()
    % --------------- Part 3.1 -----------------%
    fs = 4800;
    t = linspace(0, (7200-1)/fs, 7200);
    f1 = 150;
    f2 = 731;
    x_t = 1.2 * cos(2 * pi * f1 * t) + 2 * sin(2 * pi * f2 * t);
    plot(t, x_t);
    xlabel('Time (s)');
    ylabel('Amplitude');
 
    
    % --------------- Part 3.2 -----------------%
    % Calling the dft1 function
    dft1(x_t, fs);
     % --------------- Part 3.3 -----------------%
    dft2(x_t, fs);  % Calling the new function for 3.3
% Initialize variables for average running time
       
    % --------------- Part 3.6 -----------------%
    % Case-1: 32 samples of x(t)
    x_32 = x_t(1:32);
    dft2(x_32, fs);
    
    % Case-2: 32 samples of x(t) zero-padded to 512
    x_512_zero_padded = [x_32, zeros(1, 512-32)];
    dft2(x_512_zero_padded, fs);
    
    % Case-3: 512 samples of x(t)
    x_512 = x_t(1:512);
    dft2(x_512, fs);
    
    compare_running_times(x_t, fs);
end 
    


% Function definition for part 3.2
function [DFT_mag_half] = dft1(signal, fs, plotData)
    N = length(signal);
    Xk = zeros(1, N);
    for k = 0:N-1
        sum_term = 0;
        for n = 0:N-1
            sum_term = sum_term + signal(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
        Xk(k+1) = sum_term;
    end
    if nargin < 3  % Check if plotData was provided
        plotData = true;  % Default value
    end 
    DFT_mag = abs(Xk);
    delta_f = fs / N;
    freq_vector = 0:delta_f:fs/2;
    N1 = length(freq_vector);
    DFT_mag_half = DFT_mag(1:N1);
    if plotData
    figure;
    plot(freq_vector, DFT_mag_half);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude of DFT');
    grid on;

    
    end
end 

% New function definition for part 3.3
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
    %Q3.5
    saveas(gcf, 'DFT_Magnitude_Plot.png');

    end
end 
function compare_running_times(x_t, fs)
    % Initialize variables for average running time
    avg_time_dft1 = 0;
    avg_time_dft2 = 0;
    num_runs = 5;  % Number of runs to average over

    % Measure running time for dft1
    for i = 1:num_runs
        tic;
        dft1(x_t, fs, false);
        elapsed_time = toc;
        avg_time_dft1 = avg_time_dft1 + elapsed_time;
    end
    avg_time_dft1 = avg_time_dft1 / num_runs;

    % Measure running time for dft2
    for i = 1:num_runs
        tic;
        dft2(x_t, fs, false);
        elapsed_time = toc;
        avg_time_dft2 = avg_time_dft2 + elapsed_time;
    end
    avg_time_dft2 = avg_time_dft2 / num_runs;

    % Display average running time
    fprintf('The average running time of dft1: %.4f s\n', avg_time_dft1);
    fprintf('The average running time of dft2: %.4f s\n', avg_time_dft2);

    % Reasoning
    if avg_time_dft1 < avg_time_dft2
        fprintf('dft1 has the lower running time.\n');
    else
        fprintf('dft2 has the lower running time.\n');
    end
    fprintf('The function with the lower running time is likely more efficient in terms of computational resources.\n');
end

