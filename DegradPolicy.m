
%%%%%%%%%%%%%% Degraation Policy: retired from the power grid
%%%%%%%%%%%%%% 01 电动汽车退役电池 80%-40% SOH, 储能用新电池 100%-40% SOH
run DegradPolicy01.m;
run DegradPolicy05.m;

%%%%%%%%%%%%%% 02 电动汽车退役电池 80%-60% SOH, 储能用新电池 100%-60% SOH
% run DegradPolicy02.m;
% run DegradPolicy04.m;

%%%%%%%%%%%%% 03 电动汽车退役电池 80%-40% SOH, 储能用新电池 100%-80% SOH
% run DegradPolicy01.m;
% run DegradPolicy03.m;

%%%%%%%%%%%%%% 04 电动汽车退役电池 80%-60% SOH, 储能用新电池100%-80% SOH
% run DegradPolicy02.m;
% run DegradPolicy03.m;

%%% 保护电池最大充放电电流限制
SOH_coeff = 1;
SOH_coeff_LFP = 1;
SOH_coeff_NCMH = 1;
SOH_coeff_NCMM = 1;
SOH_coeff_NCML = 1;
SOH_coeff_NCA = 1;
SOH_coeff_LMO = 1;


