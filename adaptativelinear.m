function [ ent_alc ] = adaptativelinear( Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    min=4000;
    max=4300;
    time = 0:length(Y); % from 0 to 6 seconds
    
    signal =transpose(Y);
    signal= con2seq(signal);
    Pi = signal(1:6);
    P = signal(6:end);
    timex = time(6:end-1);
    timex=timex(min:max);
    T = P;
    
    net = linearlayer(1:6,0.1);
    
    [net,prd] = adapt(net,P,T,Pi);
    e = cell2mat(T)-cell2mat(prd);
    
    ent_alc = entropy(e+cell2mat(prd));
    
    prd=cell2mat(prd);
    T=cell2mat(T);

    figure
    plot(min:max,T(min:max),min:max,prd(min:max),'--',min:max, e(min:max),'r'), grid
    title 'Original Signal vs. ALPC Estimate'
    xlabel 'Sample number', ylabel 'Amplitude'
    legend('Original signal','ALPC estimate', 'Error')

end

