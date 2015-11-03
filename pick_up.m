function [Picked, elite] = pick_up(currentGeneration)
    %Recieves a ascending sorted matrix with fitness and 29 bits of
    %cromosoma value.
    
    num_individues = size(currentGeneration,1);
    %Picks two best ones for next-generation
    
    absolute_best = currentGeneration(num_individues,:);
    second_best = currentGeneration(num_individues-1,:);
    
    elite = [absolute_best;second_best];
    
       
    Picked = [];
    picked = 0;
    while (size(Picked,1) + size(elite,1)) < size(currentGeneration,1)
        Picked = [Picked; currentGeneration(size(currentGeneration,1)-picked-2,:)];
        picked = picked +1;
    end
end