function drawcodevec(centres, data, ncentres)
    id = eye(ncentres);                     %Getting Diagonal Matrix
    d2 = dist2(data, centres);              %Calculates distance between two of points.
    [minvals, index] = min(d2');            %Getting the index of lowest distance
    index = index';                         
    
    f2 = figure(ncentres * 10);
    hold on;
    
    for i = 1:ncentres
        plot(data(index==i,1), data(index==i,2), '.', 'color',de2bi(i,3));   %seting colours
        Title{i} = strcat('Cluster', 32 , int2str(i)) ;          %setting title
    end
    plot(centres(:, 1), centres(:,2), 'k.', 'LineWidth', 2, 'MarkerSize', 15);
    legend(Title, 'Location', 'southeast');
    saveas(f2,strcat('f',int2str(ncentres * 10),'.png'));
end