% INCLINACIÓN ÓPTIMA - HUGO TORRES OREJUDO
% PAÍS: PUERTO RICO
% CAPITAL: SAN JUAN
% COORDENADAS: 18°27′55″N 66°07′00″O

clear;close all;clc

% ## CONSTANTES ##
Gsc = 1367;        % CONSTANTE SOLAR [W/m^2]
L = 18.465*pi/180; % LATITUD DE SAN JUAN EN RADIANES
A = 0.008;         % ALTITUD DE SAN JUAN EN KM
n = 1:365;         % VECTOR DÍAS DEL AÑO
ref = 0.2;         % REFLECTIVIDAD

% ## DECLINACIÓN SOLAR ##
d = 23.45.*sin(2*pi*(284+n)/365)*pi/180; % RADIANES

% ## ÁNGULOS HORARIOS ##
w = -180:15/4:180; % DE [180°,180°] EN INTERVALOS DE 3.75°
w = w*pi/180;      % RADIANES

% ## MATRICES DÍAS Y ÁNGULOS HORARIOS ##
dr = repmat(d',1,length(w));
wr = repmat(w,length(n),1);

% ## IRRADIANCIA EXTRATERRESTRE DIARIA ##
Gon = Gsc.*(1+0.033*cos(2*pi*n/365));
Gonr = repmat(Gon',1,length(w));

% ## MATRIZ DE RESULTADOS ##
b_grados = 0:1:60; % INCLINACIONES DE [0°,60°] EN PASOS DE 1°
irr_anual = zeros(size(b_grados));

for i = 1:length(b_grados)
% ## INCLINACIÓN i EN RADIANES ##
B = b_grados(i)*pi/180;

% ## COSENO DEL ÁNGULO DE INCIDENCIA ##
costheta = sin(dr).*sin(L).*cos(B)...
   - sin(dr).*cos(L).*sin(B).*cos(0)...
   + cos(dr).*cos(L).*cos(B).*cos(wr)...
   + cos(dr).*sin(L).*sin(B).*cos(0).*cos(wr)...
   + cos(dr).*sin(B).*sin(0).*sin(wr);
costheta(costheta<0) = 0; % VALORES NEGATIVOS == 0

% ## IRRADIANCIA GLOBAL SOBRE SUPERFICIE INCLINADA ##
Gon2 = Gonr.*costheta;

% ## TRANSMISIBILIDAD DIRECTA ##
costhetazs = sin(dr).*sin(L)+cos(dr).*cos(L).*cos(wr);
costhetazs(costhetazs<0) = 0;
k = 1.02*(0.2711+0.01858*(2.5-A)^2);
a0 = 1.03*(0.4237-0.00821*(6-A)^2);
a1 = 1.01*(0.5055+0.00595*(6.5-A)^2);
Tb = a0+a1.*exp(-k./costhetazs);

% ## IRRADIANCIA DIRECTA Y DIFUSA ##
Gon2b = Gon2.*Tb;    % IRRADIANCIA DIRECTA
Td = 0.271-0.294*Tb; % TRANSMISIBILIDAD DIFUSA
Gon2d = Gon2.*Td;    % IRRADIANCIA DIFUSA

% ## IRRADIANCIA TOTAL SOBRE SUPERFICIE INCLINADA ##
Gon2Tot = Gon2b+Gon2d;

% ## ALBEDO REFLEJADO POR SUELO ## 
alb = 0.5.*Gonr.*costhetazs.*ref.*(1-cos(B));

% ## IRRADIANCIA ANUAL ACUMULADA ##
irr_anual(i) = sum(Gon2Tot(:)+alb(:));
end

% ## INCLINACIÓN ÓPTIMA ##
[irr_max,idx_opt] = max(irr_anual);
inc_opt = b_grados(idx_opt);

% ## RESULTADOS ##
disp(['La inclinación óptima en San Juan es de ',num2str(inc_opt),'°']);
disp(['La irradiancia máxima acumulada es de ',num2str(irr_max),' W/m^2']);
figure;
plot(b_grados,irr_anual,'r-','LineWidth',4);
xlabel('Inclinación (°)');
ylabel('Irradiancia Total Anual (W/m^2)');
title('Inclinación Óptima de Paneles Solares');
grid on;

% INCLINACIÓN ÓPTIMA EN SAN JUAN DE 21º
% IRRADIANCIA MÁXIMA ACUMULADA DE 9720845.246 W/m^2