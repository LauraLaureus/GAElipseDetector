function [D]=duplicateBWImage(img)

    D = zeros(size(img));
    for i=size(img,1)
        for j=size(img,2)
            D(i,j)= img(i,j);
        end
    end
end