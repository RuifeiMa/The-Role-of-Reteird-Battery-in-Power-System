%%%%%%%%%% battery capacity loss
%%%%%%%%%% capacity loss per cycle
load battery_temperature.mat;
load P_BESS;
prov_year_LFP_0 = 15; % LFP base use year
prov_caploss_rate = zeros(length(prov_temp),1);
prov_calend_caploss_rate = zeros(length(prov_temp),1);
for i = 1:length(prov_temp)
    prov_caploss_rate(i,1) = interp1(x_temp,y_caploss,prov_temp(i),'linear')*0.01/(8.59*10^(-6));
    prov_calend_caploss_rate(i,1) = interp1(x_temp_calend,y_caploss_calend,prov_temp(i),'linear')*0.01*24*365; % per hour*24*365 = a year
    for j = 1:length(LFP_Cycle)
        prov_cycle_LFP(i,j) = LFP_Cycle(j,1)/prov_caploss_rate(i,1);
        %         prov_year2_LFP(i,1) = prov_year_LFP_0/prov_caploss(i,1);
    end
end
%%%%%%%%%% LFP battery

LFP_SOH_cumu_100_80 = zeros(length(prov_temp),1);
LFP_SOH_cumu_100_60 = zeros(length(prov_temp),1);
LFP_SOH_cumu_100_40 = zeros(length(prov_temp),1);
LFP_SOH_cumu_80_60 = zeros(length(prov_temp),1);
LFP_SOH_cumu_80_40 = zeros(length(prov_temp),1);
LFP_SOH_cumu0_100_80 = 0; % capacity cumulative value
LFP_SOH_cumu0_100_60 = 0;
LFP_SOH_cumu0_100_40 = 0;
LFP_SOH_cumu0_80_60 = 0;
LFP_SOH_cumu0_80_40 = 0;
RTE_LFP_cumu_100_80 = 0; % RTE: round-trip efficiency
RTE_LFP_cumu_100_60 = 0;
RTE_LFP_cumu_100_40 = 0;
RTE_LFP_cumu_80_60 = 0;
RTE_LFP_cumu_80_40 = 0;
SOH0_cumu_NCM = 0;
for i = 1:length(prov_temp)
    for k = 1:6000
        cycle = k;
        prov_cyclei = prov_cycle_LFP(i,:)';
        if cycle<=4.09634e+03
            SOH(i,1) = interp1(prov_cyclei,LFP_SOH,cycle,'linear')*0.01;
            SOH0 = interp1(LFP_Cycle,LFP_SOH,cycle,'linear')*0.01;
        else
            SOH(i,1) = interp1(prov_cyclei,LFP_SOH,cycle,'linear')*0.01; %
            %             SOH(i,1) = (-3.158e-10*cycle^3+1.808e-6*cycle^2-0.01267*cycle+98.82)*0.01;
            SOH0 = (-3.158e-10*cycle^3+1.808e-6*cycle^2-0.01267*cycle+98.82)*0.01;
        end
        if SOH(i,1) >= 0.8 % 100-80% SOH
            LFP_SOH_cumu_100_80(i,1) = LFP_SOH_cumu_100_80(i,1) +SOH(i,1);
            N_LFP_100_80(i,1) = cycle;
        end
        if SOH(i,1) >= 0.6 % 100-60% SOH
            LFP_SOH_cumu_100_60(i,1) = LFP_SOH_cumu_100_60(i,1) +SOH(i,1);
            N_LFP_100_60(i,1) = cycle;
        end
        if SOH(i,1) >= 0.4 % 100-40% SOH
            LFP_SOH_cumu_100_40(i,1) = LFP_SOH_cumu_100_40(i,1) +SOH(i,1);
            N_LFP_100_40(i,1) = cycle;
        end
        if SOH(i,1) <= 0.8 && SOH(i,1) >= 0.6 % 80%-60% SOH
            LFP_SOH_cumu_80_60(i,1) = LFP_SOH_cumu_80_60(i,1) +SOH(i,1);
            N_LFP_80_60(i,1) = cycle*power_energy_rate;
        end
        if SOH(i,1) <= 0.8 && SOH(i,1) >= 0.4 % 80%-40% SOH
            LFP_SOH_cumu_80_40(i,1) = LFP_SOH_cumu_80_40(i,1) +SOH(i,1);
            N_LFP_80_40(i,1) = cycle*power_energy_rate;
        end
        if i == 1
            RTE_LFP = -0.1532*(1-SOH0)^2 + 0.003923*(1-SOH0) + 0.9530;
            if SOH0 >= 0.8 % 100-80% SOH base
                LFP_SOH_cumu0_100_80 = LFP_SOH_cumu0_100_80 +SOH0;
                RTE_LFP_cumu_100_80 = RTE_LFP_cumu_100_80 + SOH0*RTE_LFP;
                LFP_SOH_cumu0_100_80_base = cycle;
            end
            if SOH0 >= 0.6 % 100-60% SOH base
                LFP_SOH_cumu0_100_60 = LFP_SOH_cumu0_100_60 +SOH0;
                RTE_LFP_cumu_100_60 = RTE_LFP_cumu_100_60 + SOH0*RTE_LFP;
                LFP_SOH_cumu0_100_60_base = cycle;
            end
            if SOH0 >= 0.4 % 100-40% SOH base
                LFP_SOH_cumu0_100_40 = LFP_SOH_cumu0_100_40 +SOH0;
                RTE_LFP_cumu_100_40 = RTE_LFP_cumu_100_40 + SOH0*RTE_LFP;
                LFP_SOH_cumu0_100_40_base = cycle;
            end
            if SOH0 <= 0.8 && SOH0 >= 0.6 % 80-60% SOH base
                LFP_SOH_cumu0_80_60 = LFP_SOH_cumu0_80_60 +SOH0;
                RTE_LFP_cumu_80_60 = RTE_LFP_cumu_80_60 + SOH0*RTE_LFP;
                LFP_SOH_cumu0_80_60_base = cycle;
            end
            if SOH0 <= 0.8 && SOH0 >= 0.4 % 80-40% SOH base
                LFP_SOH_cumu0_80_40 = LFP_SOH_cumu0_80_40 +SOH0;
                RTE_LFP_cumu_80_40 = RTE_LFP_cumu_80_40 + SOH0*RTE_LFP;
                LFP_SOH_cumu0_80_40_base = cycle;
            end
            %%%%%%%%% NCM base capacity cumulative value calculation
            SOH0_NCM = interp1(NCM_Cycle,NCM_SOH,cycle,'linear')*0.01;
            if SOH0_NCM >= 0.8
                SOH0_cumu_NCM = SOH0_cumu_NCM+SOH0_NCM;
            end
        end
    end
    %%%%%%%%%% use year
    prov_year_LFP_100_80(i,1) = LFP_SOH_cumu_100_80(i,1)/LFP_SOH_cumu0_100_80*prov_year_LFP_0;
    prov_year_LFP_100_60(i,1) = LFP_SOH_cumu_100_60(i,1)/LFP_SOH_cumu0_100_80*prov_year_LFP_0;
    prov_year_LFP_100_40(i,1) = LFP_SOH_cumu_100_40(i,1)/LFP_SOH_cumu0_100_80*prov_year_LFP_0;
    prov_year_LFP_80_60(i,1) = LFP_SOH_cumu_80_60(i,1)/LFP_SOH_cumu0_100_80*prov_year_LFP_0*power_energy_rate;
    prov_year_LFP_80_40(i,1) = LFP_SOH_cumu_80_40(i,1)/LFP_SOH_cumu0_100_80*prov_year_LFP_0*power_energy_rate;
    RTE_LFP_100_80 = RTE_LFP_cumu_100_80/LFP_SOH_cumu0_100_80;
    RTE_LFP_100_60 = RTE_LFP_cumu_100_60/LFP_SOH_cumu0_100_60;
    RTE_LFP_100_40 = RTE_LFP_cumu_100_40/LFP_SOH_cumu0_100_40;
    RTE_LFP_80_60 = RTE_LFP_cumu_80_60/LFP_SOH_cumu0_80_60;
    RTE_LFP_80_40 = RTE_LFP_cumu_80_40/LFP_SOH_cumu0_80_40;
    %     prov_year4_LFP(i,1) = prov_cycle2(i,1)/pro_cycle(i,1); % 按cycle和按吞吐量计算出来的折算的年数一样
    prov_year_NCM_0 = SOH0_cumu_NCM/LFP_SOH_cumu0_100_80*15; % NCM base use year
