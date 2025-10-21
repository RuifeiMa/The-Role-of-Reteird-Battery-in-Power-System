%% 2050各省各类能源装机量结果
rI_c = value(I_c);
rI_g = value(I_g);
rI_bio = value(I_bio);
rI_bioccs = value(I_bioccs);
rI_cccs = value(I_cccs);
rI_gccs = value(I_gccs);
rI_won = value(I_won);
rI_woff = value(I_woff);
rI_sc = value(I_sc);
rI_sd = value(I_sd);
rI_h = value(I_h);
rI_nu = value(I_nu);
rI_es = value(I_es);
rI_ps = value(I_ps);
rI_csp = value(I_csp);
rI_SLB_LFP = value(I_SLB_LFP);
rI_SLB_NCMH = value(I_SLB_NCMH);
rI_SLB_NCMM = value(I_SLB_NCMM);
rI_SLB_NCML = value(I_SLB_NCML);
rI_SLB_NCA = value(I_SLB_NCA);
rI_SLB_LMO = value(I_SLB_LMO);
remission_cin = value(emission_cin);


rc_SLB_LFP_COT = value(c_SLB_LFP_COT);
rc_SLB_NCMH_COT = value(c_SLB_NCMH_COT);
rc_SLB_NCMM_COT = value(c_SLB_NCMM_COT);
rc_SLB_NCML_COT = value(c_SLB_NCML_COT);
rc_SLB_NCA_COT = value(c_SLB_NCA_COT);
rc_SLB_LMO_COT = value(c_SLB_LMO_COT);

rc_inv_es = value(c_inv_es);
rc_inv_SLB_LFP = value(c_inv_SLB_LFP);
rc_inv_SLB_NCMH = value(c_inv_SLB_NCMH);
rc_inv_SLB_NCMM = value(c_inv_SLB_NCMM);
rc_inv_SLB_NCML = value(c_inv_SLB_NCML);
rc_inv_SLB_NCA = value(c_inv_SLB_NCA);
rc_inv_SLB_LMO = value(c_inv_SLB_LMO);
rc_inv_pw = value(c_inv_pw);

rc_fom_es = value(c_fom_es);
rc_fom_SLB_LFP = value(c_fom_SLB_LFP);
rc_fom_SLB_NCMH = value(c_fom_SLB_NCMH);
rc_fom_SLB_NCMM = value(c_fom_SLB_NCMM);
rc_fom_SLB_NCML = value(c_fom_SLB_NCML);
rc_fom_SLB_NCA = value(c_fom_SLB_NCA);
rc_fom_SLB_LMO = value(c_fom_SLB_LMO);

rAC_total_topo_capaity=value(AC_total_topo_capaity);
rAC_del_topo_capaity=value(AC_del_topo_capaity);
rDC_total_topo_capaity=value(DC_total_topo_capaity);
rDC_del_topo_capaity=value(DC_del_topo_capaity);

rc_inv=value(c_inv);
rc_on=value(c_on);
rc_ccs=value(c_ccs);
rc_ope=value(c_ope);
rc_fom=value(c_fom);
rc_trans=value(c_trans);
rc_total=value(c_total);
rcc_total=value(cc_total);
rcc_total_hs=value(cc_total_hs);
rcc_total_hs_sum = sum(rcc_total_hs); 

rdelI_c=value(delI_c);       %煤炭                                 
rdelI_g=value(delI_g);       %天然气
rdelI_won=value(delI_won); %陆上风电 
rdelI_woff = value(delI_woff);  %海上风电
rdelI_sc=value(delI_sc);  %集中式光伏  
rdelI_h=value(delI_h);       %水电
rdelI_nu=value(delI_nu);        %核电
rdelI_es=value(delI_es);     %电化学储能
rdelI_cccs=value(delI_cccs);    %煤电+CCS
rdelI_gccs=value(delI_gccs);    %气电+CCS
rdelI_sd=value(delI_sd);  %分布式光伏
rdelI_bio=value(delI_bio);   %生物质发电
rdelI_bioccs=value(delI_bioccs);  %生物质发电+CCS
rdelI_ps=value(delI_ps);      %抽水蓄能
rdelI_csp=value(delI_csp);     %聚光太阳能
rdelI_SLB_LFP=value(delI_SLB_LFP);     %电化学储能
rdelI_SLB_NCMH=value(delI_SLB_NCMH);     %电化学储能
rdelI_SLB_NCMM=value(delI_SLB_NCMM);     %电化学储能
rdelI_SLB_NCML=value(delI_SLB_NCML);     %电化学储能
rdelI_SLB_NCA=value(delI_SLB_NCA);     %电化学储能
rdelI_SLB_LMO=value(delI_SLB_LMO);     %电化学储能

rdelIR_c=value(delIR_c); 
rdelIR_g=value(delIR_g); 
rdelIR_won=value(delIR_won);
rdelIR_woff = value(delIR_woff);
rdelIR_sc=value(delIR_sc);
rdelIR_h=value(delIR_h); 
rdelIR_nu=value(delIR_nu); 
rdelIR_es=value(delIR_es);
rdelIR_cccs=value(delIR_cccs); 
rdelIR_gccs=value(delIR_gccs);  
rdelIR_sd=value(delIR_sd);  
rdelIR_bio=value(delIR_bio);
rdelIR_bioccs=value(delIR_bioccs); 
rdelIR_ps=value(delIR_ps);
rdelIR_csp=value(delIR_csp);  
rdelIR_SLB_LFP=value(delIR_SLB_LFP);
rdelIR_SLB_NCMH=value(delIR_SLB_NCMH);
rdelIR_SLB_NCMM=value(delIR_SLB_NCMM);
rdelIR_SLB_NCML=value(delIR_SLB_NCML);
rdelIR_SLB_NCA=value(delIR_SLB_NCA);
rdelIR_SLB_LMO=value(delIR_SLB_LMO);


rdelI_SLB_LFP_COT=value(delI_SLB_LFP_COT);
rdelI_SLB_NCMH_COT=value(delI_SLB_NCMH_COT);
rdelI_SLB_NCMM_COT=value(delI_SLB_NCMM_COT);
rdelI_SLB_NCML_COT=value(delI_SLB_NCML_COT);
rdelI_SLB_NCA_COT=value(delI_SLB_NCA_COT);
rdelI_SLB_LMO_COT=value(delI_SLB_LMO_COT);

rI_won_seg=value(I_won_seg);  %海上风电规划----几个新能源分段计算，在此处分开列
rI_sc_seg=value(I_sc_seg);  %集中式光伏规划
rI_sd_seg=value(I_sd_seg); %分布式光伏规划

rP_loadshedding = value(P_loadshedding);
rP_c = value(P_c);  
rP_g = value(P_g);  
rP_bio = value(P_bio);  
rP_cccs = value(P_cccs);   
rP_gccs = value(P_gccs);  
rP_bioccs = value(P_bioccs);  
rP_netcccs = value(P_netcccs);  
rP_netgccs = value(P_netgccs);  
rP_netbioccs = value(P_netbioccs);  
rP_woff = value(P_woff);  
rP_won = value(P_won);  
rP_sc = value(P_sc);  
rP_sd = value(P_sd);  
rP_h = value(P_h);  
rP_nu = value(P_nu);  
rP_ch = value(P_ch);   %电化学储能充电
rP_dis = value(P_dis);    %电化学储能放电
rES = value(ES);   %电化学储能的能量存储
rP_psch = value(P_psch);   %抽水蓄能充电
rP_psdis = value(P_psdis);   %抽水蓄能放电
rPS = value(PS);   %抽水蓄能的能量存储

rES_SLB_LFP = value(ES_SLB_LFP);   %SLB LFP电化学储能的能量存储
rP_ch_SLB_LFP = value(P_ch_SLB_LFP);    %电化学储能充电
rP_dis_SLB_LFP = value(P_dis_SLB_LFP);    %电化学储能放电
rES_SLB_NCMH = value(ES_SLB_NCMH);   %SLB NNMH电化学储能的能量存储
rP_ch_SLB_NCMH = value(P_ch_SLB_NCMH);    %电化学储能充电
rP_dis_SLB_NCMH = value(P_dis_SLB_NCMH);    %电化学储能放电
rES_SLB_NCMM = value(ES_SLB_NCMM);   %SLB NCMM电化学储能的能量存储
rP_ch_SLB_NCMM = value(P_ch_SLB_NCMM);    %电化学储能充电
rP_dis_SLB_NCMM = value(P_dis_SLB_NCMM);    %电化学储能放电
rES_SLB_NCML = value(ES_SLB_NCML);   %SLB NCML电化学储能的能量存储
rP_ch_SLB_NCML = value(P_ch_SLB_NCML);    %电化学储能充电
rP_dis_SLB_NCML = value(P_dis_SLB_NCML);    %电化学储能放电
rES_SLB_NCA = value(ES_SLB_NCA);   %SLB NCA电化学储能的能量存储
rP_ch_SLB_NCA = value(P_ch_SLB_NCA);    %电化学储能充电
rP_dis_SLB_NCA = value(P_dis_SLB_NCA);    %电化学储能放电
rES_SLB_LMO = value(ES_SLB_LMO);   %SLB LMO电化学储能的能量存储
rP_ch_SLB_LMO = value(P_ch_SLB_LMO);    %电化学储能充电
rP_dis_SLB_LMO = value(P_dis_SLB_LMO);    %电化学储能放电

