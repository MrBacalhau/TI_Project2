function [ entrop ] = adpcm( Y )
    encoded=adpcm_encoder ( Y );
    adpcm_entropia_encoded=entropia(encoded);
    sd_enc=length(unique(encoded));

    decoded=adpcm_decoder ( encoded );
    decoded=transpose(decoded);
    err=Y-decoded;

    file='wololo.wav';
    audiowrite(file, decoded, 250, 'BitsPerSample', 16);
    [prd, fs]=audioread(file);
    delete 'wololo.wav';

    file='wololo.wav';
    audiowrite(file,err, 250, 'BitsPerSample', 16);
    [err, fs]=audioread(file);
    delete 'wololo.wav';
    
    sd_dec_err=length(unique(err));

    adpcm_entropia_erro=entropia(err);

    desc_entro=entropia(err+prd);
    disp(sprintf('Codec ADPCM\n\tentropia do sinal codificado: %f \n\ttamanho do dicionario do sinal codificado: %d \n\tentropia do erro: %f \n\ttamanho do dicionario do erro: %d\n\tentropia do sinal descodificado: %f\n', adpcm_entropia_encoded, sd_enc, adpcm_entropia_erro, sd_dec_err, desc_entro));

end

