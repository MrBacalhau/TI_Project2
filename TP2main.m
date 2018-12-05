filename = 'EMG_norm.csv';
data=csvread(filename);
file='datawave.wav';
audiowrite(file,data, 250);
[Y, fs]=audioread(file);
alpha=unique(Y);
h=hist(Y,alpha);
ent=entropy(Y)


a = lpc(data,3);
est_data = filter([0 -a(2:end)],1,data);
e = data-est_data;
[acs,lags] = xcorr(e,'coeff');


plot(1:97,data(4001:4097),1:97,est_data(4001:4097),'--'), grid
title 'Original Signal vs. LPC Estimate'
xlabel 'Sample number', ylabel 'Amplitude'
legend('Original signal','LPC estimate')