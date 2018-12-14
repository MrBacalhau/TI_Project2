function [prd, err ] = linearpredictor( Y )
    a = lpc(Y,2);
    est = filter([0 -a(2:end)],1,Y);
    e = Y-est;
    alpha_sig=unique(Y);
    h_sig=hist(Y,alpha_sig);
    
    file='datawave.wav';
    audiowrite(file, est, 250, 'BitsPerSample', 16);
    [prd, fs]=audioread(file);
    delete 'datawave.wav';
    e(e<-1)=-1;
    file='datawave.wav';
    audiowrite(file, e, 250, 'BitsPerSample', 16);
    [err, fs]=audioread(file);
    delete 'datawave.wav';
    
    sd_prd=length(unique(prd));
    sd_err=length(unique(err));
    ent_lpc_prd = entropia(prd);
    ent_lpc_e = entropia(err);
    
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
    disp(sprintf('Linear Predictor\n\tentropia do sinal: %f \n\ttamanho do dicionario do sinal: %d \n\tentropia do erro: %f \n\ttamanho do dicionario do erro: %d\n', ent_lpc_prd, sd_prd, ent_lpc_e, sd_err));
end

