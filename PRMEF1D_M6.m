clear; close all;
% **************** P R E P R O C E S O ********
a=0; b=12; % Extremos del intervalo espacial
NEL = 8; % Número de elementos del mallado
MNE=3; % Máximo nº de nodos de un elemento
D=@(x) 1; % Difusividad
V=@(x) 0; % Velocidad
Q=@(x) x; % Reactividad
f=@(x) 1/10; % Fuente
aa=1; ba=0; ga=1; % Contorno Izq.
ab=0; bb=1; gb=12; % Contorno Dcho.
[tipo,nodel,xn]=malla_6(a,b,NEL); % Mallado
NN = length(xn); % Número de nodos
NPI=5; % Número de abscisas de integración gaussiana
% Abscisas y peso de integración emn (-1,1)
[zita,omega] = Gauss_Legendre(NPI);
% BIBLIOTECA DE ELEMENTOS
[L1,DL1]= P1R(zita); [L2,DL2]= P2R(zita);
% **************** P R O C E S O ********
R=zeros(NN); Y=zeros(NN,1);
for e=1:1:NEL % En cada elemento
 t= tipo(e);
 if (t==1) % si el elemento e tiene 2 nodos ...
 nn=2; s1=nodel(e,1); L=L1; DL=DL1;
 elseif (t==2) % si el elemento e tiene 3 nodos ...
 nn=3; s1=nodel(e,1); L=L2; DL=DL2;
 end
 se=xn(s1:s1+t)'; [xe]=PINT(L,se); [JAC]=JACOB(DL,se);
 % MATRICES DIAGONALES y VECTOR fF
 DF = diag(omega.*D(xe)./JAC); VF = diag(omega.*V(xe));
 QF = diag(omega.*Q(xe).*JAC); fF = (omega.*f(xe).*JAC);
 % MATRIZ ELEMENTAL DE RIGIDEZ
 r = DL*(DF*DL.'- VF*L.')+L*QF*L.';
 % VECTOR ELEMENTAL DE CARGAS
 y = L*fF;
 % ENSAMBLAJE
 %nodos= nodel(e,1:tipo(e)+1);
 [R,Y]=ENSAMBLA(R,r,Y,y,s1-1);
end
% IMPOSICIÓN DE LAS CONDICIONES DE CONTORNO
if (aa==0) % EXTREMO IZQUIERDO
 R(1,1)=1; R(1,2:1+tipo(1))=0; Y(1,1)=ga/ba;
else
 R(1,1)= R(1,1) - D(a)*ba/aa-V(a);
 Y(1,1)= Y(1,1) - D(a)*ga/aa;
end
if (ab==0) % EXTREMO DERECHO
 R(NN,NN)=1; R(NN, 1:NN-1)= 0; Y(NN,1)=gb/bb;
else
 R(NN,NN)= R(NN,NN) + D(b)*bb/ab+V(b);
 Y(NN,1) = Y(NN,1) + D(b)*gb/ab;
end
% RESOLUCIÓN DEL SISTEMA
U=R\Y;
% ******** P O S T P R O C E S O ******
writematrix([xn,U],'MODELO_6.txt','Delimiter','tab');
% Ej 3º) Representación de la k-ésima función
% de base de Lagrange.
k=9; % Nº de la función
nd=21; % Nº de abscisas para dibujo
[row,col]=find(nodel==k); % Localizamos fila y columna del nodo con
 % número global k (que indican los elementos a los que pertenece
 % el nodo k y el nº local que tiene en ellos).
ne=length(row); % Nº de elementos (1 o 2) a los que pertenece el nodo
YD=zeros(1,nd*NEL); % Abscisas dibujo
XD=linspace(a,b,nd*NEL); % Ordenadas dibujo
for i=1:1:ne % Para cada elemento a los que pertenece el nodo …
    e=row(i); nn=1+tipo(e);se=zeros(1,nn); fe=se;
 se=xn(nodel(e,1):nodel(e,nn))'; fe(1,col(i))=1;
 [xd,yd]=VDF_6(se,fe,nd);
 XD((e-1)*nd+1:e*nd)=xd; YD(1+(e-1)*nd:e*nd)=yd;
end
plot(XD,YD,'-r','Linewidth',3);
hold on
plot(xn,zeros(1,NN),'ok');
plot([a,b],[0,0],'-k')
grid on; grid minor;
title(['Función de base de Lagrange nº',num2str(k)'])
% 4º Escritura de los términos no nulos
% de la sexta fila de la matriz
disp(' ')
fila=6;
for J=1:1:NN
 if (R(fila,J)~=0)
 disp(['R(',num2str(fila),',',num2str(J),')= ',...
 num2str(R(fila,J))]);
 end
end
disp(' '); disp('R_{6,5}='),disp(R(6,5))
% 5
disp(' '); disp('Vector de cargas')
k=nodel(2,1+tipo(2));
for i=1:1:k
 disp(['V(',num2str(i),')= ',num2str(Y(i))]);
end
disp('V(1)= '); disp(Y(1))