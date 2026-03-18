function [L3,DL3]=P3R(zita)
    NPI=length(zita);
    L3(1,1:NPI)=(zita.*(zita.*(-9*zita+9)+1)-1)/16;
    L3(2,1:NPI)=(zita.*(zita.*(27*zita-9)-27)+9)/16;
    L3(3,1:NPI)= (zita.*(zita.*(-27*zita-9)+27)+9)/16;
    L3(4,1:NPI)= (zita.*(zita.*(9*zita+9)-1)-1)/16;
    DL3(1,1:NPI)= (zita.*(-27*zita+18)+1)/16;
    DL3(2,1:NPI)= (zita.*(81*zita-18)-27)/16;
    DL3(3,1:NPI)= (zita.*(-81*zita-18)+27)/16;
    DL3(4,1:NPI)= (zita.*(27*zita+18)-1)/16;
    
end

% Subprograma que calcula una matriz L3 la cual contiene en la primera 
% fila los valores del primer polinomio de base de Lagrange asociado
% a soporte principal del elemento de referncia en m abscisas dadas en un 
% vector; en su segunda fila los valores en dichas abscisas del segundo de 
% los polinomios de base de Lagrange asociado al soporte principal del 
% elemento de referencia; en su tercera fila los valores en dichas abscisas 
% del tercero de los polinomios de base de Lagrange asociado al soporte 
% principal del elemento de referencia; y en su cuarta fila los valores en 
% dichas abscisas del cuarto de los polinomios de base de Lagrange 
% asociado al soporte principal del elemento de referencia.
% También calcula una matriz DL3 que contiene los valores en esas mismas
% abscisas en las primeras derivadas de los polinomios de base.

% 4 NODOS
