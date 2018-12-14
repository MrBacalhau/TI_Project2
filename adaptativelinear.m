function [ prd, err ] = adaptativelinear( Y )
    alpha_sig=unique(Y);
    h_sig=hist(Y,alpha_sig);
    
    signal =transpose(Y);
    signal= con2seq(signal);
    Pi = signal(1:6);
    P = signal(6:end);
    T = P;
    
    net = linearlayer(1:6,0.1);
    
    [net,prd] = adapt(net,P,T,Pi);
    e = cell2mat(T)-cell2mat(prd);
    
    prd=[cell2mat(Pi) cell2mat(prd)];
    prd(prd>=1)=1;
    file='datawave.wav';
    audiowrite(file, prd, 250, 'BitsPerSample', 16);
    [prd, fs]=audioread(file);
    delete 'datawave.wav';
    
    e(e<-1)=-1;
    file='datawave.wav';
    audiowrite(file, e, 250, 'BitsPerSample', 16);
    [err, fs]=audioread(file);
    delete 'datawave.wav';
    
    
    sd_prd=length(unique(prd));
    sd_err=length(unique(err));
    ent_alc_prd = entropia(prd);
    ent_alc_e = entropia(err);

    
    alpha_prd=unique(prd);
    h_prd=hist(prd, alpha_prd);
    alpha_err=unique(err);
    h_err=hist(err, alpha_err);
    figure
    subplot(3,1,1)
    plot(h_sig), grid
    title 'Histograma do sinal original'
    subplot(3,1,2)
    plot(h_prd), grid
    title 'Histograma da predicao'
    subplot(3,1,3)
    plot(h_err), grid
    title 'Histograma do erro' 
    disp(sprintf('Adaptative Linear Predictor\n\tentropia do sinal: %f \n\ttamanho do dicionario do sinal: %d \n\tentropia do erro: %f \n\ttamanho do dicionario do erro: %d\n', ent_alc_prd, sd_prd, ent_alc_e, sd_err));
end