end
SOH_coeff_LFP_100_80 = LFP_SOH_cumu0_100_80/LFP_SOH_cumu0_100_80_base;
SOH_coeff_LFP_100_60 = LFP_SOH_cumu0_100_60/LFP_SOH_cumu0_100_60_base;
SOH_coeff_LFP_100_40 = LFP_SOH_cumu0_100_40/LFP_SOH_cumu0_100_40_base;
SOH_coeff_LFP_80_60 = LFP_SOH_cumu0_80_60/(LFP_SOH_cumu0_80_60_base-LFP_SOH_cumu0_100_80_base);
SOH_coeff_LFP_80_40 = LFP_SOH_cumu0_80_40/(LFP_SOH_cumu0_80_40_base-LFP_SOH_cumu0_100_80_base);
%%%%%%%%%% NCA battery
prov_year_NCA_0 = prov_year_LFP_0;
prov_year_NCA_100_80 = prov_year_LFP_100_80;
prov_year_NCA_100_60 = prov_year_LFP_100_60;
prov_year_NCA_100_40 = prov_year_LFP_100_40;
prov_year_NCA_80_60 = prov_year_LFP_80_60;
prov_year_NCA_80_40 = prov_year_LFP_80_40;
RTE_NCA_100_80 = RTE_LFP_100_80;
RTE_NCA_100_60 = RTE_LFP_100_60;
RTE_NCA_100_40 = RTE_LFP_100_40;
RTE_NCA_80_60 = RTE_LFP_80_60;
RTE_NCA_80_40 = RTE_LFP_80_40;
N_NCA_100_80 = N_LFP_100_80;
N_NCA_100_60 = N_LFP_100_60;
N_NCA_100_40 = N_LFP_100_40;
N_NCA_80_60 = N_LFP_80_60;
N_NCA_80_40 = N_LFP_80_40;
SOH_coeff_NCA_100_80 = SOH_coeff_LFP_100_80;
SOH_coeff_NCA_100_60 = SOH_coeff_LFP_100_60;
SOH_coeff_NCA_100_40 = SOH_coeff_LFP_100_40;
SOH_coeff_NCA_80_60 = SOH_coeff_LFP_80_60;
SOH_coeff_NCA_80_40 = SOH_coeff_LFP_80_40;

