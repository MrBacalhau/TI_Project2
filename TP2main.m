filename = 'EMG_norm.csv';
data=csvread(filename);
file='datawave.wav';
audiowrite(file,data, 250, 'BitsPerSample', 16);
[Y, fs]=audioread(file);
alpha=unique(Y);
h=hist(Y,alpha);
ent=entropia(Y)

Entropia_lpc=linearpredictor(Y);

Entropia_alpc=adaptativelinear(Y);

Enropia_delta = delta(Y);

%Entropia_adpcm=adpcm(Y)

%CELP_RUN(file);

Entropia_dct = mydct(Y)
disp('Byte Folder')
Entropia_huff = HuffmanC(Y)

Entropia_arth = Arithmetics(Y)


