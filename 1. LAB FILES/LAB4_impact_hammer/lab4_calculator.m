clear;

al_cant_fft = readmatrix('./exp_data/aluminium_cantilever_fft.txt');
st_cant_fft = readmatrix('./exp_data/steel_cantilever_fft.txt');
br_cant_fft = readmatrix('./exp_data/brass_cantilever_fft.txt');
st_fix_fft  = readmatrix('./exp_data/steel_fixedsupport_fft.txt');
st_damping  = readmatrix('./exp_data/steel_damping_ratio_time.txt');

freq = al_cant_fft(8:end-1, 1);
time = st_damping(8:end-1, 1);

% figure;
% plot(freq, al_cant_fft(8:end-1, 2), 'r-',lineWidth = 3);
% grid minor;     xlabel("frequency [Hz]");       ylabel("magnitude [-]");
% title("FFT result of aluminum with cantilever beam condition");     legend("Al / cantilever", fontSize = 12);
% 
% figure;
% plot(freq, st_cant_fft(8:end-1, 2), 'r-',lineWidth = 3);
% grid minor;     xlabel("frequency [Hz]");       ylabel("magnitude [-]");
% title("FFT result of steel with cantilever beam condition");     legend("st / cantilever", fontSize = 12);
% 
% figure;
% plot(freq, br_cant_fft(8:end-1, 2), 'r-',lineWidth = 3);
% grid minor;     xlabel("frequency [Hz]");       ylabel("magnitude [-]");
% title("FFT result of brass with cantilever beam condition");     legend("br / cantilever", fontSize = 12);
% 
% figure;
% plot(freq, st_fix_fft(8:end-1, 2), 'r-',lineWidth = 3);
% grid minor;     xlabel("frequency [Hz]");       ylabel("magnitude [-]");
% title("FFT result of steel with fixed boundary condition");     legend("st / fixed", fontSize = 12);

figure;
plot(time, st_damping(8:end-1, 2), 'r-',lineWidth = 2);
grid minor;     xlabel("frequency [Hz]");       ylabel("magnitude [-]");        xlim([0, 4]);
title("Time domain signal of cantilever beam");   

figure;
plot(time, st_damping(8:end-1, 2), 'r-',lineWidth = 2);
grid minor;     xlabel("Time [sec]");       ylabel("voltage [V]");        xlim([0.9, 1.8]);
title("Time domain signal of cantilever beam");     

%% Theoretical value
clear;

cant_w     =  19e-3;     % [m]
cant_t     =  3.2e-3;      % [m]
cant_l     =  600e-3;    % [m]

fix_w      =  19e-3;     % [m]
fix_t      =  3e-3;      % [m]
fix_l      =  600e-3;    % [m]

beta_cant = [1.875104, 4.694091, 7.854757, 10.995541]./cant_l;
beta_fix  = [4.720041, 7.853205, 10.995608, 14.137165]./fix_l;

% steel - brass - aluminum sequence
density   = [7850  , 8740  , 2700];    % [kg/m^3] 
E         = [200e9 , 105e9 , 70e9];    % Pa
I         = cant_w * cant_t^3/12;      % [m^4]
A         = cant_w * cant_t;           % [m^2]

% steel / cantilver condition
for Idx = 1 : 4

    % steel / cantilever
    omega_st_can(Idx) = sqrt((beta_cant(Idx)^4*E(1)*I)/(density(1)*A));
    freq_st_can(Idx)  = omega_st_can(Idx)/(2*pi);

    % brass
    omega_br(Idx) = sqrt((beta_cant(Idx)^4*E(2)*I)/(density(2)*A));
    freq_br(Idx)  = omega_br(Idx)/(2*pi);

    % aluminum
    omega_al(Idx) = sqrt((beta_cant(Idx)^4*E(3)*I)/(density(3)*A));
    freq_al(Idx)  = omega_al(Idx)/(2*pi);

    % steel / fixed
    ometa_st_fix(Idx) = sqrt((beta_fix(Idx)^4*E(1)*I)/(density(1)*A));
    freq_st_fix(Idx)  = ometa_st_fix(Idx)/(2*pi);

end


