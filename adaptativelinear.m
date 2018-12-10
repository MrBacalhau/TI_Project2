function [ output_args ] = adaptativelinear( Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    time1 = 0:0.025:4;      % from 0 to 4 seconds
    time2 = 4.025:0.025:6;  % from 4 to 6 seconds
    time = [time1 time2];  % from 0 to 6 seconds
    
    signal = Y(:);
    Xi = signal(1:5);
    X = signal(6:end);
    timex = time(6:end);
    
    T = signal(6:end);
    
    net = linearlayer(1:5,0.1);
    
    [NET,Y,E,Pf,Af,AR] = adapt(net,X,T,Xi);
    
    figure
    plot(timex,cell2mat(Y),timex,cell2mat(T),'+')
    xlabel('Time');
    ylabel('Output -  Target +');
    title('Output and Target Signals');


end

