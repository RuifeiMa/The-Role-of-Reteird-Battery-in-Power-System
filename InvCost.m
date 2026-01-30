%%%%%%%%%%% SLB investment cost
for s = 1:stage
    sum_SLB_LFP(s,1) = sum(LFP_city(:,s));
    sum_SLB_NCMH(s,1) = sum(NCMH_city(:,s));
    sum_SLB_NCMM(s,1) = sum(NCMM_city(:,s));
    sum_SLB_NCML(s,1) = sum(NCML_city(:,s));
    sum_SLB_NCA(s,1) = sum(NCA_city(:,s));
    sum_SLB_LMO(s,1) = sum(LMO_city(:,s));
    sum_SLB(s,1) = sum_SLB_LFP(s,1)+sum_SLB_NCMH(s,1)+sum_SLB_NCMM(s,1)+sum_SLB_NCML(s,1)+sum_SLB_NCA(s,1)+sum_SLB_LMO(s,1);
    adc_SLB_LFP(s,1) = sum_SLB(s,1)*prov_year_LFP_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
    adc_SLB_NCMH(s,1) = sum_SLB(s,1)*prov_year_NCM_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
    adc_SLB_NCMM(s,1) = sum_SLB(s,1)*prov_year_NCM_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
    adc_SLB_NCML(s,1) = sum_SLB(s,1)*prov_year_NCM_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
    adc_SLB_NCA(s,1) = sum_SLB(s,1)*prov_year_NCA_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
    adc_SLB_LMO(s,1) = sum_SLB(s,1)*prov_year_LMO_0 ...
        /(sum_SLB_LFP(s,1)*prov_year_LFP_0+sum_SLB_NCMH(s,1)*prov_year_NCM_0+sum_SLB_NCMM(s,1)*prov_year_NCM_0+sum_SLB_NCML(s,1)*prov_year_NCM_0+sum_SLB_NCA(s,1)*prov_year_LFP_0+sum_SLB_LMO(s,1)*prov_year_LMO_0);
end
w1 = 0.5; %高：72; %低：19; %中：50;
w2 = 0.5; %高：36; %低：25; %中：30;
SOH0 = 0.8;
for s = 1:stage
    if adc_SLB_LFP(s,1) > 0
        cost_inv_SLB_LFP(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_LFP(s,1);
    else
        cost_inv_SLB_LFP(s,1) = 0;
    end
    if adc_SLB_NCMH(s,1) > 0
        cost_inv_SLB_NCMH(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_NCMH(s,1);
    else
        cost_inv_SLB_NCMH(s,1) = 0;
    end
    if adc_SLB_NCMM(s,1) > 0
        cost_inv_SLB_NCMM(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_NCMM(s,1);
    else
        cost_inv_SLB_NCMM(s,1) = 0;
    end
    if adc_SLB_NCML(s,1) > 0
        cost_inv_SLB_NCML(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_NCML(s,1);
    else
        cost_inv_SLB_NCML(s,1) = 0;
    end
    if adc_SLB_NCA(s,1) > 0
        cost_inv_SLB_NCA(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_NCA(s,1);
    else
        cost_inv_SLB_NCA(s,1) = 0;
    end
    if adc_SLB_LMO(s,1) > 0
        cost_inv_SLB_LMO(s,1) = (w1+w2*(sum_SLB(s,1)*10^6)^(0.95-1)*0.6^0.05)*1.0*SOH0*adc_SLB_LMO(s,1);
    else
        cost_inv_SLB_LMO(s,1) = 0;
    end
end