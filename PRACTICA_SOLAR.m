% ### CARACTERIZACIÓN MÓDULO FOTOVOLTAICO ###
% ### CURVA I-V CON AJUSTE STC ###
clear; close all; clc;

% Datos iniciales para el ensayo
Gnom=1000; G_TONC=800;
Tnom=25; Tamb=22.5; T_TONC=20;

% Medidas iniciales panel 
V_PANEL = [0.024 3.2 5.1 7.42 9.23 10.89 13.80 15.8 16.8 17.5 18 18.3 18.36 18.5 18.57 18.66 18.7 18.74 18.79 18.84 18.85 18.87 18.88];
I_PANEL = [0.577 0.574 0.564 0.543 0.538 0.523 0.513 0.506 0.485 0.448 0.383 0.300 0.285 0.230 0.185 0.130 0.100 0.085 0.066 0.054 0.047 0.039 0.026];
% Medidas iniciales diodo
V_DIODO = [5.1 10.2 15.2 16 17.3 18 18.2 18.8 19.4 20.0 20.5 20.9 21.4 21.8 22.1];
I_DIODO = [0.003 0.006 0.04 0.058 0.12 0.182 0.208 0.32 0.487 0.734 0.978 1.191 1.6 1.86 2.2];

% Datos de la placa a ensayar
Ns=36; Beta=-0.002281;
VocPlaca=21.5; IccPlaca=3.1; 
Vplaca=16.7; Iplaca=3; 
Vt=25e-3; Icc=max(I_PANEL);

% Cálculo de G1 y T1
G1=Gnom*Icc/IccPlaca;
T1=Tamb+(T_TONC-20)/G_TONC*G1;

% Corrección de los datos
I_STC = I_PANEL.*(Gnom/G1);
V_STC = V_PANEL+Ns*Beta*(Tnom-T1);

% Cálculo de los valores corregidos
VocSTC=max(V_STC); 
IccSTC=max(I_STC);
VccSTC=0;  
voc=VocPlaca/(Ns*Vt);

Va_STC=V_STC(7); Ia=I_STC(7);
Vmax_STC=V_STC(9); Imax_STC=I_STC(9);
Vb_STC=V_STC(11); Ib=I_STC(11);

% Cálculo de FF y FF0
FF = Vmax_STC*Imax_STC/(VocSTC*IccSTC);
FF0 = (voc-log(voc+0.72))/(voc+1);

Rs_Teorico = (1-FF/FF0)*VocPlaca/IccPlaca;
Rs_Medido = (VocSTC-Vb_STC)/Ib;
Rp_Medido = Va_STC/(IccPlaca-Ia);

% Resumen de las resistencias
R = [Rs_Teorico Rs_Medido Rp_Medido];

% Cálculo de la pendiente y corte de la regresión lineal del diodo
ILOG_DIODO=log(I_DIODO);
p = polyfit(ILOG_DIODO, V_DIODO, 1);
m = p(1);
n = p(2);

% Representación gráfica de los datos
figure;
hold on;
plot(V_STC,I_STC,'-o');