% Create a matrix with consecutive numbers of given dimension

function array = runmat(varargin)
    
    % PARSE INPUTS
    
    % min 1 input
    narginchk(1,inf);
    
    % convert to int array
    arrSize = cell2mat(varargin);
    
    % must not be nan or negative
    if any(isnan(arrSize)) || any(arrSize < 0)
        error('check input');
    end
    
    % GENERATE ARRAY
    
    if nargin == 1
        array = reshape(1:arrSize*arrSize, arrSize,[])';
    else
        arrSize([2 1]) = arrSize([1 2]);
        array = reshape(1:prod(arrSize), arrSize);
        
        order = 1:nargin;
        order([2 1]) = order([1 2]);
        array = permute(array,order);
    end
    
end