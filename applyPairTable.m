function [Next_Generation]=applyPairTable(Picked,pair_table)
%%Generates a matrix in the same dimensions of the param Pop applying
%%crossing as the param "pair table" describes. Pair table should be MX2
%%matrix.

    Next_Generation = [];
    %num_gens = size(Picked,2);
    for pair=1:size(pair_table,1)
        %obtener los puntos de cruce.
        breakpoints = sort(cross_points(size(Picked,2)));
        %obtener los padres
        father = Picked(pair_table(pair,1),:);
        mother = Picked (pair_table(pair,2),:);
        %crear a los dos hijos
        first_sibling = [father(1:breakpoints(1))  mother(breakpoints(1)+1:breakpoints(2)) father(breakpoints(2)+1:size(father,2))];
        second_sibling = [mother(1:breakpoints(1))  father(breakpoints(1)+1:breakpoints(2)) mother(breakpoints(2)+1:size(father,2))];
        %añadir a los dos hijos a la tabla
        Next_Generation = [Next_Generation; first_sibling; second_sibling];
    end
  
end