%%%%%%%%%%%%%%%%%%%% 鼓励政策
C_Encou = [];
%%% 提倡最大使用，不用修改
c_SLB_LFP_COT = sdpvar(province_num,stage,1);
c_SLB_NCMH_COT = sdpvar(province_num,stage,1);
c_SLB_NCMM_COT = sdpvar(province_num,stage,1);
c_SLB_NCML_COT = sdpvar(province_num,stage,1);
c_SLB_NCA_COT = sdpvar(province_num,stage,1);
c_SLB_LMO_COT = sdpvar(province_num,stage,1);
c_trans = sdpvar(province_num,stage,1);
c_inv_es = sdpvar(province_num,stage,1);
c_inv_SLB_LFP = sdpvar(province_num,stage,1);
c_inv_SLB_NCMH = sdpvar(province_num,stage,1);
c_inv_SLB_NCMM = sdpvar(province_num,stage,1);
c_inv_SLB_NCML = sdpvar(province_num,stage,1);
c_inv_SLB_NCA = sdpvar(province_num,stage,1);
c_inv_SLB_LMO = sdpvar(province_num,stage,1);
c_fom_es = sdpvar(province_num,stage,1);
c_fom_SLB_LFP = sdpvar(province_num,stage,1);
c_fom_SLB_NCMH = sdpvar(province_num,stage,1);
c_fom_SLB_NCMM = sdpvar(province_num,stage,1);
c_fom_SLB_NCML = sdpvar(province_num,stage,1);
c_fom_SLB_NCA = sdpvar(province_num,stage,1);
c_fom_SLB_LMO = sdpvar(province_num,stage,1);


for prv = 1:province_num
    for s=1:stage
        c_SLB_LFP_COT(prv,s) = prov_SLB_LFP_COT(prv,s,1)/EnergyDensity_LFP/1000;
        c_SLB_NCMH_COT(prv,s) = prov_SLB_NCMH_COT(prv,s,1)/EnergyDensity_NCMH/1000;
        c_SLB_NCMM_COT(prv,s) = prov_SLB_NCMM_COT(prv,s,1)/EnergyDensity_NCMM/1000;
        c_SLB_NCML_COT(prv,s) = prov_SLB_NCML_COT(prv,s,1)/EnergyDensity_NCML/1000;
        c_SLB_NCA_COT(prv,s) = prov_SLB_NCA_COT(prv,s,1)/EnergyDensity_NCA/1000;
        c_SLB_LMO_COT(prv,s) = prov_SLB_LMO_COT(prv,s,1)/EnergyDensity_LMO/1000;
        c_trans(prv,s) = c_SLB_LFP_COT(prv,s) + c_SLB_NCMH_COT(prv,s) + c_SLB_NCMM_COT(prv,s) + c_SLB_NCML_COT(prv,s) + c_SLB_NCA_COT(prv,s) + c_SLB_LMO_COT(prv,s);


        c_inv_es(prv,s) = (cost_inv(8,s+jd)*2)*delI_es(prv,s,1)*0.10296/1000000;
        c_inv_SLB_LFP(prv,s) = cost_inv_SLB_LFP(s,1)*delI_SLB_LFP(prv,s,1)*exchange_rate/1000;
        c_inv_SLB_NCMH(prv,s) = cost_inv_SLB_NCMH(s,1)*delI_SLB_NCMH(prv,s,1)*exchange_rate/1000;
        c_inv_SLB_NCMM(prv,s) = cost_inv_SLB_NCMM(s,1)*delI_SLB_NCMM(prv,s,1)*exchange_rate/1000;
        c_inv_SLB_NCML(prv,s) = cost_inv_SLB_NCML(s,1)*delI_SLB_NCML(prv,s,1)*exchange_rate/1000;
        c_inv_SLB_NCA(prv,s) = cost_inv_SLB_NCA(s,1)*delI_SLB_NCA(prv,s,1)*exchange_rate/1000;
        c_inv_SLB_LMO(prv,s) = cost_inv_SLB_LMO(s,1)*delI_SLB_LMO(prv,s,1)*exchange_rate/1000;

        c_inv(prv,s) = huansuan1(s)*(cost_inv(3,s+jd)*delI_woff(prv,s,1)*0.07823...
            + cost_inv(15,s+jd)*delI_csp(prv,s,1)*0.068973859 + cost_inv(1,s+jd)*delI_c(prv,s,1)*0.06646...
            + cost_inv(2,s+jd)*delI_g(prv,s,1)*0.06646 + cost_inv(12,s+jd)*delI_bio(prv,s,1)*0.06646...
            + cost_inv(9,s+jd)*delI_cccs(prv,s,1)*0.06646 + cost_inv(10,s+jd)*delI_gccs(prv,s,1)*0.06646...
            + cost_inv(13,s+jd)*delI_bioccs(prv,s,1)*0.06646 + cost_inv(6,s+jd)*delI_h(prv,s,1)*0.06344...
            + cost_inv(7,s+jd)*delI_nu(prv,s,1)*0.06344 ... %%% es
            + cost_inv(14,s+jd)*delI_ps(prv,s,1)*0.06344 + 10*0.066461536*(dot(line_cost_AC(1,prv,:),AC_del_topo_capaity(s,prv,:)))...
            + 10*0.066461536*(dot(line_cost_DC(1,prv,:),DC_del_topo_capaity(s,prv,:))))/1000000 ...
            + c_inv_es(prv,s)...
            + c_inv_SLB_LFP(prv,s) + c_inv_SLB_NCMH(prv,s) + c_inv_SLB_NCMM(prv,s) + c_inv_SLB_NCML(prv,s) + c_inv_SLB_NCA(prv,s) + c_inv_SLB_LMO(prv,s) + c_trans(prv,s);

