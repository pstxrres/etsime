function [xd,yd]=VDF_6(s,f,n)
 % s son las abscisas nodales del elemento; f ordenadas nodales.
 % n número de valores interpolados.
 % xd abscisas del elemento imágenes de las n abscisas uniformemente
 % repartidas en [-1,1]; yd valores interpolados en ellas
 NN=length(s); % Número de Nodos del elemento
 if (NN==2) % Si hay 2: interpolación lineal
 xd=linspace(s(1),s(2),n); yd=linspace(f(1),f(2),n);
 else % Si hay más de 2:
 xi=linspace(-1,1,n); % abscisas repartidas en [-1,1]
 sp=linspace(-1,1,NN); % soporte principal
 L=zeros(NN,n); % Dimensionado de la matriz de valores de los
 % polinomios de base (p.b.) en las abscisas de xi
 p=poly(sp(2:NN)); % Polinomio con raíces del 1er p.b.
 L(1,1:n)=polyval(p/polyval(p,sp(1)),xi); % Valores del 1er p.b.
 for i=2:1:NN-1
 p=poly([sp(1:i-1),sp(i+1:NN)]); % Pol. con raíces del p.b nºi
 L(i,1:n)=polyval(p/polyval(p,sp(i)),xi); % Valores del p.b
 end
 p=poly(sp(1:NN-1)); % Polinomio con raíces del último p.b.
 L(NN,1:n)=polyval(p/polyval(p,sp(NN)),xi); % Valores del p.b.
 xd=s*L; yd=f*L; % Abscisas y Valores buscados
 end
end
