# Talent_Group_8
%matlab 
function [E1] = Pairing(A,B,g,d,DIM)
A=0;
B=2;
g=0.7;
d=0.1;
DIM=2;
for i=A:B
    H=zeros(DIM,DIM);
end
H=[2*d-g -g/2; -g/2 4*d-g];
[V,H] = eig(H);
H
V
end
