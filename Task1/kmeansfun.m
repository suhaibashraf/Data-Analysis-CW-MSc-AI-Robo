function [error] = kmeansfun(data, ncentres)
    
    ndata = size(data, 1);                 
    perm = randperm(ndata);
    perm = perm(1:ncentres);                
    centres = data(perm, :);                %getting position of center
    drawcodevec(centres,data,ncentres);     %ploting code vectors over data
    
    options = foptions;
    options(1)  = 1;                % Prints out error values.
    options(14) = 1;                % Number of iterations.
    n = 1;                  
    Title = cell(ncentres,1);   
    newCentres = nan(ncentres,2);   %getting newCentres with null values in dimensions of ncentres x 2
    while true                      %infine loop
       [centres, options, post, error] = kmeans(centres, data, options);   %applying kmeans
       if isequal(centres,newCentres)                               %comparing new centres with old centres
           break;                                                   %breaking loop
       end
       newCentres = centres;                                        %assigning new values of centres
       [~, membership] = max(post,[],2);                            %Getting the index of lowest distance
       f = figure((ncentres * 100) + n);                             %setting new figure
       n = n + 1;                                                   
       hold on; 
       
       for i = 1:ncentres
           plot(data(membership==i,1), data(membership==i,2), '.', 'color',de2bi(i,3));     
           Title{i} = strcat('Cluster', 32 , int2str(i)) ;          %setting title
       end
%       set(gca, 'Box', 'on');
       plot(centres(:, 1), centres(:,2), 'k.', 'LineWidth', 2, 'MarkerSize', 15)
       Title{ncentres+1} = 'Code Vectors';
       legend(Title, 'Location', 'southeast');
       saveas(f,strcat('f',int2str((ncentres * 100) + n),'.png'));
    end
end