% CSP 变量
rP_csp = value(P_csp);   % csp发电量
rCAP_csp_SF = value(CAP_csp_SF);   %cap_cap
rCAP_csp_TES = value(CAP_csp_TES);  
rCSP_S = value(CSP_S);  % S

%无ccs火电机组在线容量
rI_onc = value(I_onc);  
rI_ong = value(I_ong);  
rI_onbio = value(I_onbio);  
rdelI_onc = value(delI_onc);  
rdelI_ong = value(delI_ong);  
rdelI_onbio = value(delI_onbio);  
rdelID_onc = value(delID_onc);  
rdelID_ong = value(delID_ong);  
rdelID_onbio = value(delID_onbio);  

%含有ccs火电机组在线容量
rI_oncccs = value(I_oncccs);  
rI_ongccs = value(I_ongccs);  
rI_onbioccs = value(I_onbioccs);  
rdelI_oncccs = value(delI_oncccs);  
rdelI_ongccs = value(delI_ongccs);  
rdelI_onbioccs = value(delI_onbioccs);  
rdelID_oncccs = value(delID_oncccs);  
rdelID_ongccs = value(delID_ongccs);  
rdelID_onbioccs = value(delID_onbioccs);  

% 核电在线容量
rI_onnu = value(I_onnu);  
rdelI_onnu = value(delI_onnu);  
rdelID_onnu = value(delID_onnu);  

% %旋转备用能力
rPhot_c = value(Phot_c);  
rPhot_g = value(Phot_g);  
rPhot_bio = value(Phot_bio);  
rPhot_cccs = value(Phot_cccs);  
rPhot_gccs = value(Phot_gccs);  
rPhot_bioccs = value(Phot_bioccs);  
rPhot_h = value(Phot_h);  
rPhot_nu = value(Phot_nu);  
rPhot_es = value(Phot_es);  
rPhot_ps = value(Phot_ps);  
rPhot_csp = value(Phot_csp);  

rPhot_SLB_LFP = value(Phot_SLB_LFP);  
rPhot_SLB_NCMH = value(Phot_SLB_NCMH);  
rPhot_SLB_NCMM = value(Phot_SLB_NCMM);  
rPhot_SLB_NCML = value(Phot_SLB_NCML);  
rPhot_SLB_NCA = value(Phot_SLB_NCA);  
rPhot_SLB_LMO = value(Phot_SLB_LMO);  

% Phot_IF_DC_from = sdpvar(province_num,province_num,T,24,stage,'full');
rPhot_IF_DC_to = value(Phot_IF_DC_to);  

% 输电线路传输功率  
rP_AC_from = value(P_AC_from);  
rP_AC_to = value(P_AC_to);  
rP_DC_from = value(P_DC_from);  
rP_DC_to = value(P_DC_to);  

% 传输线路建模的辅助变量（auxiliary variables）
rP_AC_forward = value(P_AC_forward);  
rP_AC_back = value(P_AC_back);  
rP_DC_forward = value(P_DC_forward);  

%CCS      
remcap_c = value(emcap_c);   %ccs煤电机组碳捕捉重量
remcap_g = value(emcap_g);  %ccs气电机组碳捕捉重量
remcap_bio = value(emcap_bio);   %ccs气电机组碳捕捉重量
remnet_c = value(emnet_c);   %ccs煤电机组净碳排放量
remnet_g = value(emnet_g);   %ccs气电机组净碳排放量
remnet_bio  = value(emnet_bio);  %ccs气电机组净碳排放量

rP_gofDay = value(P_gofDay);
rH_g = value(H_g);
rH_c = value(H_c);
rH_bio = value(H_bio);
rH_cccs = value(H_cccs);
rH_gccs = value(H_gccs);
rH_bioccs = value(H_bioccs);
rH_nu = value(H_nu);

rH_hydro = value(H_hydro);
rH_es = value(H_es);
rH_ps = value(H_ps);
rH_csp = value(H_csp);
rH_SLB_LFP = value(H_SLB_LFP);
rH_SLB_NCMH = value(H_SLB_NCMH);
rH_SLB_NCMM = value(H_SLB_NCMM);
rH_SLB_NCML = value(H_SLB_NCML);
rH_SLB_NCA = value(H_SLB_NCA);
rH_SLB_LMO = value(H_SLB_LMO);

rc_ope_day = value(c_ope_day);
rc_on_day = value(c_on_day);
rc_ccs_day = value(c_ccs_day);
rc_Lsh_day = value(c_Lsh_day);
rc_Lsh = value(c_Lsh);

 
% prv_capacity_result = [rI_h(:,stage) rI_sc(:,stage) rI_sd(:,stage) rI_won(:,stage) rI_woff(:,stage) rI_nu(:,stage) rI_bio(:,stage) ...
%     rI_bioccs(:,stage) rI_csp(:,stage) rI_c(:,stage) rI_cccs(:,stage) rI_g(:,stage) rI_gccs(:,stage) rI_ps(:,stage) rI_es(:,stage) ...
%     rI_SLB_LFP(:,stage) rI_SLB_NCMH(:,stage) rI_SLB_NCMM(:,stage) rI_SLB_NCMM(:,stage) rI_SLB_NCA(:,stage) rI_SLB_LMO(:,stage)];

AClines=[sum(sum(AC_total_topo_capaity(1,:,:))),sum(sum(AC_total_topo_capaity(2,:,:)))];
DClines=[sum(sum(DC_total_topo_capaity(1,:,:))),sum(sum(DC_total_topo_capaity(2,:,:)))];
rAClines = value(AClines);
rDClines = value(DClines);

% rC = real(C);
%%% cost all results 
% rcc_total_hs_sum = sum(rcc_total_hs); %
% 每一个结果文件的rcc_total_hs_sum：6个阶段的成本，然后用excel累加和排序
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% EncouPolicy
% 全国运输，新电池80%SOH回收，梯次电池40%SOH回收
% All: encou03_trans01_degra80_40 %%%%%%%%%%%%%%%%% baseline
% LFP: encou02_trans01_degra80_40
% 禁止: encou01_trans00_degra80_40

%%% TransPolicy
% 允许所有电池种类，新电池80%SOH回收，梯次电池40%SOH回收
% 全国: encou03_trans01_degra80_40 %%%%%%%%%%%%%%%%% baseline
% 省内: encou03_trans02_degra80_40
% 邻省: encou03_trans03_degra80_40
% 区域内: encou03_trans04_degra80_40

%%% DegraPolicy
% 允许所有电池种类，全国运输
% 01 SLB 80%-40%, New battery 100%-40%: encou03_trans01_degra40
% 02 SLB 80%-60%, New battery 100%-60%: encou03_trans01_degra60
% 03 SLB 80%-40%, New battery 100%-80%: encou03_trans01_degra80_40 %%%%%%%%%%%%%%%%% baseline
% 04 SLB 80%-60%, New battery 100%-80%: encou03_trans01_degra80_60

rI_es_sum = sum(rI_es);
rI_SLB_LFP_sum = sum(rI_SLB_LFP);
rI_SLB_NCMH_sum = sum(rI_SLB_NCMH);
rI_SLB_NCMM_sum = sum(rI_SLB_NCMM);
rI_SLB_NCML_sum = sum(rI_SLB_NCML);
rI_SLB_NCA_sum = sum(rI_SLB_NCA);
rI_SLB_LMO_sum = sum(rI_SLB_LMO);

rI_SLB = [rI_SLB_LFP_sum;rI_SLB_NCMH_sum;rI_SLB_NCMM_sum;rI_SLB_NCML_sum;rI_SLB_NCA_sum;rI_SLB_LMO_sum;...
    rI_SLB_LFP_sum+rI_SLB_NCMH_sum+rI_SLB_NCMM_sum+rI_SLB_NCML_sum+rI_SLB_NCA_sum+rI_SLB_LMO_sum];
rI_Batt = [rI_es_sum;rI_SLB;rI_es_sum+rI_SLB(7,:)];

