function [laplace_time] = normalize_time(laplace_time)
original_vector = laplace_time;
min_value = min(original_vector);
max_value = max(original_vector);

% Check if the range is not zero to avoid division by zero
if (max_value - min_value) ~= 0
    normalized_vector = -1 + 2 * (original_vector - min_value) / (max_value - min_value);
else
    % Handle the case where the range is zero (all elements are the same)
    normalized_vector = zeros(size(original_vector));
end
    laplace_time = normalized_vector;
end