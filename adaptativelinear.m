function [ ent_alc ] = adaptativelinear( Y )
    min=4000;
    max=4300; 
    
    signal =transpose(Y);
    signal= con2seq(signal);
    Pi = signal(1:6);
    P = signal(6:end);
    T = P;
    
    net = linearlayer(1:6,0.1);
    
    [net,prd] = adapt(net,P,T,Pi);
    e = cell2mat(T)-cell2mat(prd);
    
    ent_alc=entropy(cell2mat(prd)+e);
    ent_alc_prd = entropia(cell2mat(prd))
    ent_alc_e = entropia(e)
    prd=cell2mat(prd);
    T=cell2mat(T);

    figure
    plot(min:max,T(min:max),min:max,prd(min:max),'--',min:max, e(min:max),'r'), grid
    title 'Original Signal vs. ALPC Estimate'
    xlabel 'Sample number', ylabel 'Amplitude'
    legend('Original signal','ALPC estimate', 'Error')

end