rdelI_es_sum = sum(rdelI_es);
rdelI_SLB_LFP_sum=sum(rdelI_SLB_LFP);    
rdelI_SLB_NCMH_sum=sum(rdelI_SLB_NCMH);   
rdelI_SLB_NCMM_sum=sum(rdelI_SLB_NCMM);   
rdelI_SLB_NCML_sum=sum(rdelI_SLB_NCML);   
rdelI_SLB_NCA_sum=sum(rdelI_SLB_NCA);   
rdelI_SLB_LMO_sum=sum(rdelI_SLB_LMO); 

rdelI_SLB = [rdelI_SLB_LFP_sum;rdelI_SLB_NCMH_sum;rdelI_SLB_NCMM_sum;rdelI_SLB_NCML_sum;rdelI_SLB_NCA_sum;rdelI_SLB_LMO_sum;...
    rdelI_SLB_LFP_sum+rdelI_SLB_NCMH_sum+rdelI_SLB_NCMM_sum+rdelI_SLB_NCML_sum+rdelI_SLB_NCA_sum+rdelI_SLB_LMO_sum];
rdelI_Batt = [rdelI_es_sum;rdelI_SLB;rdelI_es_sum+rdelI_SLB(7,:)];

rdelIR_es_sum = sum(rdelIR_es);
rdelIR_SLB_LFP_sum=sum(rdelIR_SLB_LFP);
rdelIR_SLB_NCMH_sum=sum(rdelIR_SLB_NCMH);
rdelIR_SLB_NCMM_sum=sum(rdelIR_SLB_NCMM);
rdelIR_SLB_NCML_sum=sum(rdelIR_SLB_NCML);
rdelIR_SLB_NCA_sum=sum(rdelIR_SLB_NCA);
rdelIR_SLB_LMO_sum=sum(rdelIR_SLB_LMO);

rdelIR_SLB = [rdelIR_SLB_LFP_sum;rdelIR_SLB_NCMH_sum;rdelIR_SLB_NCMM_sum;rdelIR_SLB_NCML_sum;rdelIR_SLB_NCA_sum;rdelIR_SLB_LMO_sum;...
    rdelIR_SLB_LFP_sum+rdelIR_SLB_NCMH_sum+rdelIR_SLB_NCMM_sum+rdelIR_SLB_NCML_sum+rdelIR_SLB_NCA_sum+rdelIR_SLB_LMO_sum];
rdelIR_Batt = [rdelIR_es_sum;rdelIR_SLB;rdelIR_es_sum+rdelIR_SLB(7,:)];


rprov_SLB_LFP_COT = value(prov_SLB_LFP_COT);
rprov_SLB_NCMH_COT = value(prov_SLB_NCMH_COT);
rprov_SLB_NCMM_COT = value(prov_SLB_NCMM_COT);
rprov_SLB_NCML_COT = value(prov_SLB_NCML_COT);
rprov_SLB_NCA_COT = value(prov_SLB_NCA_COT);
rprov_SLB_LMO_COT = value(prov_SLB_LMO_COT);

for i = 1:337
    for j = 1:337
        for s = 1:6
            if rdelI_SLB_LFP_COT(i,j,s) < 0
                rdelI_SLB_LFP_COT(i,j,s) = 0;
            end
            if rdelI_SLB_NCMH_COT(i,j,s) < 0
                rdelI_SLB_NCMH_COT(i,j,s) = 0;
            end
            if rdelI_SLB_NCMM_COT(i,j,s) < 0
                rdelI_SLB_NCMM_COT(i,j,s) = 0;
            end
            if rdelI_SLB_NCML_COT(i,j,s) < 0
                rdelI_SLB_NCML_COT(i,j,s) = 0;
            end
            if rdelI_SLB_NCA_COT(i,j,s) < 0
                rdelI_SLB_NCA_COT(i,j,s) = 0;
            end
            if rdelI_SLB_LMO_COT(i,j,s) < 0
                rdelI_SLB_LMO_COT(i,j,s) = 0;
            end
        end
    end
end

rdelI_batt_prov_2030 = [rdelI_es(:,2) rdelI_SLB_LFP(:,2) rdelI_SLB_NCMH(:,2) rdelI_SLB_NCMM(:,2) rdelI_SLB_NCML(:,2) rdelI_SLB_NCA(:,2) rdelI_SLB_LMO(:,2)];
rdelI_batt_prov_2030 = [sum(rdelI_batt_prov_2030,2) rdelI_es(:,2) rdelI_SLB_LFP(:,2) rdelI_SLB_NCMH(:,2) rdelI_SLB_NCMM(:,2) rdelI_SLB_NCML(:,2) rdelI_SLB_NCA(:,2) rdelI_SLB_LMO(:,2)];
rdelI_batt_prov_2035 = [rdelI_es(:,3) rdelI_SLB_LFP(:,3) rdelI_SLB_NCMH(:,3) rdelI_SLB_NCMM(:,3) rdelI_SLB_NCML(:,3) rdelI_SLB_NCA(:,3) rdelI_SLB_LMO(:,3)];
rdelI_batt_prov_2035 = [sum(rdelI_batt_prov_2035,2) rdelI_es(:,3) rdelI_SLB_LFP(:,3) rdelI_SLB_NCMH(:,3) rdelI_SLB_NCMM(:,3) rdelI_SLB_NCML(:,3) rdelI_SLB_NCA(:,3) rdelI_SLB_LMO(:,3)];
rdelI_batt_prov_2040 = [rdelI_es(:,4) rdelI_SLB_LFP(:,4) rdelI_SLB_NCMH(:,4) rdelI_SLB_NCMM(:,4) rdelI_SLB_NCML(:,4) rdelI_SLB_NCA(:,4) rdelI_SLB_LMO(:,4)];
rdelI_batt_prov_2040 = [sum(rdelI_batt_prov_2040,2) rdelI_es(:,4) rdelI_SLB_LFP(:,4) rdelI_SLB_NCMH(:,4) rdelI_SLB_NCMM(:,4) rdelI_SLB_NCML(:,4) rdelI_SLB_NCA(:,4) rdelI_SLB_LMO(:,4)];
rdelI_batt_prov_2045 = [rdelI_es(:,5) rdelI_SLB_LFP(:,5) rdelI_SLB_NCMH(:,5) rdelI_SLB_NCMM(:,5) rdelI_SLB_NCML(:,5) rdelI_SLB_NCA(:,5) rdelI_SLB_LMO(:,5)];
rdelI_batt_prov_2045 = [sum(rdelI_batt_prov_2045,2) rdelI_es(:,5) rdelI_SLB_LFP(:,5) rdelI_SLB_NCMH(:,5) rdelI_SLB_NCMM(:,5) rdelI_SLB_NCML(:,5) rdelI_SLB_NCA(:,5) rdelI_SLB_LMO(:,5)];
rdelI_batt_prov_2050 = [rdelI_es(:,6) rdelI_SLB_LFP(:,6) rdelI_SLB_NCMH(:,6) rdelI_SLB_NCMM(:,6) rdelI_SLB_NCML(:,6) rdelI_SLB_NCA(:,6) rdelI_SLB_LMO(:,6)];
rdelI_batt_prov_2050 = [sum(rdelI_batt_prov_2050,2) rdelI_es(:,6) rdelI_SLB_LFP(:,6) rdelI_SLB_NCMH(:,6) rdelI_SLB_NCMM(:,6) rdelI_SLB_NCML(:,6) rdelI_SLB_NCA(:,6) rdelI_SLB_LMO(:,6)];

