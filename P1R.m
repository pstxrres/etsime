function [L1,DL1]= P1R(zita)  
    N = length(zita);
    L1(1,1:N) = (1-zita)/2; 
    L1(2,1:N) = (1+zita)/2;
    DL1(1,1:N)=-1/2; 
    DL1(2,1:N)= 1/2;
end


% Subprograma que calcula una matriz L1 la cual contiene en la primera 
% fila los valores del primer polinomio de base de Lagrange asociado
% a soporte principal del elemento de referncia en m abscisas dadas en un 
% vector; y en su segunda fila los valores en dichas abscisas del segundo
% de los polinomios de base de Lagrange asociado al soporte principal del
% elemento de referencia.
% También calcula una matriz DL1 que contiene los valores en esas mismas
% abscisas en las primeras derivadas de los polinomios de base.

% DOS NODOS
