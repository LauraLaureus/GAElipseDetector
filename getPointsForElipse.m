function [elipse] = getPointsForElipse(Pop)
        a = binario_a_entero (Pop(1,1:5)) + 5;
        b = binario_a_entero (Pop(1,6:10)) + 5;
        x0 = binario_a_entero (Pop(1,11:16)) + 19;
        y0 = binario_a_entero (Pop(1,17:22)) + 19;
        theta = binario_a_entero (Pop(1,23:29));
        theta = theta*89/127; %Escalamos de 0 a 127 a 0 a 179
        theta = theta * pi/180;
        
        elipse = [];
        for alpha=0.2:0.2:2*pi
            x = round((a*cos(alpha)+x0)*cos(theta)-(b*sin(alpha)+y0)*sin(theta));
            y = round((a*cos(alpha)+x0)*sin(theta)+(b*sin(alpha)+y0)*cos(theta));
            elipse = [elipse; x y];
        end
end