for i = 1:length(prov_temp)
    for j = 1:length(NCM_Cycle)
        prov_cycle_NCM(i,j) = NCM_Cycle(j,1)/prov_caploss_rate(i,1);
    end
end
%%%%%%%%%% NCM battery
%%%%%%%%%% capacity cumulative value
NCM_SOH_cumu_100_80 = zeros(length(prov_temp),1);
NCM_SOH_cumu_100_60 = zeros(length(prov_temp),1);
NCM_SOH_cumu_100_40 = zeros(length(prov_temp),1);
NCM_SOH_cumu_80_60 = zeros(length(prov_temp),1);
NCM_SOH_cumu_80_40 = zeros(length(prov_temp),1);
NCM_SOH_cumu0_100_80 = 0;
NCM_SOH_cumu0_100_60 = 0;
NCM_SOH_cumu0_100_40 = 0;
NCM_SOH_cumu0_80_60 = 0;
NCM_SOH_cumu0_80_40 = 0;
RTE_NCM_cumu_100_80 = 0; % RTE: round-trip efficiency
RTE_NCM_cumu_100_60 = 0;
RTE_NCM_cumu_100_40 = 0;
RTE_NCM_cumu_80_60 = 0;
RTE_NCM_cumu_80_40 = 0;
for i = 1:length(prov_temp)
    for k = 1:3000
        cycle = k;
        prov_cyclei = prov_cycle_NCM(i,:)';
        if cycle<=4.09634e+03
            SOH(i,1) = interp1(prov_cyclei,NCM_SOH,cycle,'linear')*0.01;
            SOH0 = interp1(NCM_Cycle,NCM_SOH,cycle,'linear')*0.01;
        else
            SOH(i,1) = interp1(prov_cyclei,NCM_SOH,cycle,'linear')*0.01; %
            %             SOH(i,1) = (-3.158e-10*cycle^3+1.808e-6*cycle^2-0.01267*cycle+98.82)*0.01;
            SOH0 = (-3.158e-10*cycle^3+1.808e-6*cycle^2-0.01267*cycle+98.82)*0.01;
        end
        if SOH(i,1) >= 0.8 % 100-80% SOH
            NCM_SOH_cumu_100_80(i,1) = NCM_SOH_cumu_100_80(i,1) +SOH(i,1);
            N_NCM_100_80(i,1) = cycle;
        end
        if SOH(i,1) >= 0.6 % 100-60% SOH
            NCM_SOH_cumu_100_60(i,1) = NCM_SOH_cumu_100_60(i,1) +SOH(i,1);
            N_NCM_100_60(i,1) = cycle;
        end
        if SOH(i,1) >= 0.4 % 100-40% SOH
            NCM_SOH_cumu_100_40(i,1) = NCM_SOH_cumu_100_40(i,1) +SOH(i,1);
            N_NCM_100_40(i,1) = cycle;
        end
        if SOH(i,1) <= 0.8 && SOH(i,1) >= 0.6 % 80%-60% SOH
            NCM_SOH_cumu_80_60(i,1) = NCM_SOH_cumu_80_60(i,1) +SOH(i,1);
            N_NCM_80_60(i,1) = cycle*power_energy_rate;
        end
        if SOH(i,1) <= 0.8 && SOH(i,1) >= 0.4 % 80%-40% SOH
            NCM_SOH_cumu_80_40(i,1) = NCM_SOH_cumu_80_40(i,1) +SOH(i,1);
            N_NCM_80_40(i,1) = cycle*power_energy_rate;
        end
        if i == 1
            RTE_NCM = (-0.2303*(1 - SOH0) + 0.9582);
            if SOH0 >= 0.8 % 100-80% SOH base
                NCM_SOH_cumu0_100_80 = NCM_SOH_cumu0_100_80 +SOH0;
                RTE_NCM_cumu_100_80 = RTE_NCM_cumu_100_80 + SOH0*RTE_NCM;
                NCM_SOH_cumu0_100_80_base = cycle;
            end
            if SOH0 >= 0.6 % 100-60% SOH base
                NCM_SOH_cumu0_100_60 = NCM_SOH_cumu0_100_60 +SOH0;
                RTE_NCM_cumu_100_60 = RTE_NCM_cumu_100_60 + SOH0*RTE_NCM;
                NCM_SOH_cumu0_100_60_base = cycle;
            end
            if SOH0 >= 0.4 % 100-40% SOH base
                NCM_SOH_cumu0_100_40 = NCM_SOH_cumu0_100_40 +SOH0;
                RTE_NCM_cumu_100_40 = RTE_NCM_cumu_100_40 + SOH0*RTE_NCM;
                NCM_SOH_cumu0_100_40_base = cycle;
            end
            if SOH0 <= 0.8 && SOH0 >= 0.6 % 80-60% SOH base
                NCM_SOH_cumu0_80_60 = NCM_SOH_cumu0_80_60 +SOH0;
                RTE_NCM_cumu_80_60 = RTE_NCM_cumu_80_60 + SOH0*RTE_NCM;
                NCM_SOH_cumu0_80_60_base = cycle;
            end
            if SOH0 <= 0.8 && SOH0 >= 0.4 % 80-40% SOH base
                NCM_SOH_cumu0_80_40 = NCM_SOH_cumu0_80_40 +SOH0;
                RTE_NCM_cumu_80_40 = RTE_NCM_cumu_80_40 + SOH0*RTE_LFP;
                NCM_SOH_cumu0_80_40_base = cycle;
            end
        end
    end
    %%%%%%%%%% use year
    prov_year_NCM_100_80(i,1) = NCM_SOH_cumu_100_80(i,1)/NCM_SOH_cumu0_100_80*prov_year_NCM_0;
    prov_year_NCM_100_60(i,1) = NCM_SOH_cumu_100_60(i,1)/NCM_SOH_cumu0_100_80*prov_year_NCM_0;
    prov_year_NCM_100_40(i,1) = NCM_SOH_cumu_100_40(i,1)/NCM_SOH_cumu0_100_80*prov_year_NCM_0;
    prov_year_NCM_80_60(i,1) = NCM_SOH_cumu_80_60(i,1)/NCM_SOH_cumu0_100_80*prov_year_NCM_0*power_energy_rate;
    prov_year_NCM_80_40(i,1) = NCM_SOH_cumu_80_40(i,1)/NCM_SOH_cumu0_100_80*prov_year_NCM_0*power_energy_rate;
    RTE_NCM_100_80 = RTE_NCM_cumu_100_80/NCM_SOH_cumu0_100_80;
    RTE_NCM_100_60 = RTE_NCM_cumu_100_60/NCM_SOH_cumu0_100_60;
    RTE_NCM_100_40 = RTE_NCM_cumu_100_40/NCM_SOH_cumu0_100_40;
    RTE_NCM_80_60 = RTE_NCM_cumu_80_60/NCM_SOH_cumu0_80_60;
    RTE_NCM_80_40 = RTE_NCM_cumu_80_40/NCM_SOH_cumu0_80_40;
