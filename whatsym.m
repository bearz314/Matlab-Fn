% Given a symbolic expression, outputs the symbolic variables as a
% cell array.
%
% Example: given f(a,b,c) this function returns {a,b,c}
% Usage:   C = whatsym(symexp)

function C = whatsym(symexp)

    % expression to match variable names
    expression = '[a-zA-Z][a-zA-Z_0-9]*';
    
    [x,y] = size(symexp);
    C = cell(x,y);
    
    for i=1:x
        for j=1:y
            % extract vars
            cellarray = regexp(char(symexp(i,j)), expression, 'match');
            
            % make unique
            cellarray = unique(cellarray);
            disp([i j cellarray])
            
            % store
            C(i,j) = {cellarray};
        end
        
        % if more than 1 column, add separator between rows
        if y > 1 && i < x
            disp('    ----------');
        end
    end

end