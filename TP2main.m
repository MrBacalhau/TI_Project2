filename = 'C:\Users\gon_f\OneDrive\Documentos\Uni\4ºano\TI\TP2\Data\EMG_norm.csv';
data = csvread(filename)

%entropia(data)

a = lpc(data,3);
est_data = filter([0 -a(2:end)],1,data);
e = data-est_data;
[acs,lags] = xcorr(e,'coeff');

plot(1:97,data(4001:4097),1:97,est_data(4001:4097),'--'), grid
title 'Original Signal vs. LPC Estimate'
xlabel 'Sample number', ylabel 'Amplitude'
legend('Original signal','LPC estimate')