%             + (cost_inv_SLB_LFP(s,1)*delI_SLB_LFP(prv,s,1) + cost_inv_SLB_NCMH(s,1)*delI_SLB_NCMH(prv,s,1) ...%%%%%%%%%%%%%%%
%             + cost_inv_SLB_NCMM(s,1)*delI_SLB_NCMM(prv,s,1) + cost_inv_SLB_NCML(s,1)*delI_SLB_NCML(prv,s,1) ...
%             + cost_inv_SLB_NCA(s,1)*delI_SLB_NCA(prv,s,1) + cost_inv_SLB_LMO(s,1)*delI_SLB_LMO(prv,s,1))*exchange_rate/1000000000 ...
%             + (sum(sum(delI_SLB_LFP_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_LFP + sum(sum(delI_SLB_NCMH_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_NCMH ... %%%%%%%%%%%%交通成本
%             + sum(sum(delI_SLB_NCMM_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_NCMM + sum(sum(delI_SLB_NCML_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_NCML ...
%             + sum(sum(delI_SLB_NCA_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_NCA + sum(sum(delI_SLB_LMO_COT(:,:,s).*COT_city(:,:)))/EnergyDensity_LMO)/1000000000;  %...

            %单位：10亿CNY 
 
        %新系数
        c_inv_pw(prv,s) = huansuan1(s)*(1.2*cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*delI_won(prv,s,:,1))*0.07823 ...
            + 1.1*cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sc(prv,s,:,1))*0.07823 ...
            + 1.1*cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sd(prv,s,:,1))*0.07823)/1000000;

        %升级版原
%         c_inv_pw(prv,s) = huansuan1(s)*(cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*delI_won(prv,s,:,1))*0.07823 + cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sc(prv,s,:,1))*0.07823 + cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*delI_sd(prv,s,:,1))*0.07823)/1000000;

        % 年度固定运维成本, 按照装机量计费
        c_fom_es(prv,s) = cost_fom_es(prv,s,1).*I_es(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_LFP(prv,s) = cost_fom_SLB_LFP(prv,s,1).*I_SLB_LFP(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_NCMH(prv,s) = cost_fom_SLB_NCMH(prv,s,1).*I_SLB_NCMH(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_NCMM(prv,s) = cost_fom_SLB_NCMM(prv,s,1).*I_SLB_NCMM(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_NCML(prv,s) = cost_fom_SLB_NCML(prv,s,1).*I_SLB_NCML(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_NCA(prv,s) = cost_fom_SLB_NCA(prv,s,1).*I_SLB_NCA(prv,s,1)*exchange_rate/1000;
        c_fom_SLB_LMO(prv,s) = cost_fom_SLB_LMO(prv,s,1).*I_SLB_LMO(prv,s,1)*exchange_rate/1000;

        c_fom(prv,s) = huansuan1(6)*(cost_fom(15,s+jd)*I_csp(prv,s,1) + cost_fom(1,s+jd)*I_c(prv,s,1)...
            + cost_fom(2,s+jd)*I_g(prv,s,1) + cost_fom(12,s+jd)*I_bio(prv,s,1) + cost_fom(9,s+jd)*I_cccs(prv,s,1)...
            + cost_fom(10,s+jd)*I_gccs(prv,s,1) + cost_fom(13,s+jd)*I_bioccs(prv,s,1) + cost_fom(3,s+jd)*I_woff(prv,s,1)...
            + cost_fom(4,s+jd)*I_won(prv,s,1) + cost_fom(5,s+jd)*I_sc(prv,s,1) + cost_fom(11,s+jd)*I_sd(prv,s,1)...
            + cost_fom(6,s+jd)*I_h(prv,s,1) + cost_fom(7,s+jd)*I_nu(prv,s,1)  + cost_fom(14,s+jd)*I_ps(prv,s,1)...
            )/1000000 ...
            + c_fom_es(prv,s) + c_fom_SLB_LFP(prv,s) + c_fom_SLB_NCMH(prv,s) + c_fom_SLB_NCMM(prv,s) + c_fom_SLB_NCML(prv,s) + c_fom_SLB_NCA(prv,s) + c_fom_SLB_LMO(prv,s); ...
%             + (cost_fom_es(prv,s,1).*I_es(prv,s,1) ...
%             + cost_fom_SLB_LFP(prv,s,1).*I_SLB_LFP(prv,s,1) + cost_fom_SLB_NCMH(prv,s,1).*I_SLB_NCMH(prv,s,1) + cost_fom_SLB_NCMM(prv,s,1).*I_SLB_NCMM(prv,s,1)...
%             + cost_fom_SLB_NCML(prv,s,1).*I_SLB_NCML(prv,s,1) + cost_fom_SLB_NCA(prv,s,1).*I_SLB_NCA(prv,s,1) + cost_fom_SLB_LMO(prv,s,1).*I_SLB_LMO(prv,s,1) ...
%             )*exchange_rate/1000000000; ...
             %单位：10亿CNY
    end
end