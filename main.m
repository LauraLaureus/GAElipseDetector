function main(p_mutation,pop_size,num_iter)
    
    if mod(pop_size,2) ~= 0
        error('Es imprescindible que el número de individuos de la población sea par')
    end
   
    
    for img={'AUS_coins_ca_GS100x100.jpg' 'GC_ac_gr_100x100.jpg' 'pc_ca_grascale_100x100.jpg'};
        %reduce image to black and white
        image = imread(img{1});
        I = im2bw(image,0.5);
        %reduce image to edges
        BW = edge(I,'canny');
        
        [max_fits,mean_fits,elite] = genetic_algoritm(num_iter,p_mutation,pop_size,BW);
        
        max_fits(size(max_fits,2))
        
        %plots 
        figure;
        subplot(1,3,1);
        plot(linspace(1,size(max_fits,2),size(max_fits,2)),max_fits,'r-');
        title('Bondad máxima por generación');
        axis([1 size(max_fits,2) 0 1]);
        xlabel('Num generaciones') % x-axis label
        ylabel('Máxima bondad por generación') % y-axis label
        
        subplot(1,3,2);
        plot(linspace(1,size(mean_fits,2),size(mean_fits,2)),mean_fits,'r-');
        title('Bondad media por generación');
        axis([1 size(mean_fits,2) 0 1]);
        xlabel('Num generaciones') % x-axis label
        ylabel('Bondad media por generación') % y-axis label
        
        subplot(1,3,3);
        hold on;
        imshow(BW);
        elipse = getPointsForElipse(elite(2,:));
        plot (elipse(:,1),elipse(:,2),'r');
        hold off;
    end
end