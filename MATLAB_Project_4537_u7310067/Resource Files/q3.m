fs = 4800;
t = linspace(0, (7200-1)/fs, 7200);
f1 = 150;
f2 = 731; 
x_t = 1.2*cos(2*pi*f1*t) + 2*sin(2*pi*f2*t);
plot(t, x_t);
xlabel('Time (s)');
ylabel('Amplitude');

