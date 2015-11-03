function [Pop] = mutate_generation(Pop,p_mutate)
    for i=1:size(Pop,1)
        if rand < p_mutate
            c = randi(size(Pop,2));
            Pop(i,c)= invertGen(Pop(i,c));
        end
    end
end