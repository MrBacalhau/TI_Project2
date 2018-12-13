function [ entrop ] = adpcm( Y )
encoded=adpcm_encoder ( Y );
adpcm_entropia_encoded=entropy(encoded);

length(unique(encoded))
decoded=adpcm_decoder ( encoded );
decoded=transpose(decoded);
e=Y-decoded;

entrop_antes=entropy(e+decoded);

file='wololo.wav';
audiowrite(file,e, 250, 'BitsPerSample', 16);
[Z, fs]=audioread(file);
quant=length(unique(Z))
adpcm_entropia_erro=entropia(Z)

entrop=entropy(Z+decoded);

min=4000;
max=5000;

figure
plot(min:max,Y(min:max),min:max,decoded(min:max),'--',min:max,Z(min:max),'r'), grid
title 'Original Signal vs. LPC Estimate'
xlabel 'Sample number', ylabel 'Amplitude'
legend('Original signal','LPC estimate', 'Error')


end

