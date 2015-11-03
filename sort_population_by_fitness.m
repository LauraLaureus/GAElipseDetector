function [SortedPop]= sort_population_by_fitness(fitness, Pop)
    SortedPop = sortrows([fitness' Pop],1);
    SortedPop = SortedPop(:,2:end);
end