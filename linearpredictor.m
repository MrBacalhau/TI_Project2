function [ ent_lpc ] = linearpredictor( Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    min=4000;
    max=4300;
    a = lpc(Y,3);
    est = filter([0 -a(2:end)],1,Y);
    e = Y-est;
    %[acs,lags] = xcorr(e,'coeff');
    ent_lpc = entropy(e+est);

    figure
    plot(min:max,Y(min:max),min:max,est(min:max),'--',min:max, e(min:max),'r'), grid
    title 'Original Signal vs. LPC Estimate'
    xlabel 'Sample number', ylabel 'Amplitude'
    legend('Original signal','LPC estimate', 'Error')

end

