filename = 'EMG_norm.csv';
data=csvread(filename);
file='datawave.wav';
audiowrite(file,data, 250);
[Y, fs]=audioread(file);
alpha=unique(Y);
h=hist(Y,alpha);
ent=entropy(Y)

linearpredictor(Y);

adaptativelinear(Y)