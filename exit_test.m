function exit = exit_test(mean_fitnesses)

    num_fitness = size(mean_fitnesses,2);
    if  num_fitness < 3
        exit = 0;
        return
    end
    if ((mean_fitnesses(num_fitness)+mean_fitnesses(num_fitness-1)+mean_fitnesses(num_fitness-2))/3) < 0.1
        exit = 1;
        return
    else 
        exit = 0;
    end 
end