end
SOH_coeff_NCM_100_80 = NCM_SOH_cumu0_100_80/NCM_SOH_cumu0_100_80_base;
SOH_coeff_NCM_100_60 = NCM_SOH_cumu0_100_60/NCM_SOH_cumu0_100_60_base;
SOH_coeff_NCM_100_40 = NCM_SOH_cumu0_100_40/NCM_SOH_cumu0_100_40_base;
SOH_coeff_NCM_80_60 = NCM_SOH_cumu0_80_60/(NCM_SOH_cumu0_80_60_base-NCM_SOH_cumu0_100_80_base);
SOH_coeff_NCM_80_40 = NCM_SOH_cumu0_80_40/(NCM_SOH_cumu0_80_40_base-NCM_SOH_cumu0_100_80_base);
%%%%%%%%%% LMO battery
prov_year_LMO_0 = prov_year_NCM_0;
prov_year_LMO_100_80 = prov_year_NCM_100_80;
prov_year_LMO_100_60 = prov_year_NCM_100_60;
prov_year_LMO_100_40 = prov_year_NCM_100_40;
prov_year_LMO_80_60 = prov_year_NCM_80_60;
prov_year_LMO_80_40 = prov_year_NCM_80_40;
RTE_LMO_100_80 = RTE_NCM_100_80;
RTE_LMO_100_60 = RTE_NCM_100_60;
RTE_LMO_100_40 = RTE_NCM_100_40;
RTE_LMO_80_60 = RTE_NCM_80_60;
RTE_LMO_80_40 = RTE_NCM_80_40;
N_LMO_100_80 = N_NCM_100_80;
N_LMO_100_60 = N_NCM_100_60;
N_LMO_100_40 = N_NCM_100_40;
N_LMO_80_60 = N_NCM_80_60;
N_LMO_80_40 = N_NCM_80_40;
SOH_coeff_LMO_100_80 = SOH_coeff_NCM_100_80;
SOH_coeff_LMO_100_60 = SOH_coeff_NCM_100_60;
SOH_coeff_LMO_100_40 = SOH_coeff_NCM_100_40;
SOH_coeff_LMO_80_60 = SOH_coeff_NCM_80_60;
SOH_coeff_LMO_80_40 = SOH_coeff_NCM_80_40;

