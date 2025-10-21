%%%%%%% maitenance cost calculation
cost_fom_es = zeros(31,stage,1);
cost_fom_SLB_LFP = zeros(31,stage,1);
cost_fom_SLB_NCMH = zeros(31,stage,1);
cost_fom_SLB_NCMM = zeros(31,stage,1);
cost_fom_SLB_NCML= zeros(31,stage,1);
cost_fom_SLB_NCA = zeros(31,stage,1);
cost_fom_SLB_LMO = zeros(31,stage,1);

%%% basic variables
C_P_OM = 10;
C_E_OM = 3/1000;

Cap_nom_P_es=ones(province_num,stage,1);
Cap_nom_P_LFP=ones(province_num,stage,1);
Cap_nom_P_NCMH=ones(province_num,stage,1);
Cap_nom_P_NCMM=ones(province_num,stage,1);
Cap_nom_P_NCML=ones(province_num,stage,1);
Cap_nom_P_NCA=ones(province_num,stage,1);
Cap_nom_P_LMO=ones(province_num,stage,1);

Cap_nom_E_es=ones(province_num,stage,1);
Cap_nom_E_LFP=ones(province_num,stage,1);
Cap_nom_E_NCMH=ones(province_num,stage,1);
Cap_nom_E_NCMM=ones(province_num,stage,1);
Cap_nom_E_NCML=ones(province_num,stage,1);
Cap_nom_E_NCA=ones(province_num,stage,1);
Cap_nom_E_LMO=ones(province_num,stage,1);
% Cap_nom_P_es=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_LFP=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_NCMH=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_NCMM=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_NCML=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_NCA=sdpvar(province_num,stage,1,'full');
% Cap_nom_P_LMO=sdpvar(province_num,stage,1,'full');
% 
% Cap_nom_E_es=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_LFP=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_NCMH=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_NCMM=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_NCML=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_NCA=sdpvar(province_num,stage,1,'full');
% Cap_nom_E_LMO=sdpvar(province_num,stage,1,'full');
% 
% for s = 1:stage
%     for prv = 1:province_num
%         C_ESS = [C_ESS,
%             Cap_nom_P_es(prv,s,1) == I_es(prv,s,1),
%             Cap_nom_P_LFP(prv,s,1) == I_SLB_LFP(prv,s,1),
%             Cap_nom_P_NCMH(prv,s,1) == I_SLB_NCMH(prv,s,1),
%             Cap_nom_P_NCMM(prv,s,1) == I_SLB_NCMM(prv,s,1)
%             Cap_nom_P_NCML(prv,s,1) == I_SLB_NCML(prv,s,1),
%             Cap_nom_P_NCA(prv,s,1) == I_SLB_NCA(prv,s,1),
%             Cap_nom_P_LMO(prv,s,1) == I_SLB_LMO(prv,s,1),
%             
%             Cap_nom_E_es(prv,s,1) == I_es(prv,s,1),
%             Cap_nom_E_LFP(prv,s,1) == I_SLB_LFP(prv,s,1),
%             Cap_nom_E_NCMH(prv,s,1) == I_SLB_NCMH(prv,s,1),
%             Cap_nom_E_NCMM(prv,s,1) == I_SLB_NCMM(prv,s,1),
%             Cap_nom_E_NCML(prv,s,1) == I_SLB_NCML(prv,s,1),
%             Cap_nom_E_NCA(prv,s,1) == I_SLB_NCA(prv,s,1),
%             Cap_nom_E_LMO(prv,s,1) == I_SLB_LMO(prv,s,1),
%             ];
%     end
% end

Cyc_pa_es = N_es./prov_year_es; %%%%%%%%%%%%?
Cyc_pa_LFP = N_LFP./prov_year_LFP*power_energy_rate;
Cyc_pa_NCMH = N_NCMH./prov_year_NCMH*power_energy_rate;
Cyc_pa_NCMM = N_NCMM./prov_year_NCMM*power_energy_rate;
Cyc_pa_NCML = N_NCML./prov_year_NCML*power_energy_rate;
Cyc_pa_NCA = N_NCA./prov_year_NCA*power_energy_rate;
Cyc_pa_LMO = N_LMO./prov_year_LMO*power_energy_rate;
DoD = 1;

