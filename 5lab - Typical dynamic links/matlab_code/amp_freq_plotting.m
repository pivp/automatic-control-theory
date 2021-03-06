w_start = 0;
w_stop = 100;
w_step = 0.001;

w = linspace(w_start, w_stop, (w_stop - w_start) ./ w_step);

amp_fr = amplitude_frequency_conservative_link(w);

plot(w,amp_fr);
xlabel("w");
ylabel("A");
legend("A(w)");
grid on;
ylim([0 30]);

function a = amplitude_frequency_oscillating_link(w)
    a = ((0.36 .* (w .^ 4) - 16.56 .* (w .^ 2) + 225) .^ 0.5) ./ (0.0016 .* (w .^ 4) - 0.0736 .* (w .^ 2) + 1);
end

function a = amplitude_frequency_deceleration_differential_link(w)
    a = ((9 .* (w .^ 2) + 225) .^ 0.5) ./ (0.04 .* (w .^ 2) + 1);
end

function a = amplitude_frequency_conservative_link(w)
    a = abs(15 ./ (- 0.04 .* (w .^ 2) + 1));
end