save('SLB_year.mat', 'power_energy_rate','prov_year_LFP_0', 'prov_year_LFP_100_40', 'prov_year_LFP_100_60','prov_year_LFP_100_80','prov_year_LFP_80_40','prov_year_LFP_80_60',...
    'prov_year_NCM_0','prov_year_NCM_100_40', 'prov_year_NCM_100_60','prov_year_NCM_100_80','prov_year_NCM_80_40','prov_year_NCM_80_60', ...
    'prov_year_NCA_0','prov_year_NCA_100_40', 'prov_year_NCA_100_60','prov_year_NCA_100_80','prov_year_NCA_80_40','prov_year_NCA_80_60',...
    'prov_year_LMO_0', 'prov_year_LMO_100_40', 'prov_year_LMO_100_60','prov_year_LMO_100_80','prov_year_LMO_80_40','prov_year_LMO_80_60');
save('SLB_RTE.mat', 'RTE_LFP_100_40', 'RTE_LFP_100_60','RTE_LFP_100_80','RTE_LFP_80_40','RTE_LFP_80_60',...
    'RTE_NCM_100_40', 'RTE_NCM_100_60','RTE_NCM_100_80','RTE_NCM_80_40','RTE_NCM_80_60', ...
    'RTE_NCA_100_40', 'RTE_NCA_100_60','RTE_NCA_100_80','RTE_NCA_80_40','RTE_NCA_80_60',...
    'RTE_LMO_100_40', 'RTE_LMO_100_60','RTE_LMO_100_80','RTE_LMO_80_40','RTE_LMO_80_60','prov_calend_caploss_rate','prov_caploss_rate');
