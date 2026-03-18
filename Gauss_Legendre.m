function [xi,omega]=Gauss_Legendre(n)
  C=zeros(n,n); omega=zeros(n,1);
  P0=1; P1=[1,0]; %COEFICIENTES DE P0 y P1
  if (n==0)         % Si n=0 ...
      xi=NaN;       %  ... NO HAY SOPORTE
  elseif (n==1)     % si no, si n=1 ...
      xi=0;       %  ... EL SOPORTE ES {0}
  else              % si no 
      PAP=P0; % Polinomio AntePenúltimo
      PPE=P1; % Polinomio PEnúltimo 
      for k=2:1:n% Cálculo del polinomio k
            % con la relación de recurrencia 
           Pk=((2*k-1)*[PPE,0]-(k-1)*[0,0,PAP])/k;
           PAP=PPE;  PPE=Pk; % Actualizo PAP y PPE
      end
      xi=sort(roots(Pk)); % Cálculo las raíces
  end                     % Fin ramificación
  for I=1:1:n
     if (I==1)
        R = xi(2:n);
     elseif (I==n)
        R = xi(1:n-1);
     else
        R = [xi(1:I-1);xi(I+1:n)];
     end
     Q = poly(R); V=polyval(Q,xi(I));
     C(I,1:n)=Q/V;
  end
  for I=1:1:n % INTEGRAMOS ENTRE -1 Y 1 LOS
            % POLS DE BASE DE LAGRANGE...
       D=polyint(C(I,1:n),0); % Integro fila Iª
       omega(I,1)=polyval(D,1)-polyval(D,-1); 
                                %evalúo coef. Iº
  end
end

% Subprograma que calcula dos vectores: zita y omega, de n elementos a
% partir de un entero positivo n conteniendo el primero de ellos las n
% abscisas y el otro los n coeficientes de la correspondiente fórmula de
% integración de Gauss-Legendre.

