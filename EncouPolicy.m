%%% energy density convert, BatPac
EnergyDensity_LFP = 180; % Wh/kg,kWh/t
EnergyDensity_NCMH = 177;
EnergyDensity_NCMM = 177;
EnergyDensity_NCML = 177;
EnergyDensity_NCA = 168;
EnergyDensity_LMO = 177;  

%%%%%%%%%%%%%% 01 完全不允许使用（baseline）
% run EncouPolicy01.m;


%%%%%%%%%%%%%% 02 部分允许（LFP）
% run EncouPolicy02.m;


%%%%%%%%%%%%%% 03 提倡最大使用，不用修改
run EncouPolicy03.m;


%%%%%%%%%% 部分使用（高SOH）%%%%% 暂时不需要

%%%%%%%%%% 部分使用（高剩余寿命）%%%%% 暂时不需要