save('SLB_N.mat', 'N_LFP_100_40', 'N_LFP_100_60','N_LFP_100_80','N_LFP_80_40','N_LFP_80_60',...
    'N_NCM_100_40', 'N_NCM_100_60','N_NCM_100_80','N_NCM_80_40','N_NCM_80_60', ...
    'N_NCA_100_40', 'N_NCA_100_60','N_NCA_100_80','N_NCA_80_40','N_NCA_80_60',...
    'N_LMO_100_40', 'N_LMO_100_60','N_LMO_100_80','N_LMO_80_40','N_LMO_80_60');
save('SOH_coeff.mat', 'SOH_coeff_LFP_100_40', 'SOH_coeff_LFP_100_60','SOH_coeff_LFP_100_80','SOH_coeff_LFP_80_40','SOH_coeff_LFP_80_60',...
    'SOH_coeff_NCM_100_40', 'SOH_coeff_NCM_100_60','SOH_coeff_NCM_100_80','SOH_coeff_NCM_80_40','SOH_coeff_NCM_80_60', ...
    'SOH_coeff_NCA_100_40', 'SOH_coeff_NCA_100_60','SOH_coeff_NCA_100_80','SOH_coeff_NCA_80_40','SOH_coeff_NCA_80_60',...
    'SOH_coeff_LMO_100_40', 'SOH_coeff_LMO_100_60','SOH_coeff_LMO_100_80','SOH_coeff_LMO_80_40','SOH_coeff_LMO_80_60');