rI_batt_prov_2030 = [rI_es(:,2) rI_SLB_LFP(:,2) rI_SLB_NCMH(:,2) rI_SLB_NCMM(:,2) rI_SLB_NCML(:,2) rI_SLB_NCA(:,2) rI_SLB_LMO(:,2)];
rI_batt_prov_2030 = [sum(rI_batt_prov_2030,2) rI_es(:,2) rI_SLB_LFP(:,2) rI_SLB_NCMH(:,2) rI_SLB_NCMM(:,2) rI_SLB_NCML(:,2) rI_SLB_NCA(:,2) rI_SLB_LMO(:,2)];
rI_batt_prov_2035 = [rI_es(:,3) rI_SLB_LFP(:,3) rI_SLB_NCMH(:,3) rI_SLB_NCMM(:,3) rI_SLB_NCML(:,3) rI_SLB_NCA(:,3) rI_SLB_LMO(:,3)];
rI_batt_prov_2035 = [sum(rI_batt_prov_2035,2) rI_es(:,3) rI_SLB_LFP(:,3) rI_SLB_NCMH(:,3) rI_SLB_NCMM(:,3) rI_SLB_NCML(:,3) rI_SLB_NCA(:,3) rI_SLB_LMO(:,3)];
rI_batt_prov_2040 = [rI_es(:,4) rI_SLB_LFP(:,4) rI_SLB_NCMH(:,4) rI_SLB_NCMM(:,4) rI_SLB_NCML(:,4) rI_SLB_NCA(:,4) rI_SLB_LMO(:,4)];
rI_batt_prov_2040 = [sum(rI_batt_prov_2040,2) rI_es(:,4) rI_SLB_LFP(:,4) rI_SLB_NCMH(:,4) rI_SLB_NCMM(:,4) rI_SLB_NCML(:,4) rI_SLB_NCA(:,4) rI_SLB_LMO(:,4)];
rI_batt_prov_2045 = [rI_es(:,5) rI_SLB_LFP(:,5) rI_SLB_NCMH(:,5) rI_SLB_NCMM(:,5) rI_SLB_NCML(:,5) rI_SLB_NCA(:,5) rI_SLB_LMO(:,5)];
rI_batt_prov_2045 = [sum(rI_batt_prov_2045,2) rI_es(:,5) rI_SLB_LFP(:,5) rI_SLB_NCMH(:,5) rI_SLB_NCMM(:,5) rI_SLB_NCML(:,5) rI_SLB_NCA(:,5) rI_SLB_LMO(:,5)];
rI_batt_prov_2050 = [rI_es(:,6) rI_SLB_LFP(:,6) rI_SLB_NCMH(:,6) rI_SLB_NCMM(:,6) rI_SLB_NCML(:,6) rI_SLB_NCA(:,6) rI_SLB_LMO(:,6)];
rI_batt_prov_2050 = [sum(rI_batt_prov_2050,2) rI_es(:,6) rI_SLB_LFP(:,6) rI_SLB_NCMH(:,6) rI_SLB_NCMM(:,6) rI_SLB_NCML(:,6) rI_SLB_NCA(:,6) rI_SLB_LMO(:,6)];

rdelIR_batt_prov_2030 = [rdelIR_es(:,2) rdelIR_SLB_LFP(:,2) rdelIR_SLB_NCMH(:,2) rdelIR_SLB_NCMM(:,2) rdelIR_SLB_NCML(:,2) rdelIR_SLB_NCA(:,2) rdelIR_SLB_LMO(:,2)];
rdelIR_batt_prov_2030 = [sum(rdelIR_batt_prov_2030,2) rdelIR_es(:,2) rdelIR_SLB_LFP(:,2) rdelIR_SLB_NCMH(:,2) rdelIR_SLB_NCMM(:,2) rdelIR_SLB_NCML(:,2) rdelIR_SLB_NCA(:,2) rdelIR_SLB_LMO(:,2)];
rdelIR_batt_prov_2035 = [rdelIR_es(:,3) rdelIR_SLB_LFP(:,3) rdelIR_SLB_NCMH(:,3) rdelI_SLB_NCMM(:,3) rdelI_SLB_NCML(:,3) rdelI_SLB_NCA(:,3) rdelI_SLB_LMO(:,3)];
rdelIR_batt_prov_2035 = [sum(rdelI_batt_prov_2035,2) rdelI_es(:,3) rdelI_SLB_LFP(:,3) rdelI_SLB_NCMH(:,3) rdelI_SLB_NCMM(:,3) rdelI_SLB_NCML(:,3) rdelI_SLB_NCA(:,3) rdelI_SLB_LMO(:,3)];
rdelIR_batt_prov_2040 = [rdelIR_es(:,4) rdelI_SLB_LFP(:,4) rdelI_SLB_NCMH(:,4) rdelI_SLB_NCMM(:,4) rdelI_SLB_NCML(:,4) rdelI_SLB_NCA(:,4) rdelI_SLB_LMO(:,4)];
rdelIR_batt_prov_2040 = [sum(rdelIR_batt_prov_2040,2) rdelI_es(:,4) rdelI_SLB_LFP(:,4) rdelI_SLB_NCMH(:,4) rdelI_SLB_NCMM(:,4) rdelI_SLB_NCML(:,4) rdelI_SLB_NCA(:,4) rdelI_SLB_LMO(:,4)];
rdelIR_batt_prov_2045 = [rdelIR_es(:,5) rdelI_SLB_LFP(:,5) rdelI_SLB_NCMH(:,5) rdelI_SLB_NCMM(:,5) rdelI_SLB_NCML(:,5) rdelI_SLB_NCA(:,5) rdelI_SLB_LMO(:,5)];
rdelIR_batt_prov_2045 = [sum(rdelIR_batt_prov_2045,2) rdelI_es(:,5) rdelI_SLB_LFP(:,5) rdelI_SLB_NCMH(:,5) rdelI_SLB_NCMM(:,5) rdelI_SLB_NCML(:,5) rdelI_SLB_NCA(:,5) rdelI_SLB_LMO(:,5)];
rdelIR_batt_prov_2050 = [rdelI_es(:,6) rdelI_SLB_LFP(:,6) rdelI_SLB_NCMH(:,6) rdelI_SLB_NCMM(:,6) rdelI_SLB_NCML(:,6) rdelI_SLB_NCA(:,6) rdelI_SLB_LMO(:,6)];
rdelIR_batt_prov_2050 = [sum(rdelI_batt_prov_2050,2) rdelI_es(:,6) rdelI_SLB_LFP(:,6) rdelI_SLB_NCMH(:,6) rdelI_SLB_NCMM(:,6) rdelI_SLB_NCML(:,6) rdelI_SLB_NCA(:,6) rdelI_SLB_LMO(:,6)];

rdel_SLB_LFP_COT_2030 = rdelI_SLB_LFP_COT(:,1,2);
rdel_SLB_NCMH_COT_2030 = rdelI_SLB_NCMH_COT(:,1,2);
rdel_SLB_NCMM_COT_2030 = rdelI_SLB_NCMM_COT(:,1,2);
rdel_SLB_NCML_COT_2030 = rdelI_SLB_NCML_COT(:,1,2);
rdel_SLB_NCA_COT_2030 = rdelI_SLB_NCA_COT(:,1,2);
rdel_SLB_LMO_COT_2030 = rdelI_SLB_LMO_COT(:,1,2);

rdel_SLB_LFP_COT_2035 = rdelI_SLB_LFP_COT(:,1,3);
rdel_SLB_NCMH_COT_2035 = rdelI_SLB_NCMH_COT(:,1,3);
rdel_SLB_NCMM_COT_2035 = rdelI_SLB_NCMM_COT(:,1,3);
rdel_SLB_NCML_COT_2035 = rdelI_SLB_NCML_COT(:,1,3);
rdel_SLB_NCA_COT_2035 = rdelI_SLB_NCA_COT(:,1,3);
rdel_SLB_LMO_COT_2035 = rdelI_SLB_LMO_COT(:,1,3);

rdel_SLB_LFP_COT_2040 = rdelI_SLB_LFP_COT(:,1,4);
rdel_SLB_NCMH_COT_2040 = rdelI_SLB_NCMH_COT(:,1,4);
rdel_SLB_NCMM_COT_2040 = rdelI_SLB_NCMM_COT(:,1,4);
rdel_SLB_NCML_COT_2040 = rdelI_SLB_NCML_COT(:,1,4);
rdel_SLB_NCA_COT_2040 = rdelI_SLB_NCA_COT(:,1,4);
rdel_SLB_LMO_COT_2040 = rdelI_SLB_LMO_COT(:,1,4);

rdel_SLB_LFP_COT_2045 = rdelI_SLB_LFP_COT(:,1,5);
rdel_SLB_NCMH_COT_2045 = rdelI_SLB_NCMH_COT(:,1,5);
rdel_SLB_NCMM_COT_2045 = rdelI_SLB_NCMM_COT(:,1,5);
rdel_SLB_NCML_COT_2045 = rdelI_SLB_NCML_COT(:,1,5);
rdel_SLB_NCA_COT_2045 = rdelI_SLB_NCA_COT(:,1,5);
rdel_SLB_LMO_COT_2045 = rdelI_SLB_LMO_COT(:,1,5);

rdel_SLB_LFP_COT_2050 = rdelI_SLB_LFP_COT(:,1,6);
rdel_SLB_NCMH_COT_2050 = rdelI_SLB_NCMH_COT(:,1,6);
rdel_SLB_NCMM_COT_2050 = rdelI_SLB_NCMM_COT(:,1,6);
rdel_SLB_NCML_COT_2050 = rdelI_SLB_NCML_COT(:,1,6);
rdel_SLB_NCA_COT_2050 = rdelI_SLB_NCA_COT(:,1,6);
rdel_SLB_LMO_COT_2050 = rdelI_SLB_LMO_COT(:,1,6);

