% Codigo para Kr (Mansard and Funke)
% Inicio
clc; 
clear all;
% Definir el nombre del archivo
filename = 'Kr_ai_s1.csv';
cases = 91;

% Asegurarse de que el archivo est� vac�o o crear uno nuevo
if exist(filename, 'file')
    delete(filename);
end

% Escribir encabezados (opcional)
headers = {'"Kr"', '"t"'};
fid = fopen(filename, 'w');
fprintf(fid, '%s,%s\n', headers{:});
fclose(fid);

% Definir el cell array de nombres de archivos
files = {'freesurface_case1_120_time_0_to_30.txt';
         'freesurface_case1_120_time_0_to_31.txt';
         'freesurface_case1_120_time_0_to_32.txt';
         'freesurface_case1_120_time_0_to_33.txt';
         'freesurface_case1_120_time_0_to_34.txt';
         'freesurface_case1_120_time_0_to_35.txt';
         'freesurface_case1_120_time_0_to_36.txt';
         'freesurface_case1_120_time_0_to_37.txt';
         'freesurface_case1_120_time_0_to_38.txt';
         'freesurface_case1_120_time_0_to_39.txt';
         'freesurface_case1_120_time_0_to_40.txt';
         'freesurface_case1_120_time_0_to_41.txt';
         'freesurface_case1_120_time_0_to_42.txt';
         'freesurface_case1_120_time_0_to_43.txt';
         'freesurface_case1_120_time_0_to_44.txt';
         'freesurface_case1_120_time_0_to_45.txt';
         'freesurface_case1_120_time_0_to_46.txt';
         'freesurface_case1_120_time_0_to_47.txt';
         'freesurface_case1_120_time_0_to_48.txt';
         'freesurface_case1_120_time_0_to_49.txt';
         'freesurface_case1_120_time_0_to_50.txt';
         'freesurface_case1_120_time_0_to_51.txt';
         'freesurface_case1_120_time_0_to_52.txt';
         'freesurface_case1_120_time_0_to_53.txt';
         'freesurface_case1_120_time_0_to_54.txt';
         'freesurface_case1_120_time_0_to_55.txt';
         'freesurface_case1_120_time_0_to_56.txt';
         'freesurface_case1_120_time_0_to_57.txt';
         'freesurface_case1_120_time_0_to_58.txt';
         'freesurface_case1_120_time_0_to_59.txt';
         'freesurface_case1_120_time_0_to_60.txt';
         'freesurface_case1_120_time_0_to_61.txt';
         'freesurface_case1_120_time_0_to_62.txt';
         'freesurface_case1_120_time_0_to_63.txt';
         'freesurface_case1_120_time_0_to_64.txt';
         'freesurface_case1_120_time_0_to_65.txt';
         'freesurface_case1_120_time_0_to_66.txt';
         'freesurface_case1_120_time_0_to_67.txt';
         'freesurface_case1_120_time_0_to_68.txt';
         'freesurface_case1_120_time_0_to_69.txt';
         'freesurface_case1_120_time_0_to_70.txt';
         'freesurface_case1_120_time_0_to_71.txt';
         'freesurface_case1_120_time_0_to_72.txt';
         'freesurface_case1_120_time_0_to_73.txt';
         'freesurface_case1_120_time_0_to_74.txt';
         'freesurface_case1_120_time_0_to_75.txt';
         'freesurface_case1_120_time_0_to_76.txt';
         'freesurface_case1_120_time_0_to_77.txt';
         'freesurface_case1_120_time_0_to_78.txt';
         'freesurface_case1_120_time_0_to_79.txt';
         'freesurface_case1_120_time_0_to_80.txt';
         'freesurface_case1_120_time_0_to_81.txt';
         'freesurface_case1_120_time_0_to_82.txt';
         'freesurface_case1_120_time_0_to_83.txt';
         'freesurface_case1_120_time_0_to_84.txt';
         'freesurface_case1_120_time_0_to_85.txt';
         'freesurface_case1_120_time_0_to_86.txt';
         'freesurface_case1_120_time_0_to_87.txt';
         'freesurface_case1_120_time_0_to_88.txt';
         'freesurface_case1_120_time_0_to_89.txt';
         'freesurface_case1_120_time_0_to_90.txt';
         'freesurface_case1_120_time_0_to_91.txt';
         'freesurface_case1_120_time_0_to_92.txt';
         'freesurface_case1_120_time_0_to_93.txt';
         'freesurface_case1_120_time_0_to_94.txt';
         'freesurface_case1_120_time_0_to_95.txt';
         'freesurface_case1_120_time_0_to_96.txt';
         'freesurface_case1_120_time_0_to_97.txt';
         'freesurface_case1_120_time_0_to_98.txt';
         'freesurface_case1_120_time_0_to_99.txt';
         'freesurface_case1_120_time_0_to_100.txt';
         'freesurface_case1_120_time_0_to_101.txt';
         'freesurface_case1_120_time_0_to_102.txt';
         'freesurface_case1_120_time_0_to_103.txt';
         'freesurface_case1_120_time_0_to_104.txt';
         'freesurface_case1_120_time_0_to_105.txt';
         'freesurface_case1_120_time_0_to_106.txt';
         'freesurface_case1_120_time_0_to_107.txt';
         'freesurface_case1_120_time_0_to_108.txt';
         'freesurface_case1_120_time_0_to_109.txt';
         'freesurface_case1_120_time_0_to_110.txt';
         'freesurface_case1_120_time_0_to_111.txt';
         'freesurface_case1_120_time_0_to_112.txt';
         'freesurface_case1_120_time_0_to_113.txt';
         'freesurface_case1_120_time_0_to_114.txt';
         'freesurface_case1_120_time_0_to_115.txt';
         'freesurface_case1_120_time_0_to_116.txt';
         'freesurface_case1_120_time_0_to_117.txt';
         'freesurface_case1_120_time_0_to_118.txt';
         'freesurface_case1_120_time_0_to_119.txt';
         'freesurface_case1_120.txt'};

