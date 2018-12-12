function [ ] = CELP_RUN( hfile )
% Create WAV file in current folder.
%load handel.mat
%audiowrite(y, Fs, hfile)
%clear y Fs;

% Taking the input data from speech file
[y, fs] = audioread(hfile);
N = 160;    % Frame length
L = 40;     % Sub-frame length
M = 12;     % Order of LP analysis
c = 0.85;   % constant parameter for perceptual weighted filter
Pidx = [16 160];

% Entering into the CELP analysis-by-synthesis codec
% creating the Gaussian codebook
randn('state',0);
cb = randn(L,1024);

% invoking the CELP codecs
[xhat1, e, k, theta0, P, b] = celp9600(y,N,L,M,c,cb,Pidx);
[xhat2, e, k, theta0, P, b] = celp16k(y,N,L,M,c,cb,Pidx);

% plotting all the speech profiles
figure(1)
subplot(3,1,1)
plot(y)
axis([0 7*10^4 -1 1]);
xlabel('time'); ylabel('Amplitude');
title('The original speech samples');
subplot(3,1,2)
plot(xhat1,'m')
axis([0 7*10^4 -1 1]);
xlabel('time'); ylabel('Amplitude');
title('The CELP 16 kbps synthetic samples');
subplot(3,1,3)
plot(xhat2,'c')
axis([0 7*10^4 -1 1]);
xlabel('time'); ylabel('Amplitude');
title('The CELP 9.6 kbps synthetic samples');

% comparing all the synthetic speech profiles with original speech
figure(2)
plot([y xhat1]);
axis([0 7*10^4 -1 1]);
legend('original speech','16 kbps CELP speech');
xlabel('time'); ylabel('Amplitude');
title('The comparison of original speech & 16 kbps CELP synthetic samples');        
        
figure(3)
plot([y xhat2]);
axis([0 7*10^4 -1 1]);
legend('original speech','9.6 kbps CELP speech');
xlabel('time'); ylabel('Amplitude');
title('The comparison of original speech & 9.6 kbps CELP synthetic samples'); 
        

end

