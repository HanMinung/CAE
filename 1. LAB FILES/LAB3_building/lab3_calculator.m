clear;

%% Experimental value

% ch1 : 2nd floor & ch2 : 1st floor
addpath('./exp_data/2조');

mode_1_fd_c1 = readmatrix('group2_mode1_freqdomain_ch1.txt');       mode_1_fd_c1 = mode_1_fd_c1(8:808,:);
mode_1_fd_c2 = readmatrix('group2_mode1_freqdomain_ch2.txt');       mode_1_fd_c2 = mode_1_fd_c2(8:808,:);

mode_1_td_c1 = readmatrix('group2_mode1_timedomain_ch1.txt');       mode_1_td_c1 = mode_1_td_c1(8:end,:);
mode_1_td_c2 = readmatrix('group2_mode1_timedomain_ch2.txt');       mode_1_td_c2 = mode_1_td_c2(8:end,:);

mode_2_fd_c1 = readmatrix('group2_mode2_freqdomain_ch1.txt');       mode_2_fd_c1 = mode_2_fd_c1(8:808,:);       
mode_2_fd_c2 = readmatrix('group2_mode2_freqdomain_ch2.txt');       mode_2_fd_c2 = mode_2_fd_c2(8:808,:);

mode_2_td_c1 = readmatrix('group2_mode2_timedomain_ch1.txt');       mode_2_td_c1 = mode_2_td_c1(8:end,:);
mode_2_td_c2 = readmatrix('group2_mode2_timedomain_ch2.txt');       mode_2_td_c2 = mode_2_td_c2(8:end,:);

% freq domain
figure(1);
plot(mode_1_fd_c1(:,1), 10.^(mode_1_fd_c1(:,2)./20.));
title("FFT of first vibration");      grid minor;       xlabel("frequency [Hz]");       ylabel("magnitude");

figure(2);
plot(mode_2_fd_c1(:,1), 10.^(mode_2_fd_c1(:,2)./20.));
title("FFT of first vibration");      grid minor;       xlabel("frequency [Hz]");       ylabel("magnitude");

% time domain
figure(3);
plot(mode_1_td_c1(:,1), mode_1_td_c1(:,2),lineWidth =2);
hold on;
plot(mode_1_td_c2(:,1), mode_1_td_c2(:,2),lineWidth =2);
grid on;    
title("first vibration");        legend("2nd floor", "1st floor", fontSize = 12);       grid minor;     xlabel("time [sec]");       ylabel("voltage [V]");
 
figure(4);
plot(mode_2_td_c1(:,1), mode_2_td_c1(:,2),lineWidth =2);
hold on;
plot(mode_2_td_c2(:,1), mode_2_td_c2(:,2),lineWidth =2);
grid on;
title("second vibration");         legend("2nd floor", "1st floor", fontSize = 12);       grid minor;     xlabel("time [sec]");       ylabel("voltage [V]");

%% Theoretical value
clear;

w = 50e-3;     t = 1.5e-3;
I = (w*t^3)/12;
E = 70e9;
l = 220e-3;

k   = 24*E*I/(l^3);     k_1 = k;     k_2 = k;   
m_1 = 1.0;      % 1st floor
m_2 = 1.37;     % 2nd floor

denom = 2*m_1*m_2;
nom_1  = m_2*k_1 + m_2*k_2 + m_1*k_2;
nom_2  = (m_2*k_1 + m_2*k_2 + m_1*k_2)^2 - 4*m_1*m_2*k_1*k_2;  
nom_2  = sqrt(nom_2);

omega_1_square = (nom_1 + nom_2)/denom;     omega_1 = sqrt(omega_1_square);
omega_2_square = (nom_1 - nom_2)/denom;     omega_2 = sqrt(omega_2_square);

reso_freq_1 = omega_1/(2*pi);
reso_freq_2 = omega_2/(2*pi);

% mode shape ratio
r_1 = (-omega_1_square*m_1 + 2*k)/k;
r_2 = (-omega_2_square*m_1 + 2*k)/k;
