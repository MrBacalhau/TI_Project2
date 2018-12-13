function [ ent_arth ] = Arithmetics( Y )
%% Encode Data Sequence with Arithmetic Code
% This example illustrates the compression that arithmetic coding can
% accomplish in some situations. A source has a two-symbol alphabet and
% produces a test data set in which 99% of the symbols are 1s. Encoding
% 1000 symbols from this source produces a code vector having fewer
% than 1000 elements. The actual number of elements in
% encoded sequence varies depending on the particular random
% sequence.
%%
% Set |counts| so that a one occurs 99% of the time.
symbols = unique(Y);
h=hist(Y,symbols);
counts = h / length(Y); 
%%
% Generate a random data sequence of length 1000.
len = length(Y);
seq = Y;
%%
% Encode the sequence and display the encoded length.
code = arithenco(seq,counts);
dseq = arithdeco(code,counts,lenght(seq));
s = size(code) 
isequal(seq , dseq)
%%
% The length of the encoded sequence is only 5.7% of the length of the
% original sequence.

end

