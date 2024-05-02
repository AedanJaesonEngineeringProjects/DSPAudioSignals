 % Coefficients for H1
b1 = [0.9504, -1.8484, 0.9504];
a1 = [1, -1.8484, 0.9009];

% Coefficients for H2
b2 = [0.0945, -0.129, 0.0945];
a2 = [1, -1.6244, 0.6832];

% Coefficients for H3
b3 = [0.2346, -0.3187, 0.2346];
a3 = [1, 0.4419, 0.2231];

% Plot the magnitude responses
fvtool(b1, a1, 'MagnitudeDisplay', 'Magnitude (dB)');
title('H1 Filter Magnitude Response');

fvtool(b2, a2, 'MagnitudeDisplay', 'Magnitude (dB)');
title('H2 Filter Magnitude Response');

fvtool(b3, a3, 'MagnitudeDisplay', 'Magnitude (dB)');
title('H3 Filter Magnitude Response');
