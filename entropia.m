function [entropia] = entropia(Y);
    alpha=unique(Y);
    h=hist(Y,alpha);
    array = h / length(Y);
    
    % Set array zeros to 0 
    % log2 (0) = error which messes up entropy calc
    % log2 (1) = 0 makes entropy ignore value
    array(array == 0) = 1;
    entropia = -sum(array.*log2(array));
    %fprintf('Entropia de: %f\n',entropia);

end