a = 30:1:120 


for cas=1:cases

%Datos
% WAVE  = load([files(cas)]);
WAVE = readmatrix(files{cas});

% Test information
X1P = [0, 0.07549, 0.15098]    ; % Distance between the probe P and 1 [m]    [CCCCCCC]
D   = 0.3            ; % Water depth [m]
TP  = 0.7              ; % Wave period [s] CAMBIA SEGUN LOS DATOS
LN  = A2wave_itr( D,TP ) ; % Wavelength [m]
W   = 2*pi/TP            ; % Circular frequency [rad/s]

%tiempo (s)
TIME = WAVE(:,4);

%Elevaci�n (m)
ELEV  = [WAVE(:,1),WAVE(:,2),WAVE(:,3)]  ;

% Par�metro para el dominio del tiempo
DT = TIME(10)-TIME(9) ; % Tasa de muestreo [s]
FS = 1/DT             ; % Frecuencia de muestreo [Hz]

% Extraer onda compuesta (co-wave)
TS = 20   ; % TS = Punto de inicio

% Inicio Elevaci�n
for j = 1:3
    COWV(:,j) = ELEV(ceil(TS*FS):end,j);
end

% Inicio Tiempo
TC = TIME(ceil(TS*FS):end)   ; % vector de tiempo
T  = TC-TC(1)                ; % vector de tiempo (com�n)

% An�lisis de espectros
% Paso 1 y 2 (Mansard and Funke)
for j = 1:3
    [ AXX(:,j),SXX(:,j),APH(:,j),FA(:,j),HMO(j), HMO2(:,j) ]...
        = A3autospec( T,COWV(:,j) );
end

% Paso 3 y 4 (Mansard and Funke)
for j = 1:3
    [ AXY(:,j),SXY(:,j),XPH(:,j),FX(:,j) ]...
        = A4crosspec( T,COWV(:,1),COWV(:,j) );
end

% Paso 5 y 6 (Mansard and Funke)
for j = 1:3
    B(:,j) = HMO2(:,j).*cos(XPH(:,j)) + 1i*HMO2(:,j).*sin(XPH(:,j));
end 

% Paso 7 (Mansard and Funke)
Bk = 2*pi*X1P(1,2)/LN; 
Yk = 2*pi*X1P(1,3)/LN;

