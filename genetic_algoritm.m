function[max_fitnesses,mean_fitnesses,elite] = genetic_algoritm(num_iter,p_mutation,n_size,image)

    %Init vars
    max_fitnesses = [];
    mean_fitnesses = [];
    Pop = Inicializa_poblacion(n_size);
    elite = [];
    
   for i=1:num_iter
   %while exit_test(mean_fitnesses) == 0
   %get the population fitness
        pop_fitness = fitness(Pop,image); 
        
        %get fitness interesting params
        max_fitnesses = [max_fitnesses max(pop_fitness)];
        mean_fitnesses = [mean_fitnesses mean(pop_fitness)];
        
        %get population sorted by fitness from minor to major.
        sorted_pop_fitness = sort_population_by_fitness(pop_fitness,Pop);
        
        %gets the best fitness as elite and half of population minus 2
        %members for being the parents of next generations
        [Selection,elite] = pick_up(sorted_pop_fitness);  
        
        %Randomize pairs and generate sucessors
        pair_table = pairing(size(Selection,1)); 
        Pop = applyPairTable(Selection,pair_table);
        Pop = mutate_generation(Pop,p_mutation);
        %Guaranties elite is the same in the next generation.
        Pop = [Pop; elite];
    end
    
end