for i = 2:337
    rdel_SLB_LFP_COT_2030 = [rdel_SLB_LFP_COT_2030;rdelI_SLB_LFP_COT(:,i,2)];
    rdel_SLB_NCMH_COT_2030 = [rdel_SLB_NCMH_COT_2030;rdelI_SLB_NCMH_COT(:,i,2)];
    rdel_SLB_NCMM_COT_2030 = [rdel_SLB_NCMM_COT_2030;rdelI_SLB_NCMM_COT(:,i,2)];
    rdel_SLB_NCML_COT_2030 = [rdel_SLB_NCML_COT_2030;rdelI_SLB_NCML_COT(:,i,2)];
    rdel_SLB_NCA_COT_2030 = [rdel_SLB_NCA_COT_2030;rdelI_SLB_NCA_COT(:,i,2)];
    rdel_SLB_LMO_COT_2030 = [rdel_SLB_LMO_COT_2030;rdelI_SLB_LMO_COT(:,i,2)];

    rdel_SLB_LFP_COT_2035 = [rdel_SLB_LFP_COT_2035;rdelI_SLB_LFP_COT(:,i,3)];
    rdel_SLB_NCMH_COT_2035 = [rdel_SLB_NCMH_COT_2035;rdelI_SLB_NCMH_COT(:,i,3)];
    rdel_SLB_NCMM_COT_2035 = [rdel_SLB_NCMM_COT_2035;rdelI_SLB_NCMM_COT(:,i,3)];
    rdel_SLB_NCML_COT_2035 = [rdel_SLB_NCML_COT_2035;rdelI_SLB_NCML_COT(:,i,3)];
    rdel_SLB_NCA_COT_2035 = [rdel_SLB_NCA_COT_2035;rdelI_SLB_NCA_COT(:,i,3)];
    rdel_SLB_LMO_COT_2035 = [rdel_SLB_LMO_COT_2035;rdelI_SLB_LMO_COT(:,i,3)];
    
    rdel_SLB_LFP_COT_2040 = [rdel_SLB_LFP_COT_2040;rdelI_SLB_LFP_COT(:,i,4)];
    rdel_SLB_NCMH_COT_2040 = [rdel_SLB_NCMH_COT_2040;rdelI_SLB_NCMH_COT(:,i,4)];
    rdel_SLB_NCMM_COT_2040 = [rdel_SLB_NCMM_COT_2040;rdelI_SLB_NCMM_COT(:,i,4)];
    rdel_SLB_NCML_COT_2040 = [rdel_SLB_NCML_COT_2040;rdelI_SLB_NCML_COT(:,i,4)];
    rdel_SLB_NCA_COT_2040 = [rdel_SLB_NCA_COT_2040;rdelI_SLB_NCA_COT(:,i,4)];
    rdel_SLB_LMO_COT_2040 = [rdel_SLB_LMO_COT_2040;rdelI_SLB_LMO_COT(:,i,4)];
    
    rdel_SLB_LFP_COT_2045 = [rdel_SLB_LFP_COT_2045;rdelI_SLB_LFP_COT(:,i,5)];
    rdel_SLB_NCMH_COT_2045 = [rdel_SLB_NCMH_COT_2045;rdelI_SLB_NCMH_COT(:,i,5)];
    rdel_SLB_NCMM_COT_2045 = [rdel_SLB_NCMM_COT_2045;rdelI_SLB_NCMM_COT(:,i,5)];
    rdel_SLB_NCML_COT_2045 = [rdel_SLB_NCML_COT_2045;rdelI_SLB_NCML_COT(:,i,5)];
    rdel_SLB_NCA_COT_2045 = [rdel_SLB_NCA_COT_2045;rdelI_SLB_NCA_COT(:,i,5)];
    rdel_SLB_LMO_COT_2045 = [rdel_SLB_LMO_COT_2045;rdelI_SLB_LMO_COT(:,i,5)];
    
    rdel_SLB_LFP_COT_2050 = [rdel_SLB_LFP_COT_2050;rdelI_SLB_LFP_COT(:,i,6)];
    rdel_SLB_NCMH_COT_2050 = [rdel_SLB_NCMH_COT_2050;rdelI_SLB_NCMH_COT(:,i,6)];
    rdel_SLB_NCMM_COT_2050 = [rdel_SLB_NCMM_COT_2050;rdelI_SLB_NCMM_COT(:,i,6)];
    rdel_SLB_NCML_COT_2050 = [rdel_SLB_NCML_COT_2050;rdelI_SLB_NCML_COT(:,i,6)];
    rdel_SLB_NCA_COT_2050 = [rdel_SLB_NCA_COT_2050;rdelI_SLB_NCA_COT(:,i,6)];
    rdel_SLB_LMO_COT_2050 = [rdel_SLB_LMO_COT_2050;rdelI_SLB_LMO_COT(:,i,6)];
end

rdel_SLB_LFP_COT_2030_ = rdelI_SLB_LFP_COT(:,:,2);
rdel_SLB_LFP_COT_2035_ = rdelI_SLB_LFP_COT(:,:,3);
rdel_SLB_LFP_COT_2040_ = rdelI_SLB_LFP_COT(:,:,4);
rdel_SLB_LFP_COT_2045_ = rdelI_SLB_LFP_COT(:,:,5);
rdel_SLB_LFP_COT_2050_ = rdelI_SLB_LFP_COT(:,:,6);

rdel_SLB_NCMH_COT_2030_ = rdelI_SLB_NCMH_COT(:,:,2);
rdel_SLB_NCMH_COT_2035_ = rdelI_SLB_NCMH_COT(:,:,3);
rdel_SLB_NCMH_COT_2040_ = rdelI_SLB_NCMH_COT(:,:,4);
rdel_SLB_NCMH_COT_2045_ = rdelI_SLB_NCMH_COT(:,:,5);
rdel_SLB_NCMH_COT_2050_ = rdelI_SLB_NCMH_COT(:,:,6);

rdel_SLB_NCMM_COT_2030_ = rdelI_SLB_NCMM_COT(:,:,2);
rdel_SLB_NCMM_COT_2035_ = rdelI_SLB_NCMM_COT(:,:,3);
rdel_SLB_NCMM_COT_2040_ = rdelI_SLB_NCMM_COT(:,:,4);
rdel_SLB_NCMM_COT_2045_ = rdelI_SLB_NCMM_COT(:,:,5);
rdel_SLB_NCMM_COT_2050_ = rdelI_SLB_NCMM_COT(:,:,6);

rdel_SLB_NCML_COT_2030_ = rdelI_SLB_NCML_COT(:,:,2);
rdel_SLB_NCML_COT_2035_ = rdelI_SLB_NCML_COT(:,:,3);
rdel_SLB_NCML_COT_2040_ = rdelI_SLB_NCML_COT(:,:,4);
rdel_SLB_NCML_COT_2045_ = rdelI_SLB_NCML_COT(:,:,5);
rdel_SLB_NCML_COT_2050_ = rdelI_SLB_NCML_COT(:,:,6);

rdel_SLB_NCA_COT_2030_ = rdelI_SLB_NCA_COT(:,:,2);
rdel_SLB_NCA_COT_2035_ = rdelI_SLB_NCA_COT(:,:,3);
rdel_SLB_NCA_COT_2040_ = rdelI_SLB_NCA_COT(:,:,4);
rdel_SLB_NCA_COT_2045_ = rdelI_SLB_NCA_COT(:,:,5);
rdel_SLB_NCA_COT_2050_ = rdelI_SLB_NCA_COT(:,:,6);

rdel_SLB_LMO_COT_2030_ = rdelI_SLB_LMO_COT(:,:,2);
rdel_SLB_LMO_COT_2035_ = rdelI_SLB_LMO_COT(:,:,3);
rdel_SLB_LMO_COT_2040_ = rdelI_SLB_LMO_COT(:,:,4);
rdel_SLB_LMO_COT_2045_ = rdelI_SLB_LMO_COT(:,:,5);
rdel_SLB_LMO_COT_2050_ = rdelI_SLB_LMO_COT(:,:,6);

