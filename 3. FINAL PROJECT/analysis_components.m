%-----------------------------------------
%   CAE FINAL PROJECT CALCULATOR          
%   TEAM     :  WITH ANSYS IM 신뢰에요     
%   SUBJECT  :  AMG MOTOR PART ANALYSIS   
%-----------------------------------------

clear;

% parameter definitions -------------------------
% 1. motor
rpm       =  2600;                                   % [rpm]
power     =  7e3;                                    % [W]  &  구동파워 : 7kW로 계산
m_motor   =  11;                                     % [kg]
w_motor   =  m_motor * 9.81;                         % [N]
d_small   =  69.12;                                  % diameter of small chain sprocket[mm]
      
          
% 2. chain sprocket           
d_large   =  220;                                    % diameter of big chain sprocket [mm]
l_diff    =  285;                                    % center - center distance between two sprockets [mm]
          
% 3. main frame          
d_frame   =  21.7;                                   % diameter of main frame [mm]
      
      
% 4. suspension part      
F_s       =  732;                                    % suspension part spring force [N]
F_tx      =  682.1;                                  % specified with x component of main force in thesis
F_ty      =  1214.2;                                 % specified with y component of main force in thesis
      
F_s_xarm  =  60;                                     % [mm]
F_s_yarm  =  36.0555;                                % [mm]
F_t_xarm  =  40;                                     % [mm]
F_t_yarm  =  44.721;                                 % [mm]
      
psi_alph  =  atan2(53.8516, 140);                    % [rad]
psi_beta  =  atan2(36.0555, 60);                     % [rad]

F_s_x     =  F_s * cos(pi/2 - psi_alph - psi_beta);  % [N]
F_s_y     =  F_s * sin(pi/2 - psi_alph - psi_beta);  % [N]

% calculation part  -----------------------------
% 1. Tension of chain
w_mot     =  2*pi*rpm/60;                            % [rad/s]
tau_mot   =  power/w_mot;                            % [Nm]
tension   =  tau_mot/(d_small*1e-3/2);               % [N]


% 2. chain  angle 
psi_chain_rad   =  atan2(d_large/2 - d_small/2, l_diff);   % [rad]
psi_chain_deg   =  rad2deg(psi_chain_rad);                 % [deg]


% 3. chain tension : horizontal & vertical component
% -  Moment will be calculated automatically in Ansys when force is applied 
%    to the shaft

T_hori    =  tension * cos(psi_chain_rad);
T_vert    =  tension * sin(psi_chain_rad);

% 4. Maximum stress calculation use / vel / impact coef
use_coef     =  1.2;
vel_coef     =  1.6;
impact_coef  =  2.0;

tension_max =  7 * tension;

Tmax_hori   =  tension_max * cos(psi_chain_rad);
Tmax_vert   =  tension_max * sin(psi_chain_rad);