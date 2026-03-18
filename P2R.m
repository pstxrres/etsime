function [L2,DL2]= P2R(zita)  
     N = length(zita); 
     L2(1,1:N) = zita.*(zita-1)/2; 
     L2(2,1:N) = 1-zita.^2;
     L2(3,1:N) = zita.*(zita+1)/2;
     DL2(1,1:N)= zita-1/2; 
     DL2(2,1:N)= -2*zita;
     DL2(3,1:N)= zita+1/2;
end

% Subprograma que calcula una matriz L2 la cual contiene en la primera 
% fila los valores del primer polinomio de base de Lagrange asociado
% a soporte principal del elemento de referncia en m abscisas dadas en un 
% vector; en su segunda fila los valores en dichas abscisas del segundo de 
% los polinomios de base de Lagrange asociado al soporte principal del 
% elemento de referencia; y en su tercera fila los valores en dichas 
% abscisas del tercer de los polinomios de base de Lagrange asociado al 
% soporte principal del elemento de referencia.
% También calcula una matriz DL2 que contiene los valores en esas mismas
% abscisas en las primeras derivadas de los polinomios de base.

%TRES NODOS