%%%%%% carbon emission provinces
% for i = 1:31
% emission_cin_prov(i,:) = sum(remission_cin(i,:,:),2);
% end
% emission_cin_sum(:) = sum(sum(remission_cin));
% rc_total_sum = sum(rc_total);
% 
% rdelI_Battery = rdelI_es + rdelI_SLB_LFP + rdelI_SLB_NCMH + rdelI_SLB_NCMM + rdelI_SLB_NCML + rdelI_SLB_NCA + rdelI_SLB_LMO;
% rdelIR_Battery = -(rdelIR_es + rdelIR_SLB_LFP + rdelIR_SLB_NCMH + rdelIR_SLB_NCMM + rdelIR_SLB_NCML + rdelIR_SLB_NCA + rdelIR_SLB_LMO);
% rI_Battery = rI_es + rI_SLB_LFP + rI_SLB_NCMH + rI_SLB_NCMM + rI_SLB_NCML + rI_SLB_NCA + rI_SLB_LMO;
% 
% rdelIR_SLB_LFP = -rdelIR_SLB_LFP;
% rdelIR_es = -rdelIR_es;
% rdelIR_SLB = -rdelIR_SLB;
% rdelIR_SLB_NCMH = -rdelIR_SLB_NCMH;
% rdelIR_SLB_NCMM = -rdelIR_SLB_NCMM;
% rdelIR_SLB_NCML = -rdelIR_SLB_NCML;
% rdelIR_SLB_NCA = -rdelIR_SLB_NCA;
% rdelIR_SLB_LMO = -rdelIR_SLB_LMO;
% rdelIR_Batt = -rdelIR_Batt;
% 
% rdel_SLB_COT_2030 = rdel_SLB_LFP_COT_2030 + rdel_SLB_LMO_COT_2030 + rdel_SLB_NCA_COT_2030 ...
%     + rdel_SLB_NCMH_COT_2030 + rdel_SLB_NCML_COT_2030 + rdel_SLB_NCMM_COT_2030;
% rdel_SLB_COT_2050 = rdel_SLB_LFP_COT_2050 + rdel_SLB_LMO_COT_2050 + rdel_SLB_NCA_COT_2050 ...
%     + rdel_SLB_NCMH_COT_2050 + rdel_SLB_NCML_COT_2050 + rdel_SLB_NCMM_COT_2050;
% 
% %%%%%%%%%%%% city transportation
% % city_name = num2str(337:1);
% city_name = readlines('city_name.txt');
% city_longi_lati2 = readmatrix('city_longi_lati.txt');
% city_COT_num = 337*337;
% for i = 1:city_COT_num
%     city_ = ceil(i/337);
%     city_COT_name2(i,:) = city_name(city_,:);
%     city_COT_longi_lati2(i,:) = city_longi_lati(city_,:);
% end
% 
% city_COT_longi_lati = city_longi_lati;
% city_COT_name = city_name;
% for i = 1:336
%     city_COT_name = [city_COT_name;city_name];
%     city_COT_longi_lati = [city_COT_longi_lati;city_longi_lati];
% end
% 
% City_origin_2030 = 'Origin';
% City_destin_2030 = 'Destination';
% City_x1_y1_2030 = [1,1];
% City_x2_y2_2030 = [2,2];
% City_rdel_SLB_COT_2030 = 0;
% City_origin_2050 = 'Origin';
% City_destin_2050 = 'Destination';
% City_x1_y1_2050 = [1,1];
% City_x2_y2_2050 = [2,2];
% City_rdel_SLB_COT_2050 = 0;
% for i = 1:city_COT_num
%     if rdel_SLB_COT_2030(i,1) > 0
%         City_origin_2030 = [City_origin_2030;city_COT_name(i,:)];
%         City_destin_2030 = [City_destin_2030;city_COT_name2(i,:)];
%         City_x1_y1_2030 = [City_x1_y1_2030;city_COT_longi_lati(i,:)];
%         City_x2_y2_2030 = [City_x2_y2_2030;city_COT_longi_lati2(i,:)];
%         City_rdel_SLB_COT_2030 = [City_rdel_SLB_COT_2030;rdel_SLB_COT_2030(i,1)];
%     end
%     if rdel_SLB_COT_2050(i,1) > 0
%         City_origin_2050 = [City_origin_2050;city_COT_name(i,:)];
%         City_destin_2050 = [City_destin_2050;city_COT_name2(i,:)];
%         City_x1_y1_2050 = [City_x1_y1_2050;city_COT_longi_lati(i,:)];
%         City_x2_y2_2050 = [City_x2_y2_2050;city_COT_longi_lati2(i,:)];
%         City_rdel_SLB_COT_2050 = [City_rdel_SLB_COT_2050;rdel_SLB_COT_2050(i,1)];
% 
%     end
% end
% 
% %%%%%%% how to get the battery leader type
% for i = 1:31
%     matr = rdelI_batt_prov_2030(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leader_2030(i,:) = col;
%     matr = rdelI_batt_prov_2050(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leader_2050(i,:) = col;
%     matr = rdelI_batt_prov_2040(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leader_2040(i,:) = col;
% 
%     matr = rI_batt_prov_2030(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leaderI_2030(i,:) = col;
%     matr = rI_batt_prov_2050(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leaderI_2050(i,:) = col;
%     matr = rI_batt_prov_2040(i,2:8);
%     [max_value, max_index] = max(matr);
%     [row, col] = ind2sub(size(matr), max_index);
%     leaderI_2040(i,:) = col;
% end
% 
% for s=1:stage
%     remission_sum(s) = sum(sum(remission_cin(:,:,s)));
% end
% 
% rc_fom_es_sum = sum(rc_fom_es(:));
% rc_inv_es_sum = sum(rc_inv_es(:));
% 
% SLB_sum = SLB_LFP + SLB_NCMH + SLB_NCMM + SLB_NCML + SLB_NCA +SLB_LMO;
% rdelI_SLB_sum = rdelI_SLB_LFP + rdelI_SLB_NCMH + rdelI_SLB_NCMM + rdelI_SLB_NCML + rdelI_SLB_NCA + rdelI_SLB_LMO;
% 
% for s=1:stage
%     rc_total_hs(:,s) = 1.06^(0-5*s)*rc_total(:,s); 
%     rc_inv_hs(:,s) = 1.06^(0-5*s)*rc_inv(:,s);
%     rc_fom_hs(:,s) = 1.06^(0-5*s)*rc_fom(:,s);
%     rc_ope_hs(:,s) = 1.06^(0-5*s)*rc_ope(:,s);
%     rc_ccs_hs(:,s) = 1.06^(0-5*s)*rc_ccs(:,s);
%     rc_on_hs(:,s) = 1.06^(0-5*s)*rc_on(:,s);
%     rc_Lsh_hs(:,s) = 1.06^(0-5*s)*rc_Lsh(:,s);
%     rc_inv_pw_hs(:,s) = 1.06^(0-5*s)*rc_inv_pw(:,s);
% end
% rc_inv_hs_sum = rc_inv_hs + rc_inv_pw_hs;
% rc_ope_hs_sum = rc_ope_hs + rc_ccs_hs + rc_on_hs + rc_Lsh_hs;
% 
% if sum(rc_inv_SLB_LFP) == 0
%     rc_inv_SLB_LFP = zeros(31,6);
%     rc_fom_SLB_LFP = zeros(31,6);
% end
% if sum(rc_inv_SLB_NCMH) == 0
%     rc_inv_SLB_NCMH = zeros(31,6);
%     rc_fom_SLB_NCMH = zeros(31,6);
% end
% if sum(rc_inv_SLB_NCMM) == 0
%     rc_inv_SLB_NCMM = zeros(31,6);
%     rc_fom_SLB_NCMM = zeros(31,6);
% end
% if sum(rc_inv_SLB_NCML) == 0
%     rc_inv_SLB_NCML = zeros(31,6);
%     rc_fom_SLB_NCML = zeros(31,6);
% end
% if sum(rc_inv_SLB_NCA) == 0
%     rc_inv_SLB_NCA = zeros(31,6);
%     rc_fom_SLB_NCA = zeros(31,6);
% end
% if sum(rc_inv_SLB_LMO) == 0
%     rc_inv_SLB_LMO = zeros(31,6);
%     rc_fom_SLB_LMO = zeros(31,6);
% end
% 
% for prv = 1:province_num
%     for s=1:stage
%         rc_inv_woff(prv,s) = huansuan1(s)*cost_inv(3,s+jd)*rdelI_woff(prv,s,1)*0.07823/1000000;
%         rc_inv_csp(prv,s) = huansuan1(s)*cost_inv(15,s+jd)*rdelI_csp(prv,s,1)*0.068973859/1000000;
%         rc_inv_c(prv,s) = huansuan1(s)*cost_inv(1,s+jd)*rdelI_c(prv,s,1)*0.06646/1000000;
%         rc_inv_g(prv,s) = huansuan1(s)*cost_inv(2,s+jd)*rdelI_g(prv,s,1)*0.06646/1000000;
%         rc_inv_bio(prv,s) = huansuan1(s)*cost_inv(12,s+jd)*rdelI_bio(prv,s,1)*0.06646/1000000;
%         rc_inv_cccs(prv,s) = huansuan1(s)*cost_inv(9,s+jd)*rdelI_cccs(prv,s,1)*0.06646/1000000;
%         rc_inv_gccs(prv,s) = huansuan1(s)*cost_inv(10,s+jd)*rdelI_gccs(prv,s,1)*0.06646/1000000;
%         rc_inv_bioccs(prv,s) = huansuan1(s)*cost_inv(13,s+jd)*rdelI_bioccs(prv,s,1)*0.06646/1000000;
%         rc_inv_h(prv,s) = huansuan1(s)*cost_inv(6,s+jd)*rdelI_h(prv,s,1)*0.06344/1000000;
%         rc_inv_nu(prv,s) = huansuan1(s)*cost_inv(7,s+jd)*rdelI_nu(prv,s,1)*0.06344/1000000;
%         rc_inv_ps(prv,s) = huansuan1(s)*cost_inv(14,s+jd)*rdelI_ps(prv,s,1)*0.06344/1000000;
%         rc_inv_AC(prv,s) = huansuan1(s)*10*0.066461536*(dot(line_cost_AC(1,prv,:),rAC_del_topo_capaity(s,prv,:)))/1000000;
%         rc_inv_DC(prv,s) = huansuan1(s)*10*0.066461536*(dot(line_cost_DC(1,prv,:),rDC_del_topo_capaity(s,prv,:)))/1000000;
%         for i = 1:7
%             rdelI_won_(prv,i,1) = rdelI_won(prv,s,i);
%             rdelI_sc_(prv,i,1) = rdelI_sc(prv,s,i);
%             rdelI_sd_(prv,i,1) = rdelI_sd(prv,s,i);
%         end
%         rc_inv_won(prv,s) = huansuan1(s)*1.2*cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*rdelI_won_(prv,s,:,1))*0.07823/1000000;
%         rc_inv_sc(prv,s) = huansuan1(s)*1.1*cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*rdelI_sc_(prv,:,1))*0.07823/1000000;
%         rc_inv_sd(prv,s) = huansuan1(s)*1.1*cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*rdelI_sd_(prv,:,1))*0.07823/1000000;
%         
%             
%         rc_fom_csp(prv,s) = huansuan1(6)*cost_fom(15,s+jd)*rI_csp(prv,s,1)/1000000;
%         rc_fom_c(prv,s) = huansuan1(6)*cost_fom(1,s+jd)*rI_c(prv,s,1)/1000000;
%         rc_fom_g(prv,s) = huansuan1(6)*cost_fom(2,s+jd)*rI_g(prv,s,1)/1000000;
%         rc_fom_bio(prv,s) = huansuan1(6)*cost_fom(12,s+jd)*rI_bio(prv,s,1)/1000000;
%         rc_fom_cccs(prv,s) = huansuan1(6)*cost_fom(9,s+jd)*rI_cccs(prv,s,1)/1000000;
%         rc_fom_gccs(prv,s) = huansuan1(6)*cost_fom(10,s+jd)*rI_gccs(prv,s,1)/1000000;
%         rc_fom_bioccs(prv,s) = huansuan1(6)*cost_fom(13,s+jd)*rI_bioccs(prv,s,1)/1000000;
%         rc_fom_woff(prv,s) = huansuan1(6)*cost_fom(3,s+jd)*rI_woff(prv,s,1)/1000000;
%         rc_fom_won(prv,s) = huansuan1(6)*cost_fom(4,s+jd)*rI_won(prv,s,1)/1000000;
%         rc_fom_sc(prv,s) = huansuan1(6)*cost_fom(5,s+jd)*rI_sc(prv,s,1)/1000000;
%         rc_fom_sd(prv,s) = huansuan1(6)*cost_fom(11,s+jd)*rI_sd(prv,s,1)/1000000;
%         rc_fom_h(prv,s) = huansuan1(6)*cost_fom(6,s+jd)*rI_h(prv,s,1)/1000000;
%         rc_fom_nu(prv,s) = huansuan1(6)*cost_fom(7,s+jd)*rI_nu(prv,s,1)/1000000;
%         rc_fom_ps(prv,s) = huansuan1(6)*cost_fom(14,s+jd)*rI_ps(prv,s,1)/1000000;
%     end
% end
% rc_inv_details = [rc_inv_es;sum(rc_inv_es);rc_inv_SLB_LFP;sum(rc_inv_SLB_LFP);rc_inv_SLB_NCMH;sum(rc_inv_SLB_NCMH);rc_inv_SLB_NCMM;sum(rc_inv_SLB_NCMM);...
%     rc_inv_SLB_NCML;sum(rc_inv_SLB_NCML);rc_inv_SLB_NCA;sum(rc_inv_SLB_NCA);rc_inv_SLB_LMO;sum(rc_inv_SLB_LMO);rc_inv_ps;sum(rc_inv_ps);...
%     rc_inv_sc;sum(rc_inv_sc);rc_inv_sd;sum(rc_inv_sd);rc_inv_won;sum(rc_inv_won);rc_inv_woff;sum(rc_inv_woff);rc_inv_csp;sum(rc_inv_csp);...
%     rc_inv_bio;sum(rc_inv_bio);rc_inv_cccs;sum(rc_inv_cccs);rc_inv_gccs;sum(rc_inv_gccs);rc_inv_bioccs;sum(rc_inv_bioccs);rc_inv_nu;sum(rc_inv_nu);rc_inv_h;sum(rc_inv_h);...
%     rc_inv_c;sum(rc_inv_c);rc_inv_g;sum(rc_inv_g);rc_inv_AC;sum(rc_inv_AC);rc_inv_DC;sum(rc_inv_DC)];
% rc_fom_details = [rc_fom_es;sum(rc_fom_es);rc_fom_SLB_LFP;sum(rc_fom_SLB_LFP);rc_fom_SLB_NCMH;sum(rc_fom_SLB_NCMH);rc_fom_SLB_NCMM;sum(rc_fom_SLB_NCMM);...
%     rc_fom_SLB_NCML;sum(rc_fom_SLB_NCML);rc_fom_SLB_NCA;sum(rc_fom_SLB_NCA);rc_fom_SLB_LMO;sum(rc_fom_SLB_LMO);rc_fom_ps;sum(rc_fom_ps);...
%     rc_fom_sc;sum(rc_fom_sc);rc_fom_sd;sum(rc_fom_sd);rc_fom_won;sum(rc_fom_won);rc_fom_woff;sum(rc_fom_woff);rc_fom_csp;sum(rc_fom_csp);...
%     rc_fom_bio;sum(rc_fom_bio);rc_fom_cccs;sum(rc_fom_cccs);rc_fom_gccs;sum(rc_fom_gccs);rc_fom_bioccs;sum(rc_fom_bioccs);rc_fom_nu;sum(rc_fom_nu);rc_fom_h;sum(rc_fom_h);...
%     rc_fom_c;sum(rc_fom_c);rc_fom_g;sum(rc_fom_g)];
% 
% rc_inv_details2 = [rc_inv_es rc_inv_SLB_LFP rc_inv_SLB_NCMH rc_inv_SLB_NCMM rc_inv_SLB_NCML rc_inv_SLB_NCA rc_inv_SLB_LMO rc_inv_ps ...
%     rc_inv_sc rc_inv_sd rc_inv_won rc_inv_woff rc_inv_csp rc_inv_bio rc_inv_cccs rc_inv_gccs rc_inv_bioccs rc_inv_nu rc_inv_h ...
%     rc_inv_c rc_inv_g rc_inv_AC rc_inv_DC;
%     sum(rc_inv_es) sum(rc_inv_SLB_LFP) sum(rc_inv_SLB_NCMH) sum(rc_inv_SLB_NCMM) sum(rc_inv_SLB_NCML) sum(rc_inv_SLB_NCA) sum(rc_inv_SLB_LMO) sum(rc_inv_ps) ...
%     sum(rc_inv_sc) sum(rc_inv_sd) sum(rc_inv_won) sum(rc_inv_woff) sum(rc_inv_csp) sum(rc_inv_bio) sum(rc_inv_cccs) sum(rc_inv_gccs) sum(rc_inv_bioccs) sum(rc_inv_nu) sum(rc_inv_h) ...
%     sum(rc_inv_c) sum(rc_inv_g) sum(rc_inv_AC) sum(rc_inv_DC)];
% % rc_fom_details2 = [rc_fom_es;sum(rc_fom_es);rc_fom_SLB_LFP;sum(rc_fom_SLB_LFP);rc_fom_SLB_NCMH;sum(rc_fom_SLB_NCMH);rc_fom_SLB_NCMM;sum(rc_fom_SLB_NCMM);...
% %     rc_fom_SLB_NCML;sum(rc_fom_SLB_NCML);rc_fom_SLB_NCA;sum(rc_fom_SLB_NCA);rc_fom_SLB_LMO;sum(rc_fom_SLB_LMO);rc_fom_ps;sum(rc_fom_ps);...
% %     rc_fom_sc;sum(rc_fom_sc);rc_fom_sd;sum(rc_fom_sd);rc_fom_won;sum(rc_fom_won);rc_fom_woff;sum(rc_fom_woff);rc_fom_csp;sum(rc_fom_csp);...
% %     rc_fom_bio;sum(rc_fom_bio);rc_fom_cccs;sum(rc_fom_cccs);rc_fom_gccs;sum(rc_fom_gccs);rc_fom_bioccs;sum(rc_fom_bioccs);rc_fom_nu;sum(rc_fom_nu);rc_fom_h;sum(rc_fom_h);...
% %     rc_fom_c;sum(rc_fom_c);rc_fom_g;sum(rc_fom_g)];
% 
% 
% % sc:集中式光伏 sd:分布式光伏 won:陆上风电 woff:海上风电 es:电化学储能 ps:抽水蓄能 csp:聚光太阳能 c:煤炭 g:天然气  
% % bio:生物质能 cccs:煤炭ccs gccs:天然气ccs bioccs:生物质能ccs  nu: 核电 h: 水电
% 
% 
% for s=1:stage
%     rc_inv_woff_hs(:,s) = 1.06^(0-5*s)*rc_inv_woff(:,s); 
%     rc_inv_csp_hs(:,s) = 1.06^(0-5*s)*rc_inv_csp(:,s);
%     rc_inv_c_hs(:,s) = 1.06^(0-5*s)*rc_inv_c(:,s);
%     rc_inv_g_hs(:,s) = 1.06^(0-5*s)*rc_inv_g(:,s);
%     rc_inv_bio_hs(:,s) = 1.06^(0-5*s)*rc_inv_bio(:,s);
%     rc_inv_cccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_cccs(:,s);
%     rc_inv_gccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_gccs(:,s);
%     rc_inv_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_bioccs(:,s);
%     rc_inv_h_hs(:,s) = 1.06^(0-5*s)*rc_inv_h(:,s); 
%     rc_inv_nu_hs(:,s) = 1.06^(0-5*s)*rc_inv_nu(:,s);
%     rc_inv_ps_hs(:,s) = 1.06^(0-5*s)*rc_inv_ps(:,s);
%     rc_inv_AC_hs(:,s) = 1.06^(0-5*s)*rc_inv_AC(:,s);
%     rc_inv_DC_hs(:,s) = 1.06^(0-5*s)*rc_inv_DC(:,s);
%     rc_inv_won_hs(:,s) = 1.06^(0-5*s)*rc_inv_won(:,s);
%     rc_inv_sc_hs(:,s) = 1.06^(0-5*s)*rc_inv_sc(:,s);
%     rc_inv_sd_hs(:,s) = 1.06^(0-5*s)*rc_inv_sd(:,s);
%     rc_inv_details_hs(:,s) = 1.06^(0-5*s)*rc_inv_details(:,s);
%     rc_inv_details2_hs(:,s) = 1.06^(0-5*s)*rc_inv_details2(:,s);
% 
%     rc_fom_woff_hs(:,s) = 1.06^(0-5*s)*rc_fom_woff(:,s);
%     rc_fom_csp_hs(:,s) = 1.06^(0-5*s)*rc_fom_csp(:,s);
%     rc_fom_c_hs(:,s) = 1.06^(0-5*s)*rc_fom_c(:,s);
%     rc_fom_g_hs(:,s) = 1.06^(0-5*s)*rc_fom_g(:,s);
%     rc_fom_bio_hs(:,s) = 1.06^(0-5*s)*rc_fom_bio(:,s);
%     rc_fom_cccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_cccs(:,s);
%     rc_fom_gccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_gccs(:,s);
%     rc_fom_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_bioccs(:,s);
%     rc_fom_h_hs(:,s) = 1.06^(0-5*s)*rc_fom_h(:,s); 
%     rc_fom_nu_hs(:,s) = 1.06^(0-5*s)*rc_fom_nu(:,s);
%     rc_fom_ps_hs(:,s) = 1.06^(0-5*s)*rc_fom_ps(:,s);
%     rc_fom_won_hs(:,s) = 1.06^(0-5*s)*rc_fom_won(:,s);
%     rc_fom_sc_hs(:,s) = 1.06^(0-5*s)*rc_fom_sc(:,s);
%     rc_fom_sd_hs(:,s) = 1.06^(0-5*s)*rc_fom_sd(:,s);
%     rc_fom_details_hs(:,s) = 1.06^(0-5*s)*rc_fom_details(:,s);
% 
% end
% 
% 
% for prv = 1:province_num
%     for s=1:stage
%         for d=1:12
%             rc_ope_day_csp(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(15,s+jd)*sum(rP_csp(prv,d,:,s)))/1000000;
%             rc_ope_day_c(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(1,s+jd)*sum(rP_c(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(1.1*sum(rdelI_onc(prv,d,:,s)))/(10^3);
%             rc_ope_day_g(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(2,s+jd)*sum(rP_g(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.3*sum(rdelI_ong(prv,d,:,s)))/(10^3);
%             rc_ope_day_bio(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(12,s+jd)*sum(rP_bio(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.5*sum(rdelI_onbio(prv,d,:,s)))/(10^3);
%             rc_ope_day_cccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(9,s+jd)*sum(rP_cccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(1.1*sum(rdelI_oncccs(prv,d,:,s)))/(10^3);
%             rc_ope_day_gccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(10,s+jd)*sum(rP_gccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.3*sum(rdelI_ongccs(prv,d,:,s)))/(10^3);
%             rc_ope_day_bioccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(13,s+jd)*sum(rP_bioccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.5*sum(rdelI_onbioccs(prv,d,:,s)))/(10^3);
%             rc_ope_day_nu(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(7,s+jd)*sum(rP_nu(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(22*sum(rdelI_onnu(prv,d,:,s)))/(10^3);
%             % ccs成本 单位：10亿CNY
%             rc_ope_day_ccs(prv,s,d) =  huansuan1(6)*Day_num(d)*(390.8*sum(remcap_c(prv,d,:,s)) + 305.4*sum(remcap_g(prv,d,:,s)) + 305.4*sum(remcap_bio(prv,d,:,s)))/(10^9);
%             % Load shedding cost
%             rc_ope_day_Lsh(prv,s,d) =  huansuan1(6)*Day_num(d)*(3*sum(rP_loadshedding(prv,d,:,s)))/(10^3);
%                         
%         end
%     end
% end
% for prv = 1:province_num
%     for s=1:stage
%         rc_ope_csp(prv,s) = sum(rc_ope_day_csp(prv,s,:));
%         rc_ope_c(prv,s) = sum(rc_ope_day_c(prv,s,:));
%         rc_ope_g(prv,s) = sum(rc_ope_day_g(prv,s,:));
%         rc_ope_bio(prv,s) = sum(rc_ope_day_bio(prv,s,:));
%         rc_ope_cccs(prv,s) = sum(rc_ope_day_cccs(prv,s,:));
%         rc_ope_gccs(prv,s) = sum(rc_ope_day_gccs(prv,s,:));
%         rc_ope_bioccs(prv,s) = sum(rc_ope_day_bioccs(prv,s,:));
%         rc_ope_nu(prv,s) = sum(rc_ope_day_nu(prv,s,:));
%         rc_ope_ccs(prv,s) = sum(rc_ope_day_ccs(prv,s,:));
%         rc_ope_Lsh(prv,s) = sum(rc_ope_day_Lsh(prv,s,:));
%     end
% end
% rc_ope_details = [rc_ope_csp;sum(rc_ope_csp);rc_ope_c;sum(rc_ope_c);rc_ope_g;sum(rc_ope_g);rc_ope_bio;sum(rc_ope_bio);...
%     rc_ope_cccs;sum(rc_ope_cccs);rc_ope_gccs;sum(rc_ope_gccs);rc_ope_bioccs;sum(rc_ope_bioccs);rc_ope_nu;sum(rc_ope_nu);...
%     rc_ope_ccs;sum(rc_ope_ccs);rc_ope_Lsh;sum(rc_ope_Lsh)];
% 
% for s=1:stage
%     rc_ope_csp_hs(:,s) = 1.06^(0-5*s)*rc_ope_csp(:,s); 
%     rc_ope_c_hs(:,s) = 1.06^(0-5*s)*rc_ope_c(:,s);
%     rc_ope_g_hs(:,s) = 1.06^(0-5*s)*rc_ope_g(:,s);
%     rc_ope_bio_hs(:,s) = 1.06^(0-5*s)*rc_ope_bio(:,s);
%     rc_ope_cccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_cccs(:,s);
%     rc_ope_gccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_gccs(:,s);
%     rc_ope_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_bioccs(:,s);
%     rc_ope_nu_hs(:,s) = 1.06^(0-5*s)*rc_ope_nu(:,s);
%     rc_ope_ccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_ccs(:,s); 
%     rc_ope_Lsh_hs(:,s) = 1.06^(0-5*s)*rc_ope_Lsh(:,s);
%     rc_ope_details_hs(:,s) = 1.06^(0-5*s)*rc_ope_details(:,s);
% %     rc_inv_details2_hs(:,s) = 1.06^(0-5*s)*rc_inv_details2(:,s);
% 
% end

save('result.mat'); 