Cyc_Deg_es=zeros(province_num,1);
Cyc_Deg_LFP=zeros(province_num,1);
Cyc_Deg_NCMH=zeros(province_num,1);
Cyc_Deg_NCMM=zeros(province_num,1);
Cyc_Deg_NCML=zeros(province_num,1);
Cyc_Deg_NCA=zeros(province_num,1);
Cyc_Deg_LMO=zeros(province_num,1);

T_Deg_es=zeros(province_num,1);
T_Deg_LFP=zeros(province_num,1);
T_Deg_NCMH=zeros(province_num,1);
T_Deg_NCMM=zeros(province_num,1);
T_Deg_NCML=zeros(province_num,1);
T_Deg_NCA=zeros(province_num,1);
T_Deg_LMO=zeros(province_num,1);

for prv = 1:province_num
    Cyc_Deg_es(prv,1) = prov_caploss_rate(prv,1)*8.59*10^(-6);
    Cyc_Deg_LFP(prv,1) = prov_caploss_rate(prv,1)/power_energy_rate*8.59*10^(-6);
    Cyc_Deg_NCMH(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*8.59*10^(-6);
    Cyc_Deg_NCMM(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*8.59*10^(-6);
    Cyc_Deg_NCML(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*8.59*10^(-6);
    Cyc_Deg_NCA(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCA_0/power_energy_rate*8.59*10^(-6);
    Cyc_Deg_LMO(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_LMO_0/power_energy_rate*8.59*10^(-6);
%     Cyc_Deg_es(prv,1) = prov_caploss_rate(prv,1)*0.01;
%     Cyc_Deg_LFP(prv,1) = prov_caploss_rate(prv,1)/power_energy_rate*0.01;
%     Cyc_Deg_NCMH(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*0.01;
%     Cyc_Deg_NCMM(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*0.01;
%     Cyc_Deg_NCML(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate*0.01;
%     Cyc_Deg_NCA(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCA_0/power_energy_rate*0.01;
%     Cyc_Deg_LMO(prv,1) = prov_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_LMO_0/power_energy_rate*0.01;



    T_Deg_es(prv,1) = prov_calend_caploss_rate(prv,1);
    T_Deg_LFP(prv,1) = prov_calend_caploss_rate(prv,1)/power_energy_rate;
    T_Deg_NCMH(prv,1) = prov_calend_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate;
    T_Deg_NCMM(prv,1) = prov_calend_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate;
    T_Deg_NCML(prv,1) = prov_calend_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCM_0/power_energy_rate;
    T_Deg_NCA(prv,1) = prov_calend_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_NCA_0/power_energy_rate;
    T_Deg_LMO(prv,1) = prov_calend_caploss_rate(prv,1)*prov_year_LFP_0/prov_year_LMO_0/power_energy_rate;

end

N = 5;
T_c = 1;
r = 6*0.01; % discount rate, 8%

%%% function
for s = 1:stage
    for prv = 1:province_num
        for n = 1:N
% %             C_ESS = [C_ESS,
% %                 cost_fom_es(prv,s,1) == cost_fom_es(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_es(prv,s,1)+C_E_OM*(Cyc_pa_es*DoD*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1))^((n-1)*Cyc_pa_es).*(1-T_Deg_es(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_LFP(prv,s,1) == cost_fom_SLB_LFP(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_LFP(prv,s,1)+C_E_OM*(Cyc_pa_LFP*DoD*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1))^((n-1)*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_NCMH(prv,s,1) == cost_fom_SLB_NCMH(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_NCMH(prv,s,1)+C_E_OM*(Cyc_pa_NCMH*DoD*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1))^((n-1)*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_NCMM(prv,s,1) == cost_fom_SLB_NCMM(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_NCMM(prv,s,1)+C_E_OM*(Cyc_pa_NCMM*DoD*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1))^((n-1)*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_NCML(prv,s,1) == cost_fom_SLB_NCML(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_NCML(prv,s,1)+C_E_OM*(Cyc_pa_NCML*1*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1))^((n-1)*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_NCA(prv,s,1) == cost_fom_SLB_NCA(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_NCA(prv,s,1)+C_E_OM*(Cyc_pa_NCA*DoD*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1))^((n-1)*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 cost_fom_SLB_LMO(prv,s,1) == cost_fom_SLB_LMO(prv,s,1) + ...
% %                 (C_P_OM*Cap_nom_P_LMO(prv,s,1)+C_E_OM*(Cyc_pa_LMO*DoD*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1))^((n-1)*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1))^(n-1))/(1+r)^(n+T_c),
% %                 ];
                cost_fom_es(prv,s,1) = cost_fom_es(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_es(prv,s,1)+C_E_OM*(Cyc_pa_es(prv,1)*DoD*Cap_nom_E_es(prv,s,1))*(1-Cyc_Deg_es(prv,1))^((n-1)*Cyc_pa_es(prv,1))*(1-T_Deg_es(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));
                
                cost_fom_SLB_LFP(prv,s,1) = cost_fom_SLB_LFP(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_LFP(prv,s,1)+C_E_OM*(Cyc_pa_LFP(prv,1)*DoD*Cap_nom_E_LFP(prv,s,1))*(1-Cyc_Deg_LFP(prv,1))^((n-1)*Cyc_pa_LFP(prv,1))*(1-T_Deg_LFP(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));

                cost_fom_SLB_NCMH(prv,s,1) = cost_fom_SLB_NCMH(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_NCMH(prv,s,1)+C_E_OM*(Cyc_pa_NCMH(prv,1)*DoD*Cap_nom_E_NCMH(prv,s,1))*(1-Cyc_Deg_NCMH(prv,1))^((n-1)*Cyc_pa_NCMH(prv,1))*(1-T_Deg_NCMH(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));

                cost_fom_SLB_NCMM(prv,s,1) = cost_fom_SLB_NCMM(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_NCMM(prv,s,1)+C_E_OM*(Cyc_pa_NCMM(prv,1)*DoD*Cap_nom_E_NCMM(prv,s,1))*(1-Cyc_Deg_NCMM(prv,1))^((n-1)*Cyc_pa_NCMM(prv,1))*(1-T_Deg_NCMM(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));

                cost_fom_SLB_NCML(prv,s,1) = cost_fom_SLB_NCML(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_NCML(prv,s,1)+C_E_OM*(Cyc_pa_NCML(prv,1)*DoD.*Cap_nom_E_NCML(prv,s,1))*(1-Cyc_Deg_NCML(prv,1))^((n-1)*Cyc_pa_NCML(prv,1))*(1-T_Deg_NCML(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));

                cost_fom_SLB_NCA(prv,s,1) = cost_fom_SLB_NCA(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_NCA(prv,s,1)+C_E_OM*(Cyc_pa_NCA(prv,1)*DoD*Cap_nom_E_NCA(prv,s,1))*(1-Cyc_Deg_NCA(prv,1))^((n-1)*Cyc_pa_NCA(prv,1))*(1-T_Deg_NCA(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));

                cost_fom_SLB_LMO(prv,s,1) = cost_fom_SLB_LMO(prv,s,1) + ...
                (C_P_OM*Cap_nom_P_LMO(prv,s,1)+C_E_OM*(Cyc_pa_LMO(prv,1)*DoD*Cap_nom_E_LMO(prv,s,1))*(1-Cyc_Deg_LMO(prv,1))^((n-1)*Cyc_pa_LMO(prv,1))*(1-T_Deg_LMO(prv,1))^(n-1))/((1+r)^((s-1)*5+n+T_c));


%                 cost_fom_es(prv,s,1) = cost_fom_es(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_es(prv,s,1)+C_E_OM*(Cyc_pa_es(prv,1)*DoD*Cap_nom_E_es(prv,s,1))*(1-Cyc_Deg_es(prv,1))^((n-1)*Cyc_pa_es(prv,1))*(1-T_Deg_es(prv,1))^(n-1))/((1+r)^(n+T_c));
%                 
%                 cost_fom_SLB_LFP(prv,s,1) = cost_fom_SLB_LFP(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_LFP(prv,s,1)+C_E_OM*(Cyc_pa_LFP(prv,1)*DoD*Cap_nom_E_LFP(prv,s,1))*(1-Cyc_Deg_LFP(prv,1))^((n-1)*Cyc_pa_LFP(prv,1))*(1-T_Deg_LFP(prv,1))^(n-1))/((1+r)^(n+T_c));
% 
%                 cost_fom_SLB_NCMH(prv,s,1) = cost_fom_SLB_NCMH(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCMH(prv,s,1)+C_E_OM*(Cyc_pa_NCMH(prv,1)*DoD*Cap_nom_E_NCMH(prv,s,1))*(1-Cyc_Deg_NCMH(prv,1))^((n-1)*Cyc_pa_NCMH(prv,1))*(1-T_Deg_NCMH(prv,1))^(n-1))/((1+r)^(n+T_c));
% 
%                 cost_fom_SLB_NCMM(prv,s,1) = cost_fom_SLB_NCMM(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCMM(prv,s,1)+C_E_OM*(Cyc_pa_NCMM(prv,1)*DoD*Cap_nom_E_NCMM(prv,s,1))*(1-Cyc_Deg_NCMM(prv,1))^((n-1)*Cyc_pa_NCMM(prv,1))*(1-T_Deg_NCMM(prv,1))^(n-1))/((1+r)^(n+T_c));
% 
%                 cost_fom_SLB_NCML(prv,s,1) = cost_fom_SLB_NCML(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCML(prv,s,1)+C_E_OM*(Cyc_pa_NCML(prv,1)*DoD.*Cap_nom_E_NCML(prv,s,1))*(1-Cyc_Deg_NCML(prv,1))^((n-1)*Cyc_pa_NCML(prv,1))*(1-T_Deg_NCML(prv,1))^(n-1))/((1+r)^(n+T_c));
% 
%                 cost_fom_SLB_NCA(prv,s,1) = cost_fom_SLB_NCA(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCA(prv,s,1)+C_E_OM*(Cyc_pa_NCA(prv,1)*DoD*Cap_nom_E_NCA(prv,s,1))*(1-Cyc_Deg_NCA(prv,1))^((n-1)*Cyc_pa_NCA(prv,1))*(1-T_Deg_NCA(prv,1))^(n-1))/((1+r)^(n+T_c));
% 
%                 cost_fom_SLB_LMO(prv,s,1) = cost_fom_SLB_LMO(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_LMO(prv,s,1)+C_E_OM*(Cyc_pa_LMO(prv,1)*DoD*Cap_nom_E_LMO(prv,s,1))*(1-Cyc_Deg_LMO(prv,1))^(((s-1)*5+n-1)*Cyc_pa_LMO(prv,1))*(1-T_Deg_LMO(prv,1))^((s-1)*5+n-1))/((1+r)^((s-1)*5+n+T_c));

        end
    end
end
% $
% for s = 1:stage
%     for prv = 1:province_num
        
%             C_ESS = [C_ESS,
%                 cost_fom_es(prv,s,1) == cost_fom_es(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_es(prv,s,1)+C_E_OM*(Cyc_pa_es*DoD*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1))^((n-1)*Cyc_pa_es).*(1-T_Deg_es(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_LFP(prv,s,1) == cost_fom_SLB_LFP(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_LFP(prv,s,1)+C_E_OM*(Cyc_pa_LFP*DoD*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1))^((n-1)*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_NCMH(prv,s,1) == cost_fom_SLB_NCMH(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCMH(prv,s,1)+C_E_OM*(Cyc_pa_NCMH*DoD*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1))^((n-1)*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_NCMM(prv,s,1) == cost_fom_SLB_NCMM(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCMM(prv,s,1)+C_E_OM*(Cyc_pa_NCMM*DoD*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1))^((n-1)*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_NCML(prv,s,1) == cost_fom_SLB_NCML(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCML(prv,s,1)+C_E_OM*(Cyc_pa_NCML*1*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1))^((n-1)*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_NCA(prv,s,1) == cost_fom_SLB_NCA(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_NCA(prv,s,1)+C_E_OM*(Cyc_pa_NCA*DoD*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1))^((n-1)*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 cost_fom_SLB_LMO(prv,s,1) == cost_fom_SLB_LMO(prv,s,1) + ...
%                 (C_P_OM*Cap_nom_P_LMO(prv,s,1)+C_E_OM*(Cyc_pa_LMO*DoD*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1))^((n-1)*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1))^(n-1))/(1+r)^(n+T_c),
%                 ];

% cost_fom_es(prv,s,1) = 1;
% cost_fom_SLB_LFP(prv,s,1) = 1;
% cost_fom_SLB_NCMH(prv,s,1) = 1;
% cost_fom_SLB_NCMM(prv,s,1) = 1;
% cost_fom_SLB_NCML(prv,s,1) = 1;
% cost_fom_SLB_NCA(prv,s,1) = 1;
% cost_fom_SLB_LMO(prv,s,1) = 1;

% C_ESS = [C_ESS,
%                 cost_fom_es(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^((s-1)*5+1-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1)*5+1-1)./(1+r).^((s-1)*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+2-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+3-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+4-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+5-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_LFP(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_NCMH(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1)*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_NCMM(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1)*5+1-1))./(1+r).^((s-1)*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_NCML(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+2-1))/(1+r)^((s-1)*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+3-1))/(1+r)^((s-1)*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+4-1))/(1+r)^((s-1)*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+5-1))/(1+r)^((s-1)*5+5+T_c),
%                 cost_fom_SLB_NCA(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_LMO(prv,s,1) == Cap_nom_P_es(prv,s,1)/1000, %(C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_LMO).*(1-T_Deg_LMOA(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
% %                     + (C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
% ];  
% 
% % 
%                 cost_fom_es(prv,s,1) = (C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^((s-1)*5+1-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1)*5+1-1)./(1+r).^((s-1)*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+2-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+3-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+4-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_es(prv,s,1)+C_E_OM.*(Cyc_pa_es.*DoD.*Cap_nom_E_es(prv,s,1)).*(1-Cyc_Deg_es(prv,1)).^(((s-1)*5+5-1).*Cyc_pa_es).*(1-T_Deg_es(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c);
%                 cost_fom_SLB_LFP(prv,s,1) = (C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LFP(prv,s,1)+C_E_OM.*(Cyc_pa_LFP.*DoD.*Cap_nom_E_LFP(prv,s,1)).*(1-Cyc_Deg_LFP(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_LFP).*(1-T_Deg_LFP(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c);
%                 cost_fom_SLB_NCMH(prv,s,1) = (C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1)*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMH(prv,s,1)+C_E_OM.*(Cyc_pa_NCMH.*DoD.*Cap_nom_E_NCMH(prv,s,1)).*(1-Cyc_Deg_NCMH(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCMH).*(1-T_Deg_NCMH(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c);
%                 cost_fom_SLB_NCMM(prv,s,1) = (C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1)*5+1-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1)*5+1-1))./(1+r).^((s-1)*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCMM(prv,s,1)+C_E_OM.*(Cyc_pa_NCMM.*DoD.*Cap_nom_E_NCMM(prv,s,1)).*(1-Cyc_Deg_NCMM(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCMM).*(1-T_Deg_NCMM(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c),
%                 cost_fom_SLB_NCML(prv,s,1) = (C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+2-1))/(1+r)^((s-1)*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+3-1))/(1+r)^((s-1)*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+4-1))/(1+r)^((s-1)*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCML(prv,s,1)+C_E_OM.*(Cyc_pa_NCML.*DoD.*Cap_nom_E_NCML(prv,s,1)).*(1-Cyc_Deg_NCML(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCML).*(1-T_Deg_NCML(prv,1)).^((s-1)*5+5-1))/(1+r)^((s-1)*5+5+T_c);
%                 cost_fom_SLB_NCA(prv,s,1) = (C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_NCA(prv,s,1)+C_E_OM.*(Cyc_pa_NCA.*DoD.*Cap_nom_E_NCA(prv,s,1)).*(1-Cyc_Deg_NCA(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_NCA).*(1-T_Deg_NCA(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c);
%                 cost_fom_SLB_LMO(prv,s,1) = (C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+1-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+1-1))./(1+r).^((s-1).*5+1+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+2-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+2-1))./(1+r).^((s-1).*5+2+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+3-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+3-1))./(1+r).^((s-1).*5+3+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+4-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+4-1))./(1+r).^((s-1).*5+4+T_c)...
%                     +(C_P_OM.*Cap_nom_P_LMO(prv,s,1)+C_E_OM.*(Cyc_pa_LMO.*DoD.*Cap_nom_E_LMO(prv,s,1)).*(1-Cyc_Deg_LMO(prv,1)).^(((s-1).*5+5-1).*Cyc_pa_LMO).*(1-T_Deg_LMO(prv,1)).^((s-1).*5+5-1))./(1+r).^((s-1).*5+5+T_c);
% 
%     end
% end
% cost_fom_es = value(cost_fom_es);
% cost_fom_SLB_LFP = value(cost_fom_SLB_LFP);
% cost_fom_SLB_NCMH = value(cost_fom_SLB_NCMH);
% cost_fom_SLB_NCMM = value(cost_fom_SLB_NCMM);
% cost_fom_SLB_NCML = value(cost_fom_SLB_NCML);
% cost_fom_SLB_NCA = value(cost_fom_SLB_NCA);
% cost_fom_SLB_LMO = value(cost_fom_SLB_LMO);