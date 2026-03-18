
    function [x]=PINT(L,s)
% cálculo de las abscisas de integración en
% un elemento genérico
   [n,NPI]=size(L); x=zeros(NPI,1);
   for I=1:1:NPI
       x(I)=dot(s,L(1:n,I));
   end
end
% Subprograma que, a partir de la matriz L (matriz cuya I-ésima fila
% contiene los valores del I-ésimo polinomio de base de Lagrange del
% elemeto de referencia en m abscisas) y del vector s (con abscisas de los
% n nodos de un elemento), calcule un vector X con las imágenes de zita a
% través de la función de paso.
