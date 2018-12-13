function [arith_entropy] = Arithmetics(matrix)

%encode
[m,n]=size(matrix);
Data=reshape(matrix',1,m*n);
tab=tabulate(Data);
%n=nnz(tab(:,2));
%A=find(tab(:,2),n);
A=find(tab(:,2));
tabn=zeros(1,3);
for i=1:size(A)
    tabn(i,1:2)=tab(A(i),1:2);
    tabn(i,3)=i;
end
NewData=Data;
for i=1:size(NewData,2)
    indice=find(tabn(:,1)==Data(i));
    NewData(i)=tabn(indice, 3);
end
code = arithenco(NewData, tabn(:,2));
symtable=tabn;

%decode
dec=arithdeco(code, symtable(:,2), sum(symtable(:,2)));
NewDec=dec;
for i=1:size(NewDec,2)
    indice=find(symtable(:,3)==dec(i));
    NewDec(i)=symtable(indice, 1);
end
matrix=NewDec;
matrix=reshape(matrix,m,n);
matrix=matrix';
arith_entropy = entropy(matrix);