% Paso 8 (Mansard and Funke)
Dk = 2*(sin(Bk)^2 + sin(Yk)^2 + sin(Yk-Bk)^2)  ;
R1k = sin(Bk)^2 + sin(Yk)^2                    ;
Q1k = sin(Bk)*cos(Bk) + sin(Yk)*cos(Yk)        ;
R2k = sin(Yk) * sin(Yk-Bk)                     ;
Q2k = sin(Yk) * cos(Yk-Bk) - 2*sin(Bk)         ;
R3k = -sin(Bk) * sin(Yk-Bk)                    ;
Q3k = sin(Bk)*cos(Yk-Bk) - 2*sin(Yk)           ;

% Paso 9 (Mansard and Funke)
ZIk = 1/Dk *(B(:,1)*(R1k+1i*Q1k)+B(:,2)*(R2k+1i*Q2k)+B(:,3)*(R3k+1i*Q3k));
ZRk = 1/Dk *(B(:,1)*(R1k-1i*Q1k)+B(:,2)*(R2k-1i*Q2k)+B(:,3)*(R3k-1i*Q3k));
ABSZIk = abs(ZIk);
ABSZRk = abs(ZRk);

% Paso 10 (Mansard and Funke)
DF = FA(2,1)-FA(1,1);
NSI = (ABSZIk.^2)/(2*DF);
NSR = (ABSZRk.^2)/(2*DF);

% Paso 11 (Mansard and Funke)
KR = ABSZRk./ABSZIk;

% Paso 12 (Mansard and Funke)
CF12 = SXY(:,2)./sqrt(SXX(:,1).*SXX(:,2));
CF13 = SXY(:,3)./sqrt(SXX(:,1).*SXX(:,3));

% Altura de la ola incidente y reflejada
NS = 16;
HI = 4*sqrt(sum(NSI(NS:end))*DF)
HR = 4*sqrt(sum(NSR(NS:end))*DF)        % Para una se�al SIN Ruido (Ideal)
% HR = 2.27*sqrt(sum(NSR(NS:end))*DF)     % Para una se�al CON Ruido (Real)

% Coeficiente de reflexi�n
KR2 = (HR/HI)*100

% A�adir estos datos al archivo CSV
    dlmwrite(filename, [KR2,a(cas)], '-append');

% Arreglar la parte de los graficos si se puede (VER)
% Display of reflection analysis
% Titles of the plots
TT1 = ['Espectros medidos of'];
TT2 = ['Espectros calculados'];

% Lables of the Hmo
ML1 = ['P1: H_{mo1} = ',num2str(round(HMO(1)*1000)/1000),' m'];
ML2 = ['P2: H_{mo2} = ',num2str(round(HMO(2)*1000)/1000),' m'];
ML3 = ['P3: H_{mo3} = ',num2str(round(HMO(3)*1000)/1000),' m'];

% Lables of HI, HR, and KR
MLI  = ['S_I: H_{I} = ',num2str(round(HI*1000)/1000),' m'];
MLR  = ['S_R: H_{R} = ',num2str(round(HR*1000)/1000),' m'];
MLKR = ['K_R = ',num2str(round(HR/HI*10000)/100),' %'];

% Plot 1: Measured spectra
figure (1)
for j = 1:3
    plot(FA(:,j),(AXX(:,j)*4));
    hold on
end

xlim([1,2]);
ylim([0,0.05]);
xlabel('f [Hz]');
ylabel('S_{\eta\eta} [m^2/Hz]');
legend(num2str(ML1),num2str(ML2),num2str(ML3));
title(num2str(TT1));
hold off
grid on
pbaspect([1 1 1]) % Equal axis lengths in all directions

% Plot 2: Computed spectra
figure(2)
% Spectra of HI and HR
yyaxis left % y-axis of HI and HR
title(num2str(TT2));
plot(FA(:,1),(NSI(:,1)*10));
hold on
plot(FA(:,1),(NSR(:,1)*10));
xlim([1,1.4]);
ylim([0,0.05]);
xlabel('f [Hz]');
ylabel('S_{\eta\eta} [m^2/Hz]');

% Spectrum of KR
yyaxis right % y-axis of KR
plot(FA(:,1),KR*100,'-.');
xlim([1,2]);
ylim([0,60]);
ylabel('K_R [%]');
legend(num2str(MLI),num2str(MLR),num2str(MLKR));
hold off
grid on
pbaspect([1 1 1]) % Equal axis lengths in all directions

clear WAVE COWV AXX SXX APH FA HMO HMO2 AXY SXY XPH FX B
end

