filename = 'EMG_norm.csv';
data=csvread(filename);
file='datawave.wav';
audiowrite(file,data, 250, 'BitsPerSample', 16);
[Y, fs]=audioread(file);
alpha=unique(Y);
h=hist(Y,alpha);
ent=entropia(h)

%Entropia_lpc=linearpredictor(Y)

%Entropia_alpc=adaptativelinear(Y)

Entropia_adpcm=adpcm(Y)

%CELP_RUN(file);
