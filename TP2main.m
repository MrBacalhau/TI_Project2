filename = 'EMG_norm.csv';
data=csvread(filename);
file='datawave.wav';
audiowrite(file, data, 250, 'BitsPerSample', 16);
[Y, fs]=audioread(file);
delete 'datawave.wav';
alpha=unique(Y);
h=hist(Y,alpha);
sd_sin=(length(unique(Y)));
disp(sprintf('entropia do sinal original: %f tamanho do dicionario do sinal original: %d', entropia(Y) , sd_sin));
figure
plot(h), grid
title 'Histograma do sinal original'
pred=3;
cod=3;
%Linear Pridictor
if(pred==0)
    [lpc_prd, lpc_err]=linearpredictor(Y);
    if(cod==0)
        %Huffman
        HuffmanC(lpc_err);
    elseif(cod==1)
        %Aritmetico
        Arithmetics(lpc_err);
    elseif(cod==2)
        %Discrite cuzinho transform
        mydct(lpc_err);
    end
elseif(pred==1)
    [alpc_prd, alpc_err]=adaptativelinear(Y);
    if(cod==0)
        %Huffman
        HuffmanC(alpc_err);
    elseif(cod==1)
        %Aritmetico
        Arithmetics(alpc_err);
    elseif(cod==2)
        %Discrite cuzinho transform
        mydct(alpc_err);
    end
elseif(pred==2)
    [delta_prd, delta_err] = delta(Y);
    if(cod==0)
        %Huffmanx
        HuffmanC(delta_err);
    elseif(cod==1)
        %Aritmetico
        Arithmetics(delta_err);
    elseif(cod==2)
        %Discrite cuzinho transform
        mydct(delta_err);
    end
elseif(pred==3)
    %ADPCM
    adpcm(Y);
end

