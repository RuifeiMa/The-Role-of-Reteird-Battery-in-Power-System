%%% SLB 80%-60%
for s = 1:stage
    for prv = 1:province_num
%         prov_year_LFP_80_60(prv,1) = prov_year_LFP_80_60(prv,1)*power_energy_rate;
%         prov_year_NCMH_80_60(prv,1) = prov_year_NCMH_80_60(prv,1)*power_energy_rate;
%         prov_year_NCMM_80_60(prv,1) = prov_year_NCMM_80_60(prv,1)*power_energy_rate;
%         prov_year_NCML_80_60(prv,1) = prov_year_NCML_80_60(prv,1)*power_energy_rate;
%         prov_year_NCA_80_60(prv,1) = prov_year_NCA_80_60(prv,1)*power_energy_rate;
%         prov_year_LMO_80_60(prv,1) = prov_year_LMO_80_60(prv,1)*power_energy_rate;
        if prov_year_LFP_80_60(prv,1) > 0 && prov_year_LFP_80_60(prv,1) <= 5
            C_var = [C_var,delIR_SLB_LFP(prv,s,1) == delI_SLB_LFP(prv,s-1,1)];
            delI_SLB_LFP_conv(prv,1) = prov_year_LFP_80_60(prv,1)/5;
        elseif prov_year_LFP_80_60(prv,1) > 5 && prov_year_LFP_80_60(prv,1) <= 10 && s > 2
            C_var = [C_var,delIR_SLB_LFP(prv,s,1) == delI_SLB_LFP(prv,s-2,1)];
            delI_SLB_LFP_conv(prv,1) = prov_year_LFP_80_60(prv,1)/10;
        elseif prov_year_LFP_80_60(prv,1) > 10 && prov_year_LFP_80_60(prv,1) <= 15 && s > 3
            C_var = [C_var,delIR_SLB_LFP(prv,s,1) == delI_SLB_LFP(prv,s-3,1)];
            delI_SLB_LFP_conv(prv,1) = prov_year_LFP_80_60(prv,1)/15;
        end
        if prov_year_NCM_80_60(prv,1) > 0 && prov_year_NCM_80_60(prv,1) <= 5
            C_var = [C_var,delIR_SLB_NCMH(prv,s,1) == delI_SLB_NCMH(prv,s-1,1),
                delIR_SLB_NCMM(prv,s,1) == delI_SLB_NCMM(prv,s-1,1),
                delIR_SLB_NCML(prv,s,1) == delI_SLB_NCML(prv,s-1,1)];
            delI_SLB_NCMH_conv(prv,1) = prov_year_NCM_80_60(prv,1)/5;
            delI_SLB_NCMM_conv(prv,1) = prov_year_NCM_80_60(prv,1)/5;
            delI_SLB_NCML_conv(prv,1) = prov_year_NCM_80_60(prv,1)/5;
        elseif prov_year_NCM_80_60(prv,1) > 5 && prov_year_NCM_80_60(prv,1) <= 10 && s > 2
            C_var = [C_var,delIR_SLB_NCMH(prv,s,1) == delI_SLB_NCMH(prv,s-2,1),
                delIR_SLB_NCMM(prv,s,1) == delI_SLB_NCMM(prv,s-2,1),
                delIR_SLB_NCML(prv,s,1) == delI_SLB_NCML(prv,s-2,1)];
            delI_SLB_NCMH_conv(prv,1) = prov_year_NCM_80_60(prv,1)/10;
            delI_SLB_NCMM_conv(prv,1) = prov_year_NCM_80_60(prv,1)/10;
            delI_SLB_NCML_conv(prv,1) = prov_year_NCM_80_60(prv,1)/10;
        elseif prov_year_NCM_80_60(prv,1) > 10 && prov_year_NCM_80_60(prv,1) <= 15 && s > 3
            C_var = [C_var,delIR_SLB_NCMH(prv,s,1) == delI_SLB_NCMH(prv,s-3,1),
                delIR_SLB_NCMM(prv,s,1) == delI_SLB_NCMM(prv,s-3,1),
                delIR_SLB_NCML(prv,s,1) == delI_SLB_NCML(prv,s-3,1)];
            delI_SLB_NCMH_conv(prv,1) = prov_year_NCM_80_60(prv,1)/15;
            delI_SLB_NCMM_conv(prv,1) = prov_year_NCM_80_60(prv,1)/15;
            delI_SLB_NCML_conv(prv,1) = prov_year_NCM_80_60(prv,1)/15;
        end
        if prov_year_NCA_80_60(prv,1) > 0 && prov_year_NCA_80_60(prv,1) <= 5
            C_var = [C_var,delIR_SLB_NCA(prv,s,1) == delI_SLB_NCA(prv,s-1,1)];
            delI_SLB_NCA_conv(prv,1) = prov_year_NCA_80_60(prv,1)/5;
        elseif prov_year_NCA_80_60(prv,1) > 5 && prov_year_NCA_80_60(prv,1) <= 10 && s > 2
            C_var = [C_var,delIR_SLB_NCA(prv,s,1) == delI_SLB_NCA(prv,s-2,1)];
            delI_SLB_NCA_conv(prv,1) = prov_year_NCA_80_60(prv,1)/10;
        elseif prov_year_NCA_80_60(prv,1) > 10 && prov_year_NCA_80_60(prv,1) <= 15 && s > 3
            C_var = [C_var,delIR_SLB_NCA(prv,s,1) == delI_SLB_NCA(prv,s-3,1)];
            delI_SLB_NCA_conv(prv,1) = prov_year_NCA_80_60(prv,1)/15;
        end
        if prov_year_LMO_80_60(prv,1) > 0 && prov_year_LMO_80_60(prv,1) <= 5
            C_var = [C_var,delIR_SLB_LMO(prv,s,1) == delI_SLB_LMO(prv,s-1,1)];
            delI_SLB_LMO_conv(prv,1) = prov_year_LMO_80_60(prv,1)/5;
        elseif prov_year_LMO_80_60(prv,1) > 5 && prov_year_LMO_80_60(prv,1) <= 10 && s > 2
            C_var = [C_var,delIR_SLB_LMO(prv,s,1) == delI_SLB_LMO(prv,s-2,1)];
            delI_SLB_LMO_conv(prv,1) = prov_year_LMO_80_60(prv,1)/10;
        elseif prov_year_LMO_80_60(prv,1) > 10 && prov_year_LMO_80_60(prv,1) <= 15 && s > 3
            C_var = [C_var,delIR_SLB_LMO(prv,s,1) == delI_SLB_LMO(prv,s-3,1)];
            delI_SLB_LMO_conv(prv,1) = prov_year_LMO_80_60(prv,1)/15;
        end
    end
