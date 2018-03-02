function txOverSample = oversample(input, times)
    
    txOverSample = []; 
    for i = 1:length(input)
        
        for j = 1:times
            txOverSample = [txOverSample, input(i)]; 
        end
    end
 
end