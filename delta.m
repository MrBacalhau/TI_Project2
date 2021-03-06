function [ prd, err ] = delta( Y )
    prd = filter([0 1], 1, Y);
    err = Y-prd;
    alpha_sig=unique(Y);
    h_sig=hist(Y,alpha_sig);
    ent_delta_prd = entropia(prd);
    ent_delta_e = entropia(err);
    sd_prd=length(unique(prd));
    sd_err=length(unique(err));
    
    
    file='datawave.wav';
    audiowrite(file, prd, 250, 'BitsPerSample', 16);
    [prd, fs]=audioread(file);
    delete 'datawave.wav';
    err(err<-1)=-1;
    file='datawave.wav';
    audiowrite(file, err, 250, 'BitsPerSample', 16);
    [err, fs]=audioread(file);
    delete 'datawave.wav';
    
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
    disp(sprintf('Delta Predictor\n\tentropia do sinal: %f \n\ttamanho do dicionario do sinal: %d \n\tentropia do erro: %f \n\ttamanho do dicionario do erro: %d\n', ent_delta_prd, sd_prd, ent_delta_e, sd_err));
end

