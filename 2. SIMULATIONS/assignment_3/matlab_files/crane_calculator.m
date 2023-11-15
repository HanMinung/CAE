clear;

I_beam = struct('wl'  ,    152.78e-3 , ...
                'ws'  ,    8.001e-3  , ...
                'hl'  ,    454.66e-3 , ...
                'hs'  ,    13.335e-3 );

rect_beam = struct('wl'  ,  152.4e-3  , ...
                   'iw'  ,  4.7625e-3 );

brace     = struct('od'  ,  60.325e-3 , ...
                   'iw'  ,  3.912e-3 );

P = 100 * 1e3;                % [N]
L_ibeam = 12 * 0.3;           % [ft to m] 
L_rect  = 15 * 0.3;           % [ft to m] 
E = 200e9;                    % [pa]
M = P * L_ibeam/4;            % [Nm]

flange_b = I_beam.wl;
flange_h = I_beam.hs;
web_b = I_beam.ws;
web_h = I_beam.hl - (2 * I_beam.hs);

% Calculation of second moment of inertia

I_ibeam = I_calculator(flange_b, I_beam.hl) - I_calculator(flange_b - I_beam.ws, I_beam.hl - 2* I_beam.hs);
I_rect  = I_calculator(rect_beam.wl, rect_beam.wl) - I_calculator(rect_beam.wl - 2*rect_beam.iw, rect_beam.wl - 2*rect_beam.iw);
A_rect = rect_beam.wl^2 - (rect_beam.wl - rect_beam.iw)^2;

% max moment & max stress

M_max  = P * L_ibeam / 4;
BS_max = M_max * (I_beam.hl / 2) / I_ibeam;

% deflection of each beam

I_def = (P * L_ibeam^3)/(48 * E * I_ibeam);
R_def = (P/2 * L_rect)/(E * A_rect);
T_def = (I_def + R_def) * 1e3;             % unit : [mm]

% buckling : critical load calculation
% boundary condition : fix to free (n : 0.25)

n = 0.25; 
P_cr  = (n * pi^2 * E * I_rect)/(L_rect^2);