end
RTE_LFP = RTE_LFP_80_60;
RTE_NCMH = RTE_NCM_80_60;
RTE_NCMM = RTE_NCM_80_60;
RTE_NCML = RTE_NCM_80_60;
RTE_NCA = RTE_NCA_80_60;
RTE_LMO = RTE_LMO_80_60;
SOH_coeff_LFP = SOH_coeff_LFP_80_60;
SOH_coeff_NCMH = SOH_coeff_NCM_80_60;
SOH_coeff_NCMM = SOH_coeff_NCM_80_60;
SOH_coeff_NCML = SOH_coeff_NCM_80_60;
SOH_coeff_NCA = SOH_coeff_NCA_80_60;
SOH_coeff_LMO = SOH_coeff_LMO_80_60;
N_LFP = (N_LFP_100_60-N_LFP_100_80);
N_NCMH = (N_NCM_100_60-N_NCM_100_80);
N_NCMM = (N_NCM_100_60-N_NCM_100_80);
N_NCML = (N_NCM_100_60-N_NCM_100_80);
N_NCA = (N_NCA_100_60-N_NCA_100_80);
N_LMO = (N_LMO_100_60-N_LMO_100_80);
prov_year_LFP = prov_year_LFP_80_60;
prov_year_NCMH = prov_year_NCM_80_60;
prov_year_NCMM = prov_year_NCM_80_60;
prov_year_NCML = prov_year_NCM_80_60;
prov_year_NCA = prov_year_NCA_80_60;
prov_year_LMO = prov_year_LMO_80_60;