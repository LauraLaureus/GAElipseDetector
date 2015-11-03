function [pairing_table]= pairing(pop_size)
    perm = randperm(pop_size,pop_size);
    
    if mod(pop_size,2) ~= 0
        perm = [perm randi(pop_size)];
    end
    
    pairing_table = vec2mat(perm,2);
end