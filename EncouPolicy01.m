%%%%%%%%%%%%%%%%%%%% 鼓励政策
C_Encou = [];
%%% 完全不允许使用（baseline）
for prv = 1:province_num
    for s = 1:stage
        C_Encou = [C_Encou,
            delI_SLB_LFP(prv,s,1) == 0,
            delI_SLB_NCMH(prv,s,1) == 0,
            delI_SLB_NCMM(prv,s,1) == 0,
            delI_SLB_NCML(prv,s,1) == 0,
            delI_SLB_NCA(prv,s,1) == 0,
            delI_SLB_LMO(prv,s,1) == 0,
            delIR_SLB_LFP(prv,s,1) == 0,
            delIR_SLB_NCMH(prv,s,1) == 0,
            delIR_SLB_NCMM(prv,s,1) == 0,
            delIR_SLB_NCML(prv,s,1) == 0,
            delIR_SLB_NCA(prv,s,1) == 0,
            delIR_SLB_LMO(prv,s,1) == 0,
            ];
        delI_SLB_LFP_conv(prv,s,1) = 0;
        delI_SLB_NCMH_conv(prv,s,1) = 0;
        delI_SLB_NCMM_conv(prv,s,1) = 0;
        delI_SLB_NCML_conv(prv,s,1) = 0;
        delI_SLB_NCA_conv(prv,s,1) = 0;
        delI_SLB_LMO_conv(prv,s,1) = 0;
    end
end
I_SLB_LFP=zeros(province_num,stage,1);
I_SLB_NCMH=zeros(province_num,stage,1);
I_SLB_NCMM=zeros(province_num,stage,1);
I_SLB_NCML=zeros(province_num,stage,1);
I_SLB_NCA=zeros(province_num,stage,1);
I_SLB_LMO=zeros(province_num,stage,1);

c_SLB_LFP_COT = zeros(province_num,stage,1);
c_SLB_NCMH_COT = zeros(province_num,stage,1);
c_SLB_NCMM_COT = zeros(province_num,stage,1);
c_SLB_NCML_COT = zeros(province_num,stage,1);
c_SLB_NCA_COT = zeros(province_num,stage,1);
c_SLB_LMO_COT = zeros(province_num,stage,1);

SOH_coeff_LFP = 0;
SOH_coeff_NCMH = 0;
SOH_coeff_NCMM = 0;
SOH_coeff_NCML = 0;
SOH_coeff_NCA = 0;
SOH_coeff_LMO = 0;

c_trans = sdpvar(province_num,stage,1);
c_trans = zeros(province_num,stage,1);

c_inv_SLB_LFP = 0;
c_inv_SLB_NCMH = 0;
c_inv_SLB_NCMM = 0;
c_inv_SLB_NCML = 0;
c_inv_SLB_NCA = 0;
c_inv_SLB_LMO = 0;

c_fom_SLB_LFP = 0;
c_fom_SLB_NCMH = 0;
c_fom_SLB_NCMM = 0;
c_fom_SLB_NCML = 0;
c_fom_SLB_NCA = 0;
c_fom_SLB_LMO = 0;

for prv = 1:province_num
    for s=1:stage
        c_inv_es(prv,s) = (cost_inv(8,s+jd)*2)*delI_es(prv,s,1)*0.10296/1000000;
        c_inv(prv,s) = huansuan1(s)*(cost_inv(3,s+jd)*delI_woff(prv,s,1)*0.07823...
            + cost_inv(15,s+jd)*delI_csp(prv,s,1)*0.068973859 + cost_inv(1,s+jd)*delI_c(prv,s,1)*0.06646...
            + cost_inv(2,s+jd)*delI_g(prv,s,1)*0.06646 + cost_inv(12,s+jd)*delI_bio(prv,s,1)*0.06646...
            + cost_inv(9,s+jd)*delI_cccs(prv,s,1)*0.06646 + cost_inv(10,s+jd)*delI_gccs(prv,s,1)*0.06646...
            + cost_inv(13,s+jd)*delI_bioccs(prv,s,1)*0.06646 + cost_inv(6,s+jd)*delI_h(prv,s,1)*0.06344...
            + cost_inv(7,s+jd)*delI_nu(prv,s,1)*0.06344 ... %%% es
            + cost_inv(14,s+jd)*delI_ps(prv,s,1)*0.06344 + 10*0.066461536*(dot(line_cost_AC(1,prv,:),AC_del_topo_capaity(s,prv,:)))...
            + 10*0.066461536*(dot(line_cost_DC(1,prv,:),DC_del_topo_capaity(s,prv,:))))/1000000 ...
            + c_inv_es(prv,s); 
            
        
        c_inv_pw(prv,s) = huansuan1(s)*(1.2*cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*delI_won(prv,s,:,1))*0.07823 ...
            + 1.1*cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sc(prv,s,:,1))*0.07823 ...
            + 1.1*cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sd(prv,s,:,1))*0.07823)/1000000;
%单位：10亿CNY 
        %升级版原
%         c_inv_pw(prv,s) = huansuan1(s)*(cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*delI_won(prv,s,:,1))*0.07823 + cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sc(prv,s,:,1))*0.07823 + cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sd(prv,s,:,1))*0.07823)/1000000;

        % 年度固定运维成本, 按照装机量计费
        c_fom_es(prv,s) = cost_fom_es(prv,s,1).*I_es(prv,s,1)*exchange_rate/1000;
        c_fom(prv,s) = huansuan1(6)*(cost_fom(15,s+jd)*I_csp(prv,s,1) + cost_fom(1,s+jd)*I_c(prv,s,1)...
            + cost_fom(2,s+jd)*I_g(prv,s,1) + cost_fom(12,s+jd)*I_bio(prv,s,1) + cost_fom(9,s+jd)*I_cccs(prv,s,1)...
            + cost_fom(10,s+jd)*I_gccs(prv,s,1) + cost_fom(13,s+jd)*I_bioccs(prv,s,1) + cost_fom(3,s+jd)*I_woff(prv,s,1)...
            + cost_fom(4,s+jd)*I_won(prv,s,1) + cost_fom(5,s+jd)*I_sc(prv,s,1) + cost_fom(11,s+jd)*I_sd(prv,s,1)...
            + cost_fom(6,s+jd)*I_h(prv,s,1) + cost_fom(7,s+jd)*I_nu(prv,s,1)  + cost_fom(14,s+jd)*I_ps(prv,s,1)...
            )/1000000 ...
            + c_fom_es(prv,s);% v5
    end
end