function [ ent_delta_prd ] = delta( Y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    est = filter([0 1], 1, Y);
    e = Y-est;
    ent_delta_prd = entropia(est)
    ent_delta_e = entropia(e);
    
    

end

