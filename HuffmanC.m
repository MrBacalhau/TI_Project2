function [ ent_huff ] = HuffmanC(Y)
% Create unique symbols, and assign probabilities of occurrence to them.
symbols = unique(Y);
h=hist(Y,symbols);
p = h / length(Y); 
%%
% Create a Huffman dictionary based  on the symbols and their
% probabilities.
dict = huffmandict(symbols,p); 
%%
% Generate a vector of random symbols. 
symbols = transpose(symbols);
sig = randsrc(100,1,[symbols; p]); 
%%
% Encode the random symbols.
comp = huffmanenco(sig,dict); 
%%
% Decode the data. Verify that the decoded data matches the original data.
dsig = huffmandeco(comp,dict);
ent_huff = entropia(dsig);
iseq=isequal(sig,dsig);
%%
% Convert the original signal to binary, and determine its length.
binarySig = de2bi(sig);
seqLen = numel(binarySig);
%%
% Convert the Huffman encoded signal and determine its length.
binaryComp = de2bi(comp);
encodedLen = numel(binaryComp);
disp(sprintf('\tHuffman\n\t\ttamanho original: %f\n\t\ttamanho codificado: %f', seqLen, encodedLen));
%%
% The Huffman encoded data required 224 bits, which is a 25% savings over
% the uncoded data.

end

