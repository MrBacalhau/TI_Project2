function [ output_args ] = linear( Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    a = lpc(Y,3);
    est = filter([0 -a(2:end)],1,Y);
    e = Y-est;
    [acs,lags] = xcorr(e,'coeff');
    ent_lpc = entropy(e+est)


    plot(1:97,Y(4001:4097),1:97,est(4001:4097),'--'), grid
    title 'Original Signal vs. LPC Estimate'
    xlabel 'Sample number', ylabel 'Amplitude'
    legend('Original signal','LPC estimate')

end

