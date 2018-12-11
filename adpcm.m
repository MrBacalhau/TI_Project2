function [ entrop ] = adpcm( Y )
encoded=adpcm_encoder ( Y );
adpcm_entropia_encoded=entropy(encoded)
decoded=adpcm_decoder ( encoded );
decoded=transpose(decoded);
e=Y-decoded;
entrop=entropy(e+decoded);

min=4000;
max=4300;

figure
plot(min:max,Y(min:max),min:max,decoded(min:max),'--',min:max,e(min:max),'r'), grid
title 'Original Signal vs. LPC Estimate'
xlabel 'Sample number', ylabel 'Amplitude'
legend('Original signal','LPC estimate', 'Error')


end

