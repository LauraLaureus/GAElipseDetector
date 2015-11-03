function [breakpoints]=cross_points(gen_size)
%%Returns a vector with two numbers between 0 and the param "gen_size"
%%sortes from minor to major.
    breakpoints = randi(gen_size,1,2);
end