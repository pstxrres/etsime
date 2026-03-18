function [R,Y]=ENSAMBLA(R,r,Y,y,J)
   [n,m]=size(r); NF=J+n-1;
   R(J:NF,J:NF)= R(J:NF, J:NF)+r;
   Y(J:NF,1)=Y(J:NF,1)+y;
end


% Subprograma que, dada la matriz R (cuadrada con N filas y N columnas), la
% matriz r (cuadrada con n<N filas y n columnas), un vector Y (de N
% elementos), un vector y (de n elementos) y un número entero positivo J
% (tal que J+n-1<=N); se ensamble la matriz r en la submatriz de R 
% comprendida entre sus filas y columnas J a (J+n-1) y el vector y en el 
% vector Y comprendidos entre el elemento J-ésimo y el (J+n-1)-ésimo.