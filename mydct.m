function [ ent_dct ] = mydct(Y)
%DCT Summary of this function goes here
%   Detailed explanation goes here

%read a file and convert it to a vector
[funky, f] = audioread('datawave.wav');

%chosing a block size 
windowSize = 8192;

%changing compression  percentages
samplesHalf = windowSize / 2;
samplesQuarter = windowSize / 4;
samplesEighth = windowSize / 8;

%initializing compressed matrice
funkyCompressed2 = [];
funkyCompressed4 = [];
funkyCompressed8 = [];

%actual compression
for i=1:windowSize:length(funky)-windowSize
    windowDCT = dct(funky(i:i+windowSize-1));
    funkyCompressed2(i:i+windowSize-1) = idct(windowDCT(1:samplesHalf), windowSize);
    funkyCompressed4(i:i+windowSize-1) = idct(windowDCT(1:samplesQuarter), windowSize);
    funkyCompressed8(i:i+windowSize-1) = idct(windowDCT(1:samplesEighth), windowSize);
end

%plotting audio signals
figure(1)
h1 = subplot(4,1,1);
plot(funky), title('Original Waveform');
subplot(4,1,2)
plot(funkyCompressed2), title('Compression Factor 2'), axis(axis(h1));
subplot(4,1,3)
plot(funkyCompressed4), title('Compression Factor 4'), axis(axis(h1));
subplot(4,1,4)
plot(funkyCompressed8), title('Compression Factor 8'), axis(axis(h1));

%expanded view of audio signals
figure(2)
h1 = subplot(4,1,1); plot(funky(4000:4300)), title('Portion of Original Waveform');
subplot(4,1,2)
plot(funkyCompressed2(4000:4300)), title('Portion of Compression Factor 2'), ;
subplot(4,1,3)
plot(funkyCompressed4(4000:4300)), title('Portion of Compression Factor 4'), axis(axis(h1));
subplot(4,1,4)
plot(funkyCompressed8(4000:4300)), title('Portion of Compression Factor 8'), axis(axis(h1));

%spectrogram of audio signals
figure(3)
subplot(4,1,1)
specgram(funky), title('Original Waveform');
subplot(4,1,2)
specgram(funkyCompressed2), title('Compression Factor 2');
subplot(4,1,3)
specgram(funkyCompressed4), title('Compression Factor 4');
subplot(4,1,4)
specgram(funkyCompressed8), title('Compression Factor 8');

ent_dct = entropy(funkyCompressed2);
%saving to wave files
%audiowrite('funky2.wav',funkyCompressed2, 250, 'BitsPerSample', 16)
%audiowrite('funky4.wav',funkyCompressed4, 250, 'BitsPerSample', 16)
%audiowrite('funky8.wav',funkyCompressed8, 250, 'BitsPerSample', 16)

end

