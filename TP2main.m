filename = 'C:\Users\gon_f\OneDrive\Documentos\Uni\4ºano\TI\TP2\Data\EMG_norm.csv';
x = csvread(filename)

%noise = randn(50000,1);
%x = filter(1,[1 1/2 1/3 1/4],noise);
%x = x(45904:50000);

a = lpc(x,3);
est_x = filter([0 -a(2:end)],1,x);
e = x-est_x;
[acs,lags] = xcorr(e,'coeff');

plot(1:97,x(4001:4097),1:97,est_x(4001:4097),'--'), grid
title 'Original Signal vs. LPC Estimate'
xlabel 'Sample number', ylabel 'Amplitude'
legend('Original signal','LPC estimate')