
for i = 1:31
emission_cin_prov(i,:) = sum(remission_cin(i,:,:),2);
end
emission_cin_sum(:) = sum(sum(remission_cin));
rc_total_sum = sum(rc_total);

rdelI_Battery = rdelI_es + rdelI_SLB_LFP + rdelI_SLB_NCMH + rdelI_SLB_NCMM + rdelI_SLB_NCML + rdelI_SLB_NCA + rdelI_SLB_LMO;
rdelIR_Battery = -(rdelIR_es + rdelIR_SLB_LFP + rdelIR_SLB_NCMH + rdelIR_SLB_NCMM + rdelIR_SLB_NCML + rdelIR_SLB_NCA + rdelIR_SLB_LMO);
rI_Battery = rI_es + rI_SLB_LFP + rI_SLB_NCMH + rI_SLB_NCMM + rI_SLB_NCML + rI_SLB_NCA + rI_SLB_LMO;

rdelIR_SLB_LFP = -rdelIR_SLB_LFP;
rdelIR_es = -rdelIR_es;
rdelIR_SLB = -rdelIR_SLB;
rdelIR_SLB_NCMH = -rdelIR_SLB_NCMH;
rdelIR_SLB_NCMM = -rdelIR_SLB_NCMM;
rdelIR_SLB_NCML = -rdelIR_SLB_NCML;
rdelIR_SLB_NCA = -rdelIR_SLB_NCA;
rdelIR_SLB_LMO = -rdelIR_SLB_LMO;
rdelIR_Batt = -rdelIR_Batt;

rdel_SLB_COT_2030 = rdel_SLB_LFP_COT_2030 + rdel_SLB_LMO_COT_2030 + rdel_SLB_NCA_COT_2030 ...
    + rdel_SLB_NCMH_COT_2030 + rdel_SLB_NCML_COT_2030 + rdel_SLB_NCMM_COT_2030;
rdel_SLB_COT_2040 = rdel_SLB_LFP_COT_2040 + rdel_SLB_LMO_COT_2040 + rdel_SLB_NCA_COT_2040 ...
    + rdel_SLB_NCMH_COT_2040 + rdel_SLB_NCML_COT_2040 + rdel_SLB_NCMM_COT_2040;
rdel_SLB_COT_2050 = rdel_SLB_LFP_COT_2050 + rdel_SLB_LMO_COT_2050 + rdel_SLB_NCA_COT_2050 ...
    + rdel_SLB_NCMH_COT_2050 + rdel_SLB_NCML_COT_2050 + rdel_SLB_NCMM_COT_2050;

%%%%%%% how to get the battery leader type
for i = 1:31
    matr = rdelI_batt_prov_2030(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leader_2030(i,:) = col;
    matr = rdelI_batt_prov_2050(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leader_2050(i,:) = col;
    matr = rdelI_batt_prov_2040(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leader_2040(i,:) = col;

    matr = rI_batt_prov_2030(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leaderI_2030(i,:) = col;
    matr = rI_batt_prov_2050(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leaderI_2050(i,:) = col;
    matr = rI_batt_prov_2040(i,2:8);
    [max_value, max_index] = max(matr);
    [row, col] = ind2sub(size(matr), max_index);
    leaderI_2040(i,:) = col;
end

for s=1:stage
    remission_sum(s) = sum(sum(remission_cin(:,:,s)));
end

rc_fom_es_sum = sum(rc_fom_es(:));
rc_inv_es_sum = sum(rc_inv_es(:));

SLB_sum = SLB_LFP + SLB_NCMH + SLB_NCMM + SLB_NCML + SLB_NCA +SLB_LMO;
rdelI_SLB_sum = rdelI_SLB_LFP + rdelI_SLB_NCMH + rdelI_SLB_NCMM + rdelI_SLB_NCML + rdelI_SLB_NCA + rdelI_SLB_LMO;
rdelIR_SLB_sum = rdelIR_SLB_LFP + rdelIR_SLB_NCMH + rdelIR_SLB_NCMM + rdelIR_SLB_NCML + rdelIR_SLB_NCA + rdelIR_SLB_LMO;
rI_SLB_sum = rI_SLB_LFP + rI_SLB_NCMH + rI_SLB_NCMM + rI_SLB_NCML + rI_SLB_NCA + rI_SLB_LMO;

for s=1:stage
    rc_total_hs(:,s) = 1.06^(0-5*s)*rc_total(:,s); 
    rc_inv_hs(:,s) = 1.06^(0-5*s)*rc_inv(:,s);
    rc_fom_hs(:,s) = 1.06^(0-5*s)*rc_fom(:,s);
    rc_ope_hs(:,s) = 1.06^(0-5*s)*rc_ope(:,s);
    rc_ccs_hs(:,s) = 1.06^(0-5*s)*rc_ccs(:,s);
    rc_on_hs(:,s) = 1.06^(0-5*s)*rc_on(:,s);
    rc_Lsh_hs(:,s) = 1.06^(0-5*s)*rc_Lsh(:,s);
    rc_inv_pw_hs(:,s) = 1.06^(0-5*s)*rc_inv_pw(:,s);
end
rc_inv_hs_sum = rc_inv_hs + rc_inv_pw_hs;
rc_ope_hs_sum = rc_ope_hs + rc_ccs_hs + rc_on_hs + rc_Lsh_hs;

if sum(rc_inv_SLB_LFP) == 0
    rc_inv_SLB_LFP = zeros(31,6);
    rc_fom_SLB_LFP = zeros(31,6);
end
if sum(rc_inv_SLB_NCMH) == 0
    rc_inv_SLB_NCMH = zeros(31,6);
    rc_fom_SLB_NCMH = zeros(31,6);
end
if sum(rc_inv_SLB_NCMM) == 0
    rc_inv_SLB_NCMM = zeros(31,6);
    rc_fom_SLB_NCMM = zeros(31,6);
end
if sum(rc_inv_SLB_NCML) == 0
    rc_inv_SLB_NCML = zeros(31,6);
    rc_fom_SLB_NCML = zeros(31,6);
end
if sum(rc_inv_SLB_NCA) == 0
    rc_inv_SLB_NCA = zeros(31,6);
    rc_fom_SLB_NCA = zeros(31,6);
end
if sum(rc_inv_SLB_LMO) == 0
    rc_inv_SLB_LMO = zeros(31,6);
    rc_fom_SLB_LMO = zeros(31,6);
end

rdelI_onbio1= sum(sum(rdelI_onbio,3),2);
rdelI_onbio1 = squeeze(rdelI_onbio1);
rdelI_onbioccs1= sum(sum(rdelI_onbioccs,3),2);
rdelI_onbioccs1 = squeeze(rdelI_onbioccs1);
rdelI_onnu1= sum(sum(rdelI_onnu,3),2);
rdelI_onnu1 = squeeze(rdelI_onnu1);
rdelI_onc1= sum(sum(rdelI_onc,3),2);
rdelI_onc1 = squeeze(rdelI_onc1);
rdelI_oncccs1= sum(sum(rdelI_oncccs,3),2);
rdelI_oncccs1 = squeeze(rdelI_oncccs1);
rdelI_ong1= sum(sum(rdelI_ong,3),2);
rdelI_ong1 = squeeze(rdelI_ong1);
rdelI_ongccs1= sum(sum(rdelI_ongccs,3),2);
rdelI_ongccs1 = squeeze(rdelI_ongccs1);
rdelI_sc1= sum(rdelI_sc,3);
rdelI_sd1= sum(rdelI_sd,3);
rdelI_won1 = sum(rdelI_won,3);
rdelIR_sc1= sum(rdelIR_sc,3);
rdelIR_sd1= sum(rdelIR_sd,3);
rdelIR_won1 = sum(rdelIR_won,3);

for prv = 1:province_num
    for s=1:stage
        rc_inv_woff(prv,s) = huansuan1(s)*cost_inv(3,s+jd)*rdelI_woff(prv,s,1)*0.07823/1000000;
        rc_inv_csp(prv,s) = huansuan1(s)*cost_inv(15,s+jd)*rdelI_csp(prv,s,1)*0.068973859/1000000;
        rc_inv_c(prv,s) = huansuan1(s)*cost_inv(1,s+jd)*rdelI_c(prv,s,1)*0.06646/1000000;
        rc_inv_g(prv,s) = huansuan1(s)*cost_inv(2,s+jd)*rdelI_g(prv,s,1)*0.06646/1000000;
        rc_inv_bio(prv,s) = huansuan1(s)*cost_inv(12,s+jd)*rdelI_bio(prv,s,1)*0.06646/1000000;
        rc_inv_cccs(prv,s) = huansuan1(s)*cost_inv(9,s+jd)*rdelI_cccs(prv,s,1)*0.06646/1000000;
        rc_inv_gccs(prv,s) = huansuan1(s)*cost_inv(10,s+jd)*rdelI_gccs(prv,s,1)*0.06646/1000000;
        rc_inv_bioccs(prv,s) = huansuan1(s)*cost_inv(13,s+jd)*rdelI_bioccs(prv,s,1)*0.06646/1000000;
        rc_inv_h(prv,s) = huansuan1(s)*cost_inv(6,s+jd)*rdelI_h(prv,s,1)*0.06344/1000000;
        rc_inv_nu(prv,s) = huansuan1(s)*cost_inv(7,s+jd)*rdelI_nu(prv,s,1)*0.06344/1000000;
        rc_inv_ps(prv,s) = huansuan1(s)*cost_inv(14,s+jd)*rdelI_ps(prv,s,1)*0.06344/1000000;
        rc_inv_AC(prv,s) = huansuan1(s)*10*0.066461536*(dot(line_cost_AC(1,prv,:),rAC_del_topo_capaity(s,prv,:)))/1000000;
        rc_inv_DC(prv,s) = huansuan1(s)*10*0.066461536*(dot(line_cost_DC(1,prv,:),rDC_del_topo_capaity(s,prv,:)))/1000000;
%         for i = 1:7
%             rdelI_won_(prv,i,1) = rdelI_won(prv,s,i);
%             rdelI_sc_(prv,i,1) = rdelI_sc(prv,s,i);
%             rdelI_sd_(prv,i,1) = rdelI_sd(prv,s,i);
%         end

for i = 1:7
    rdelI_won2(1,i) = rdelI_won(prv,s,i);
    rdelI_sc2(1,i) = rdelI_sc(prv,s,i);
    rdelI_sd2(1,i) = rdelI_sd(prv,s,i);

end
        rc_inv_won(prv,s) = huansuan1(s)*1.2*cap_factor_onwind(prv)*cost_inv(4,s+jd)*sum(cost_won_pw(prv,:,1).*rdelI_won2(1,:))*0.07823/1000000;
        rc_inv_sc(prv,s) = huansuan1(s)*1.1*cap_factor_pv(prv)*cost_inv(5,s+jd)*sum(cost_pv_pw(prv,:,1).*rdelI_sc2(1,:))*0.07823/1000000;
        rc_inv_sd(prv,s) = huansuan1(s)*1.1*cap_factor_pv(prv)*cost_inv(11,s+jd)*sum(cost_pv_pw(prv,:,1).*rdelI_sd2(1,:))*0.07823/1000000;
        
            
        rc_fom_csp(prv,s) = huansuan1(6)*cost_fom(15,s+jd)*rI_csp(prv,s,1)/1000000;
        rc_fom_c(prv,s) = huansuan1(6)*cost_fom(1,s+jd)*rI_c(prv,s,1)/1000000;
        rc_fom_g(prv,s) = huansuan1(6)*cost_fom(2,s+jd)*rI_g(prv,s,1)/1000000;
        rc_fom_bio(prv,s) = huansuan1(6)*cost_fom(12,s+jd)*rI_bio(prv,s,1)/1000000;
        rc_fom_cccs(prv,s) = huansuan1(6)*cost_fom(9,s+jd)*rI_cccs(prv,s,1)/1000000;
        rc_fom_gccs(prv,s) = huansuan1(6)*cost_fom(10,s+jd)*rI_gccs(prv,s,1)/1000000;
        rc_fom_bioccs(prv,s) = huansuan1(6)*cost_fom(13,s+jd)*rI_bioccs(prv,s,1)/1000000;
        rc_fom_woff(prv,s) = huansuan1(6)*cost_fom(3,s+jd)*rI_woff(prv,s,1)/1000000;
        rc_fom_won(prv,s) = huansuan1(6)*cost_fom(4,s+jd)*rI_won(prv,s,1)/1000000;
        rc_fom_sc(prv,s) = huansuan1(6)*cost_fom(5,s+jd)*rI_sc(prv,s,1)/1000000;
        rc_fom_sd(prv,s) = huansuan1(6)*cost_fom(11,s+jd)*rI_sd(prv,s,1)/1000000;
        rc_fom_h(prv,s) = huansuan1(6)*cost_fom(6,s+jd)*rI_h(prv,s,1)/1000000;
        rc_fom_nu(prv,s) = huansuan1(6)*cost_fom(7,s+jd)*rI_nu(prv,s,1)/1000000;
        rc_fom_ps(prv,s) = huansuan1(6)*cost_fom(14,s+jd)*rI_ps(prv,s,1)/1000000;
    end
end
rc_inv_ess = [rc_inv_es + rc_inv_SLB_LFP + rc_inv_SLB_NCMH + rc_inv_SLB_NCMM + rc_inv_SLB_NCML + rc_inv_SLB_NCA + rc_inv_SLB_LMO + rc_inv_ps; ...
    sum(rc_inv_es) + sum(rc_inv_SLB_LFP) + sum(rc_inv_SLB_NCMH) + sum(rc_inv_SLB_NCMM) + sum(rc_inv_SLB_NCML) + sum(rc_inv_SLB_NCA) + sum(rc_inv_SLB_LMO) + sum(rc_inv_ps)];
rc_inv_var_gene = [rc_inv_sc + rc_inv_sd + rc_inv_won + rc_inv_woff + rc_inv_csp + rc_inv_bio + rc_inv_cccs + rc_inv_gccs + rc_inv_bioccs + rc_inv_nu + rc_inv_h; ...
    sum(rc_inv_sc) + sum(rc_inv_sd) + sum(rc_inv_won) + sum(rc_inv_woff) + sum(rc_inv_csp) + sum(rc_inv_bio) + sum(rc_inv_cccs) + sum(rc_inv_gccs) + sum(rc_inv_bioccs) + sum(rc_inv_nu) + sum(rc_inv_h)];
rc_inv_oth_gene = [rc_inv_c + rc_inv_g; sum(rc_inv_c) + sum(rc_inv_g)];

rc_inv_details = [rc_inv_es;sum(rc_inv_es);rc_inv_SLB_LFP;sum(rc_inv_SLB_LFP);rc_inv_SLB_NCMH;sum(rc_inv_SLB_NCMH);rc_inv_SLB_NCMM;sum(rc_inv_SLB_NCMM);...
    rc_inv_SLB_NCML;sum(rc_inv_SLB_NCML);rc_inv_SLB_NCA;sum(rc_inv_SLB_NCA);rc_inv_SLB_LMO;sum(rc_inv_SLB_LMO);rc_inv_ps;sum(rc_inv_ps);...
    rc_inv_sc;sum(rc_inv_sc);rc_inv_sd;sum(rc_inv_sd);rc_inv_won;sum(rc_inv_won);rc_inv_woff;sum(rc_inv_woff);rc_inv_csp;sum(rc_inv_csp);...
    rc_inv_bio;sum(rc_inv_bio);rc_inv_cccs;sum(rc_inv_cccs);rc_inv_gccs;sum(rc_inv_gccs);rc_inv_bioccs;sum(rc_inv_bioccs);rc_inv_nu;sum(rc_inv_nu);rc_inv_h;sum(rc_inv_h);...
    rc_inv_c;sum(rc_inv_c);rc_inv_g;sum(rc_inv_g);rc_inv_AC;sum(rc_inv_AC);rc_inv_DC;sum(rc_inv_DC)];
rc_fom_details = [rc_fom_es;sum(rc_fom_es);rc_fom_SLB_LFP;sum(rc_fom_SLB_LFP);rc_fom_SLB_NCMH;sum(rc_fom_SLB_NCMH);rc_fom_SLB_NCMM;sum(rc_fom_SLB_NCMM);...
    rc_fom_SLB_NCML;sum(rc_fom_SLB_NCML);rc_fom_SLB_NCA;sum(rc_fom_SLB_NCA);rc_fom_SLB_LMO;sum(rc_fom_SLB_LMO);rc_fom_ps;sum(rc_fom_ps);...
    rc_fom_sc;sum(rc_fom_sc);rc_fom_sd;sum(rc_fom_sd);rc_fom_won;sum(rc_fom_won);rc_fom_woff;sum(rc_fom_woff);rc_fom_csp;sum(rc_fom_csp);...
    rc_fom_bio;sum(rc_fom_bio);rc_fom_cccs;sum(rc_fom_cccs);rc_fom_gccs;sum(rc_fom_gccs);rc_fom_bioccs;sum(rc_fom_bioccs);rc_fom_nu;sum(rc_fom_nu);rc_fom_h;sum(rc_fom_h);...
    rc_fom_c;sum(rc_fom_c);rc_fom_g;sum(rc_fom_g)];

rc_inv_details2 = [rc_inv_es rc_inv_SLB_LFP rc_inv_SLB_NCMH rc_inv_SLB_NCMM rc_inv_SLB_NCML rc_inv_SLB_NCA rc_inv_SLB_LMO rc_inv_ps ...
    rc_inv_sc rc_inv_sd rc_inv_won rc_inv_woff rc_inv_csp rc_inv_bio rc_inv_cccs rc_inv_gccs rc_inv_bioccs rc_inv_nu rc_inv_h ...
    rc_inv_c rc_inv_g rc_inv_AC rc_inv_DC;
    sum(rc_inv_es) sum(rc_inv_SLB_LFP) sum(rc_inv_SLB_NCMH) sum(rc_inv_SLB_NCMM) sum(rc_inv_SLB_NCML) sum(rc_inv_SLB_NCA) sum(rc_inv_SLB_LMO) sum(rc_inv_ps) ...
    sum(rc_inv_sc) sum(rc_inv_sd) sum(rc_inv_won) sum(rc_inv_woff) sum(rc_inv_csp) sum(rc_inv_bio) sum(rc_inv_cccs) sum(rc_inv_gccs) sum(rc_inv_bioccs) sum(rc_inv_nu) sum(rc_inv_h) ...
    sum(rc_inv_c) sum(rc_inv_g) sum(rc_inv_AC) sum(rc_inv_DC)];
% rc_fom_details2 = [rc_fom_es;sum(rc_fom_es);rc_fom_SLB_LFP;sum(rc_fom_SLB_LFP);rc_fom_SLB_NCMH;sum(rc_fom_SLB_NCMH);rc_fom_SLB_NCMM;sum(rc_fom_SLB_NCMM);...
%     rc_fom_SLB_NCML;sum(rc_fom_SLB_NCML);rc_fom_SLB_NCA;sum(rc_fom_SLB_NCA);rc_fom_SLB_LMO;sum(rc_fom_SLB_LMO);rc_fom_ps;sum(rc_fom_ps);...
%     rc_fom_sc;sum(rc_fom_sc);rc_fom_sd;sum(rc_fom_sd);rc_fom_won;sum(rc_fom_won);rc_fom_woff;sum(rc_fom_woff);rc_fom_csp;sum(rc_fom_csp);...
%     rc_fom_bio;sum(rc_fom_bio);rc_fom_cccs;sum(rc_fom_cccs);rc_fom_gccs;sum(rc_fom_gccs);rc_fom_bioccs;sum(rc_fom_bioccs);rc_fom_nu;sum(rc_fom_nu);rc_fom_h;sum(rc_fom_h);...
%     rc_fom_c;sum(rc_fom_c);rc_fom_g;sum(rc_fom_g)];
rc_inv_details3 = [rc_inv_ess;rc_inv_var_gene;rc_inv_oth_gene];
rc_inv_details4 = [sum(rc_inv_es);sum(rc_inv_SLB_LFP);sum(rc_inv_SLB_NCMH);sum(rc_inv_SLB_NCMM);...
    sum(rc_inv_SLB_NCML);sum(rc_inv_SLB_NCA);sum(rc_inv_SLB_LMO);sum(rc_inv_ps);...
    sum(rc_inv_sc);sum(rc_inv_sd);sum(rc_inv_won);sum(rc_inv_woff);sum(rc_inv_csp);...
    sum(rc_inv_bio);sum(rc_inv_cccs);sum(rc_inv_gccs);sum(rc_inv_bioccs);sum(rc_inv_nu);sum(rc_inv_h);...
    sum(rc_inv_c);sum(rc_inv_g);sum(rc_inv_AC);sum(rc_inv_DC)];
rc_fom_details4 = [sum(rc_fom_es);sum(rc_fom_SLB_LFP);sum(rc_fom_SLB_NCMH);sum(rc_fom_SLB_NCMM);...
    sum(rc_fom_SLB_NCML);sum(rc_fom_SLB_NCA);sum(rc_fom_SLB_LMO);sum(rc_fom_ps);...
    sum(rc_fom_sc);sum(rc_fom_sd);sum(rc_fom_won);sum(rc_fom_woff);sum(rc_fom_csp);...
    sum(rc_fom_bio);sum(rc_fom_cccs);sum(rc_fom_gccs);sum(rc_fom_bioccs);sum(rc_fom_nu);sum(rc_fom_h);...
    sum(rc_fom_c);sum(rc_fom_g)];

% sc:集中式光伏 sd:分布式光伏 won:陆上风电 woff:海上风电 es:电化学储能 ps:抽水蓄能 csp:聚光太阳能 c:煤炭 g:天然气  
% bio:生物质能 cccs:煤炭ccs gccs:天然气ccs bioccs:生物质能ccs  nu: 核电 h: 水电


for s=1:stage
    rc_inv_woff_hs(:,s) = 1.06^(0-5*s)*rc_inv_woff(:,s); 
    rc_inv_csp_hs(:,s) = 1.06^(0-5*s)*rc_inv_csp(:,s);
    rc_inv_c_hs(:,s) = 1.06^(0-5*s)*rc_inv_c(:,s);
    rc_inv_g_hs(:,s) = 1.06^(0-5*s)*rc_inv_g(:,s);
    rc_inv_bio_hs(:,s) = 1.06^(0-5*s)*rc_inv_bio(:,s);
    rc_inv_cccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_cccs(:,s);
    rc_inv_gccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_gccs(:,s);
    rc_inv_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_inv_bioccs(:,s);
    rc_inv_h_hs(:,s) = 1.06^(0-5*s)*rc_inv_h(:,s); 
    rc_inv_nu_hs(:,s) = 1.06^(0-5*s)*rc_inv_nu(:,s);
    rc_inv_ps_hs(:,s) = 1.06^(0-5*s)*rc_inv_ps(:,s);
    rc_inv_AC_hs(:,s) = 1.06^(0-5*s)*rc_inv_AC(:,s);
    rc_inv_DC_hs(:,s) = 1.06^(0-5*s)*rc_inv_DC(:,s);
    rc_inv_won_hs(:,s) = 1.06^(0-5*s)*rc_inv_won(:,s);
    rc_inv_sc_hs(:,s) = 1.06^(0-5*s)*rc_inv_sc(:,s);
    rc_inv_sd_hs(:,s) = 1.06^(0-5*s)*rc_inv_sd(:,s);
    rc_inv_details_hs(:,s) = 1.06^(0-5*s)*rc_inv_details(:,s);
    rc_inv_details2_hs(:,s) = 1.06^(0-5*s)*rc_inv_details2(:,s);
    rc_inv_details3_hs(:,s) = 1.06^(0-5*s)*rc_inv_details3(:,s);
    rc_inv_details4_hs(:,s) = 1.06^(0-5*s)*rc_inv_details4(:,s);


    rc_fom_woff_hs(:,s) = 1.06^(0-5*s)*rc_fom_woff(:,s);
    rc_fom_csp_hs(:,s) = 1.06^(0-5*s)*rc_fom_csp(:,s);
    rc_fom_c_hs(:,s) = 1.06^(0-5*s)*rc_fom_c(:,s);
    rc_fom_g_hs(:,s) = 1.06^(0-5*s)*rc_fom_g(:,s);
    rc_fom_bio_hs(:,s) = 1.06^(0-5*s)*rc_fom_bio(:,s);
    rc_fom_cccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_cccs(:,s);
    rc_fom_gccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_gccs(:,s);
    rc_fom_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_fom_bioccs(:,s);
    rc_fom_h_hs(:,s) = 1.06^(0-5*s)*rc_fom_h(:,s); 
    rc_fom_nu_hs(:,s) = 1.06^(0-5*s)*rc_fom_nu(:,s);
    rc_fom_ps_hs(:,s) = 1.06^(0-5*s)*rc_fom_ps(:,s);
    rc_fom_won_hs(:,s) = 1.06^(0-5*s)*rc_fom_won(:,s);
    rc_fom_sc_hs(:,s) = 1.06^(0-5*s)*rc_fom_sc(:,s);
    rc_fom_sd_hs(:,s) = 1.06^(0-5*s)*rc_fom_sd(:,s);
    rc_fom_details_hs(:,s) = 1.06^(0-5*s)*rc_fom_details(:,s);
    rc_fom_details4_hs(:,s) = 1.06^(0-5*s)*rc_fom_details4(:,s);

end


for prv = 1:province_num
    for s=1:stage
        for d=1:12
            rc_ope_day_csp(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(15,s+jd)*sum(rP_csp(prv,d,:,s)))/1000000;
            rc_ope_day_c(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(1,s+jd)*sum(rP_c(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(1.1*sum(rdelI_onc(prv,d,:,s)))/(10^3);
            rc_ope_day_g(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(2,s+jd)*sum(rP_g(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.3*sum(rdelI_ong(prv,d,:,s)))/(10^3);
            rc_ope_day_bio(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(12,s+jd)*sum(rP_bio(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.5*sum(rdelI_onbio(prv,d,:,s)))/(10^3);
            rc_ope_day_cccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(9,s+jd)*sum(rP_cccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(1.1*sum(rdelI_oncccs(prv,d,:,s)))/(10^3);
            rc_ope_day_gccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(10,s+jd)*sum(rP_gccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.3*sum(rdelI_ongccs(prv,d,:,s)))/(10^3);
            rc_ope_day_bioccs(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(13,s+jd)*sum(rP_bioccs(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(0.5*sum(rdelI_onbioccs(prv,d,:,s)))/(10^3);
            rc_ope_day_nu(prv,s,d) = huansuan1(6)*Day_num(d)*(cost_ope(7,s+jd)*sum(rP_nu(prv,d,:,s)))/1000000 + huansuan1(6)*Day_num(d)*(22*sum(rdelI_onnu(prv,d,:,s)))/(10^3);
            % ccs成本 单位：10亿CNY
            rc_ope_day_ccs(prv,s,d) =  huansuan1(6)*Day_num(d)*(390.8*sum(remcap_c(prv,d,:,s)) + 305.4*sum(remcap_g(prv,d,:,s)) + 305.4*sum(remcap_bio(prv,d,:,s)))/(10^9);
            % Load shedding cost
            rc_ope_day_Lsh(prv,s,d) =  huansuan1(6)*Day_num(d)*(3*sum(rP_loadshedding(prv,d,:,s)))/(10^3);
                        
        end
    end
end
for prv = 1:province_num
    for s=1:stage
        rc_ope_csp(prv,s) = sum(rc_ope_day_csp(prv,s,:));
        rc_ope_c(prv,s) = sum(rc_ope_day_c(prv,s,:));
        rc_ope_g(prv,s) = sum(rc_ope_day_g(prv,s,:));
        rc_ope_bio(prv,s) = sum(rc_ope_day_bio(prv,s,:));
        rc_ope_cccs(prv,s) = sum(rc_ope_day_cccs(prv,s,:));
        rc_ope_gccs(prv,s) = sum(rc_ope_day_gccs(prv,s,:));
        rc_ope_bioccs(prv,s) = sum(rc_ope_day_bioccs(prv,s,:));
        rc_ope_nu(prv,s) = sum(rc_ope_day_nu(prv,s,:));
        rc_ope_ccs(prv,s) = sum(rc_ope_day_ccs(prv,s,:));
        rc_ope_Lsh(prv,s) = sum(rc_ope_day_Lsh(prv,s,:));
    end
end
rc_ope_details = [rc_ope_csp;sum(rc_ope_csp);rc_ope_c;sum(rc_ope_c);rc_ope_g;sum(rc_ope_g);rc_ope_bio;sum(rc_ope_bio);...
    rc_ope_cccs;sum(rc_ope_cccs);rc_ope_gccs;sum(rc_ope_gccs);rc_ope_bioccs;sum(rc_ope_bioccs);rc_ope_nu;sum(rc_ope_nu);...
    rc_ope_ccs;sum(rc_ope_ccs);rc_ope_Lsh;sum(rc_ope_Lsh)];
rc_ope_details4 = [sum(rc_ope_csp);sum(rc_ope_c);sum(rc_ope_g);sum(rc_ope_bio);...
    sum(rc_ope_cccs);sum(rc_ope_gccs);sum(rc_ope_bioccs);sum(rc_ope_nu);...
    sum(rc_ope_ccs);sum(rc_ope_Lsh)];

for s=1:stage
    rc_ope_csp_hs(:,s) = 1.06^(0-5*s)*rc_ope_csp(:,s); 
    rc_ope_c_hs(:,s) = 1.06^(0-5*s)*rc_ope_c(:,s);
    rc_ope_g_hs(:,s) = 1.06^(0-5*s)*rc_ope_g(:,s);
    rc_ope_bio_hs(:,s) = 1.06^(0-5*s)*rc_ope_bio(:,s);
    rc_ope_cccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_cccs(:,s);
    rc_ope_gccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_gccs(:,s);
    rc_ope_bioccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_bioccs(:,s);
    rc_ope_nu_hs(:,s) = 1.06^(0-5*s)*rc_ope_nu(:,s);
    rc_ope_ccs_hs(:,s) = 1.06^(0-5*s)*rc_ope_ccs(:,s); 
    rc_ope_Lsh_hs(:,s) = 1.06^(0-5*s)*rc_ope_Lsh(:,s);
    rc_ope_details_hs(:,s) = 1.06^(0-5*s)*rc_ope_details(:,s);
    rc_ope_details4_hs(:,s) = 1.06^(0-5*s)*rc_ope_details4(:,s);
end

if sum(rc_inv_SLB_LFP) == 0
    rdelI_SLB_LFP = zeros(31,6);
    rI_SLB_LFP = zeros(31,6);
end
if sum(rc_inv_SLB_NCMH) == 0
    rdelI_SLB_NCMH = zeros(31,6);
    rI_SLB_NCMH = zeros(31,6);
end
if sum(rc_inv_SLB_NCMM) == 0
    rdelI_SLB_NCMM = zeros(31,6);
    rI_SLB_NCMM = zeros(31,6);
end
if sum(rc_inv_SLB_NCML) == 0
    rdelI_SLB_NCML = zeros(31,6);
    rI_SLB_NCML = zeros(31,6);
end
if sum(rc_inv_SLB_NCA) == 0
    rdelI_SLB_NCA = zeros(31,6);
    rI_SLB_NCA = zeros(31,6);
end
if sum(rc_inv_SLB_LMO) == 0
    rdelI_SLB_LMO = zeros(31,6);
    rI_SLB_LMO = zeros(31,6);
end


rdelI_details = [rdelI_es;sum(rdelI_es);rdelI_SLB_LFP;sum(rdelI_SLB_LFP);rdelI_SLB_NCMH;sum(rdelI_SLB_NCMH);rdelI_SLB_NCMM;sum(rdelI_SLB_NCMM);...
    rdelI_SLB_NCML;sum(rdelI_SLB_NCML);rdelI_SLB_NCA;sum(rdelI_SLB_NCA);rdelI_SLB_LMO;sum(rdelI_SLB_LMO);rdelI_ps;sum(rdelI_ps);...
    rdelI_sc1;sum(rdelI_sc1);rdelI_sd1;sum(rdelI_sd1);rdelI_won1;sum(rdelI_won1);rdelI_woff;sum(rdelI_woff);rdelI_csp;sum(rdelI_csp);...
    rdelI_bio;sum(rdelI_bio);rdelI_cccs;sum(rdelI_cccs);rdelI_gccs;sum(rdelI_gccs);rdelI_bioccs;sum(rdelI_bioccs);rdelI_nu;sum(rdelI_nu);rdelI_h;sum(rdelI_h);...
    rdelI_c;sum(rdelI_c);rdelI_g;sum(rdelI_g);zeros(31,6);zeros(1,6);zeros(31,6);zeros(1,6)];
rI_details = [rI_es;sum(rI_es);rI_SLB_LFP;sum(rI_SLB_LFP);rI_SLB_NCMH;sum(rI_SLB_NCMH);rI_SLB_NCMM;sum(rI_SLB_NCMM);...
    rI_SLB_NCML;sum(rI_SLB_NCML);rI_SLB_NCA;sum(rI_SLB_NCA);rI_SLB_LMO;sum(rI_SLB_LMO);rI_ps;sum(rI_ps);...
    rI_sc;sum(rI_sc);rI_sd;sum(rI_sd);rI_won;sum(rI_won);rI_woff;sum(rI_woff);rI_csp;sum(rI_csp);...
    rI_bio;sum(rI_bio);rI_cccs;sum(rI_cccs);rI_gccs;sum(rI_gccs);rI_bioccs;sum(rI_bioccs);rI_nu;sum(rI_nu);rI_h;sum(rI_h);...
    rI_c;sum(rI_c);rI_g;sum(rI_g)];
rdelIR_details = [-rdelIR_es;sum(-rdelIR_es);rdelIR_SLB_LFP;sum(rdelIR_SLB_LFP);rdelIR_SLB_NCMH;sum(rdelIR_SLB_NCMH);rdelIR_SLB_NCMM;sum(rdelIR_SLB_NCMM);...
    rdelIR_SLB_NCML;sum(rdelIR_SLB_NCML);rdelIR_SLB_NCA;sum(rdelIR_SLB_NCA);rdelIR_SLB_LMO;sum(rdelIR_SLB_LMO);rdelIR_ps;sum(rdelIR_ps);...
    rdelIR_sc1;sum(rdelIR_sc1);rdelIR_sd1;sum(rdelIR_sd1);rdelIR_won1;sum(rdelIR_won1);rdelIR_woff;sum(rdelIR_woff);rdelIR_csp;sum(rdelIR_csp);...
    rdelIR_bio;sum(rdelIR_bio);rdelIR_cccs;sum(rdelIR_cccs);rdelIR_gccs;sum(rdelIR_gccs);rdelIR_bioccs;sum(rdelIR_bioccs);rdelIR_nu;sum(rdelIR_nu);rdelIR_h;sum(rdelIR_h);...
    rdelIR_c;sum(rdelIR_c);rdelIR_g;sum(rdelIR_g);zeros(31,6);zeros(1,6);zeros(31,6);zeros(1,6)];

rdelI_rI = rdelI_Battery./rI_Battery;
for i = 1:31
    for j = 1:6
        if rdelI_rI(i,j) == Inf
            rdelI_rI(i,j) = 1000;
        elseif rdelI_rI(i,j) >= 0
            rdelI_rI(i,j) = rdelI_rI(i,j);
        else
            rdelI_rI(i,j) = 0;
        end
    end
end

rdelI_sum_prv = rdelI_es + rdelI_SLB_LFP + rdelI_SLB_NCMH + rdelI_SLB_NCMM + rdelI_SLB_NCML + rdelI_SLB_NCA + rdelI_SLB_LMO + rdelI_ps + rdelI_sc1 ...
    + rdelI_sd1 + rdelI_won1 + rdelI_woff + rdelI_csp + rdelI_bio + rdelI_cccs + rdelI_gccs + rdelI_bioccs + rdelI_nu + rdelI_h + rdelI_c + rdelI_g;
rdelI_sum_nat = sum(rdelI_es) + sum(rdelI_SLB_LFP) + sum(rdelI_SLB_NCMH) + sum(rdelI_SLB_NCMM) + sum(rdelI_SLB_NCML) + sum(rdelI_SLB_NCA) + sum(rdelI_SLB_LMO) + sum(rdelI_ps) ...
    + sum(rdelI_sc1) + sum(rdelI_sd1) + sum(rdelI_won1);rdelI_woff;sum(rdelI_woff) + sum(rdelI_csp) + sum(rdelI_bio) + sum(rdelI_cccs) + sum(rdelI_gccs) ...
    + sum(rdelI_bioccs) + sum(rdelI_nu) + sum(rdelI_h) + sum(rdelI_c) + sum(rdelI_g);
rI_sum_prv = rI_es + rI_SLB_LFP + rI_SLB_NCMH + rI_SLB_NCMM + rI_SLB_NCML + rI_SLB_NCA + rI_SLB_LMO + rI_ps + rI_sc ...
    + rI_sd + rI_won + rI_woff + rI_csp + rI_bio + rI_cccs + rI_gccs + rI_bioccs + rI_nu + rI_h + rI_c + rI_g;
rI_sum_nat = sum(rI_es) + sum(rI_SLB_LFP) + sum(rI_SLB_NCMH) + sum(rI_SLB_NCMM) + sum(rI_SLB_NCML) + sum(rI_SLB_NCA) + sum(rI_SLB_LMO) + sum(rI_ps) ...
    + sum(rI_sc) + sum(rI_sd) + sum(rI_won);rI_woff;sum(rI_woff) + sum(rI_csp) + sum(rI_bio) + sum(rI_cccs) + sum(rI_gccs) ...
    + sum(rI_bioccs) + sum(rI_nu) + sum(rI_h) + sum(rI_c) + sum(rI_g);

rdelI_percent = [rdelI_es./rdelI_sum_prv;sum(rdelI_es)./rdelI_sum_nat;rdelI_SLB_LFP./rdelI_sum_prv;sum(rdelI_SLB_LFP)./rdelI_sum_nat;rdelI_SLB_NCMH./rdelI_sum_prv;sum(rdelI_SLB_NCMH)./rdelI_sum_nat;...
    rdelI_SLB_NCMM./rdelI_sum_prv;sum(rdelI_SLB_NCMM)./rdelI_sum_nat;rdelI_SLB_NCML./rdelI_sum_prv;sum(rdelI_SLB_NCML)./rdelI_sum_nat;rdelI_SLB_NCA./rdelI_sum_prv;sum(rdelI_SLB_NCA)./rdelI_sum_nat;...
    rdelI_SLB_LMO./rdelI_sum_prv;sum(rdelI_SLB_LMO)./rdelI_sum_nat;rdelI_ps./rdelI_sum_prv;sum(rdelI_ps)./rdelI_sum_nat;rdelI_sc1./rdelI_sum_prv;sum(rdelI_sc1)./rdelI_sum_nat;rdelI_sd1./rdelI_sum_prv;...
    sum(rdelI_sd1)./rdelI_sum_nat;rdelI_won1./rdelI_sum_prv;sum(rdelI_won1)./rdelI_sum_nat;rdelI_woff./rdelI_sum_prv;sum(rdelI_woff)./rdelI_sum_nat;rdelI_csp./rdelI_sum_prv;sum(rdelI_csp)./rdelI_sum_nat;...
    rdelI_bio./rdelI_sum_prv;sum(rdelI_bio)./rdelI_sum_nat;rdelI_cccs./rdelI_sum_prv;sum(rdelI_cccs)./rdelI_sum_nat;rdelI_gccs./rdelI_sum_prv;sum(rdelI_gccs)./rdelI_sum_nat;rdelI_bioccs./rdelI_sum_prv;...
    sum(rdelI_bioccs)./rdelI_sum_nat;rdelI_nu./rdelI_sum_prv;sum(rdelI_nu)./rdelI_sum_nat;rdelI_h./rdelI_sum_prv;sum(rdelI_h)./rdelI_sum_nat;...
    rdelI_c./rdelI_sum_prv;sum(rdelI_c)./rdelI_sum_nat;rdelI_g./rdelI_sum_prv;sum(rdelI_g)./rdelI_sum_nat;zeros(31,6);zeros(1,6);zeros(31,6);zeros(1,6)];
rI_percent = [rI_es./rI_sum_prv;sum(rI_es)./rI_sum_nat;rI_SLB_LFP./rI_sum_prv;sum(rI_SLB_LFP)./rI_sum_nat;rI_SLB_NCMH./rI_sum_prv;sum(rI_SLB_NCMH)./rI_sum_nat;...
    rI_SLB_NCMM./rI_sum_prv;sum(rI_SLB_NCMM)./rI_sum_nat;rI_SLB_NCML./rI_sum_prv;sum(rI_SLB_NCML)./rI_sum_nat;rI_SLB_NCA./rI_sum_prv;sum(rI_SLB_NCA)./rI_sum_nat;...
    rI_SLB_LMO./rI_sum_prv;sum(rI_SLB_LMO)./rI_sum_nat;rI_ps./rI_sum_prv;sum(rI_ps)./rI_sum_nat;rI_sc./rI_sum_prv;sum(rI_sc)./rI_sum_nat;rI_sd./rI_sum_prv;...
    sum(rI_sd)./rI_sum_nat;rI_won./rI_sum_prv;sum(rI_won)./rI_sum_nat;rI_woff./rI_sum_prv;sum(rI_woff)./rI_sum_nat;rI_csp./rI_sum_prv;sum(rI_csp)./rI_sum_nat;...
    rI_bio./rI_sum_prv;sum(rI_bio)./rI_sum_nat;rI_cccs./rI_sum_prv;sum(rI_cccs)./rI_sum_nat;rI_gccs./rI_sum_prv;sum(rI_gccs)./rI_sum_nat;rI_bioccs./rI_sum_prv;...
    sum(rI_bioccs)./rI_sum_nat;rI_nu./rI_sum_prv;sum(rI_nu)./rI_sum_nat;rI_h./rI_sum_prv;sum(rI_h)./rI_sum_nat;...
    rI_c./rI_sum_prv;sum(rI_c)./rI_sum_nat;rI_g./rI_sum_prv;sum(rI_g)./rI_sum_nat;zeros(31,6);zeros(1,6);zeros(31,6);zeros(1,6)];
rdelI_percent2 = [rdelI_es./rdelI_sum_prv rdelI_SLB_LFP./rdelI_sum_prv rdelI_SLB_NCMH./rdelI_sum_prv rdelI_SLB_NCMM./rdelI_sum_prv rdelI_SLB_NCML./rdelI_sum_prv rdelI_SLB_NCA./rdelI_sum_prv...
    rdelI_SLB_LMO./rdelI_sum_prv rdelI_ps./rdelI_sum_prv rdelI_sc1./rdelI_sum_prv rdelI_sd1./rdelI_sum_prv rdelI_won1./rdelI_sum_prv rdelI_woff./rdelI_sum_prv rdelI_csp./rdelI_sum_prv...
    rdelI_bio./rdelI_sum_prv rdelI_cccs./rdelI_sum_prv rdelI_gccs./rdelI_sum_prv rdelI_bioccs./rdelI_sum_prv rdelI_nu./rdelI_sum_prv rdelI_h./rdelI_sum_prv...
    rdelI_c./rdelI_sum_prv rdelI_g./rdelI_sum_prv;...
    sum(rdelI_es)./rdelI_sum_nat sum(rdelI_SLB_LFP)./rdelI_sum_nat sum(rdelI_SLB_NCMH)./rdelI_sum_nat sum(rdelI_SLB_NCMM)./rdelI_sum_nat sum(rdelI_SLB_NCML)./rdelI_sum_nat sum(rdelI_SLB_NCA)./rdelI_sum_nat...
    sum(rdelI_SLB_LMO)./rdelI_sum_nat sum(rdelI_ps)./rdelI_sum_nat sum(rdelI_sc1)./rdelI_sum_nat sum(rdelI_sd1)./rdelI_sum_nat sum(rdelI_won1)./rdelI_sum_nat sum(rdelI_woff)./rdelI_sum_nat sum(rdelI_csp)./rdelI_sum_nat...
    sum(rdelI_bio)./rdelI_sum_nat sum(rdelI_cccs)./rdelI_sum_nat sum(rdelI_gccs)./rdelI_sum_nat sum(rdelI_bioccs)./rdelI_sum_nat sum(rdelI_nu)./rdelI_sum_nat sum(rdelI_h)./rdelI_sum_nat...
    sum(rdelI_c)./rdelI_sum_nat sum(rdelI_g)./rdelI_sum_nat];
rI_percent2 = [rI_es./rI_sum_prv rI_SLB_LFP./rI_sum_prv rI_SLB_NCMH./rI_sum_prv rI_SLB_NCMM./rI_sum_prv rI_SLB_NCML./rI_sum_prv rI_SLB_NCA./rI_sum_prv...
    rI_SLB_LMO./rI_sum_prv rI_ps./rI_sum_prv rI_sc./rI_sum_prv rI_sd./rI_sum_prv rI_won./rI_sum_prv rI_woff./rI_sum_prv rI_csp./rI_sum_prv...
    rI_bio./rI_sum_prv rI_cccs./rI_sum_prv rI_gccs./rI_sum_prv rI_bioccs./rI_sum_prv rI_nu./rI_sum_prv rI_h./rI_sum_prv...
    rI_c./rI_sum_prv rI_g./rI_sum_prv;...
    sum(rI_es)./rI_sum_nat sum(rI_SLB_LFP)./rI_sum_nat sum(rI_SLB_NCMH)./rI_sum_nat sum(rI_SLB_NCMM)./rI_sum_nat sum(rI_SLB_NCML)./rI_sum_nat sum(rI_SLB_NCA)./rI_sum_nat...
    sum(rI_SLB_LMO)./rI_sum_nat sum(rI_ps)./rI_sum_nat sum(rI_sc)./rI_sum_nat sum(rI_sd)./rI_sum_nat sum(rI_won)./rI_sum_nat sum(rI_woff)./rI_sum_nat sum(rI_csp)./rI_sum_nat...
    sum(rI_bio)./rI_sum_nat sum(rI_cccs)./rI_sum_nat sum(rI_gccs)./rI_sum_nat sum(rI_bioccs)./rI_sum_nat sum(rI_nu)./rI_sum_nat sum(rI_h)./rI_sum_nat...
    sum(rI_c)./rI_sum_nat sum(rI_g)./rI_sum_nat];

rdelI_details2 = [rdelI_es rdelI_SLB_LFP rdelI_SLB_NCMH rdelI_SLB_NCMM rdelI_SLB_NCML rdelI_SLB_NCA...
    rdelI_SLB_LMO rdelI_ps rdelI_sc1 rdelI_sd1 rdelI_won1 rdelI_woff rdelI_csp...
    rdelI_bio rdelI_cccs rdelI_gccs rdelI_bioccs rdelI_nu rdelI_h...
    rdelI_c rdelI_g;...
    sum(rdelI_es) sum(rdelI_SLB_LFP) sum(rdelI_SLB_NCMH) sum(rdelI_SLB_NCMM) sum(rdelI_SLB_NCML) sum(rdelI_SLB_NCA)...
    sum(rdelI_SLB_LMO) sum(rdelI_ps) sum(rdelI_sc1) sum(rdelI_sd1) sum(rdelI_won1) sum(rdelI_woff) sum(rdelI_csp)...
    sum(rdelI_bio) sum(rdelI_cccs) sum(rdelI_gccs) sum(rdelI_bioccs) sum(rdelI_nu) sum(rdelI_h)...
    sum(rdelI_c) sum(rdelI_g)];
rI_details2 = [rI_es rI_SLB_LFP rI_SLB_NCMH rI_SLB_NCMM rI_SLB_NCML rI_SLB_NCA...
    rI_SLB_LMO rI_ps rI_sc rI_sd rI_won rI_woff rI_csp...
    rI_bio rI_cccs rI_gccs rI_bioccs rI_nu rI_h...
    rI_c rI_g;...
    sum(rI_es) sum(rI_SLB_LFP) sum(rI_SLB_NCMH) sum(rI_SLB_NCMM) sum(rI_SLB_NCML) sum(rI_SLB_NCA)...
    sum(rI_SLB_LMO) sum(rI_ps) sum(rI_sc) sum(rI_sd) sum(rI_won) sum(rI_woff) sum(rI_csp)...
    sum(rI_bio) sum(rI_cccs) sum(rI_gccs) sum(rI_bioccs) sum(rI_nu) sum(rI_h)...
    sum(rI_c) sum(rI_g)];
rdelIR_details2 = [rdelIR_es rdelIR_SLB_LFP rdelIR_SLB_NCMH rdelIR_SLB_NCMM rdelIR_SLB_NCML rdelIR_SLB_NCA...
    rdelIR_SLB_LMO rdelIR_ps rdelIR_sc1 rdelIR_sd1 rdelIR_won1 rdelIR_woff rdelIR_csp...
    rdelIR_bio rdelIR_cccs rdelIR_gccs rdelIR_bioccs rdelIR_nu rdelIR_h...
    rdelIR_c rdelIR_g;...
    sum(rdelIR_es) sum(rdelIR_SLB_LFP) sum(rdelIR_SLB_NCMH) sum(rdelIR_SLB_NCMM) sum(rdelIR_SLB_NCML) sum(rdelIR_SLB_NCA)...
    sum(rdelIR_SLB_LMO) sum(rdelIR_ps) sum(rdelIR_sc1) sum(rdelIR_sd1) sum(rdelIR_won1) sum(rdelIR_woff) sum(rdelIR_csp)...
    sum(rdelIR_bio) sum(rdelIR_cccs) sum(rdelIR_gccs) sum(rdelIR_bioccs) sum(rdelIR_nu) sum(rdelIR_h)...
    sum(rdelIR_c) sum(rdelIR_g)];



for i = 1:21
    rdelI_percent3_stage1(:,i) = rdelI_percent2(:,(i-1)*6+1);    
    rI_percent3_stage1(:,i) = rI_percent2(:,(i-1)*6+1);
    rdelI_detail3_stage1(:,i) = rdelI_details2(:,(i-1)*6+1);    
    rI_details3_stage1(:,i) = rI_details2(:,(i-1)*6+1);    
    rdelIR_detail3_stage1(:,i) = abs(rdelIR_details2(:,(i-1)*6+1));    
end
for i = 1:21
    rdelI_percent3_stage2(:,i) = rdelI_percent2(:,(i-1)*6+2);    
    rI_percent3_stage2(:,i) = rI_percent2(:,(i-1)*6+2);    
    rdelI_detail3_stage2(:,i) = rdelI_details2(:,(i-1)*6+2);    
    rI_details3_stage2(:,i) = rI_details2(:,(i-1)*6+2);    
    rdelIR_detail3_stage2(:,i) = abs(rdelIR_details2(:,(i-1)*6+2));    
end
for i = 1:21
    rdelI_percent3_stage3(:,i) = rdelI_percent2(:,(i-1)*6+3);    
    rI_percent3_stage3(:,i) = rI_percent2(:,(i-1)*6+3);    
    rdelI_detail3_stage3(:,i) = rdelI_details2(:,(i-1)*6+3);    
    rI_details3_stage3(:,i) = rI_details2(:,(i-1)*6+3);    
    rdelIR_detail3_stage3(:,i) = abs(rdelIR_details2(:,(i-1)*6+3));    
end
for i = 1:21
    rdelI_percent3_stage4(:,i) = rdelI_percent2(:,(i-1)*6+4);    
    rI_percent3_stage4(:,i) = rI_percent2(:,(i-1)*6+4);
    rdelI_detail3_stage4(:,i) = rdelI_details2(:,(i-1)*6+4);
    rI_details3_stage4(:,i) = rI_details2(:,(i-1)*6+4);    
    rdelIR_detail3_stage4(:,i) = abs(rdelIR_details2(:,(i-1)*6+4));    
end
for i = 1:21
    rdelI_percent3_stage5(:,i) = rdelI_percent2(:,(i-1)*6+5);    
    rI_percent3_stage5(:,i) = rI_percent2(:,(i-1)*6+5);    
    rdelI_detail3_stage5(:,i) = rdelI_details2(:,(i-1)*6+5);    
    rI_details3_stage5(:,i) = rI_details2(:,(i-1)*6+5);    
    rdelIR_detail3_stage5(:,i) = abs(rdelIR_details2(:,(i-1)*6+5));    
end
for i = 1:21
    rdelI_percent3_stage6(:,i) = rdelI_percent2(:,(i-1)*6+6);    
    rI_percent3_stage6(:,i) = rI_percent2(:,(i-1)*6+6);    
    rdelI_detail3_stage6(:,i) = rdelI_details2(:,(i-1)*6+6);    
    rI_details3_stage6(:,i) = rI_details2(:,(i-1)*6+6);    
    rdelIR_detail3_stage6(:,i) = abs(rdelIR_details2(:,(i-1)*6+6));    
end

rdelI_delIR_I_batt = [rdelI_Battery;rdelIR_Battery;rI_Battery;sum(rdelI_Battery);sum(rdelIR_Battery);sum(rI_Battery);...
    rdelI_SLB_LFP;rdelIR_SLB_LFP;rI_es;sum(rdelI_SLB_LFP);sum(rdelIR_SLB_LFP);sum(rI_SLB_LFP);...
    rdelI_SLB_NCMH;rdelIR_SLB_NCMH;rI_es;sum(rdelI_SLB_NCMH);sum(rdelIR_SLB_NCMH);sum(rI_SLB_NCMH);...
    rdelI_SLB_NCMM;rdelIR_SLB_NCMM;rI_es;sum(rdelI_SLB_NCMM);sum(rdelIR_SLB_NCMM);sum(rI_SLB_NCMM);...
    rdelI_SLB_NCML;rdelIR_SLB_NCML;rI_es;sum(rdelI_SLB_NCML);sum(rdelIR_SLB_NCML);sum(rI_SLB_NCML);...
    rdelI_SLB_NCA;rdelIR_SLB_NCA;rI_es;sum(rdelI_SLB_NCA);sum(rdelIR_SLB_NCA);sum(rI_SLB_NCA);...
    rdelI_SLB_LMO;rdelIR_SLB_LMO;rI_es;sum(rdelI_SLB_LMO);sum(rdelIR_SLB_LMO);sum(rI_SLB_LMO);...
    rdelI_es;rdelIR_es;rI_es;sum(rdelI_es);sum(rdelIR_es);sum(rI_es)];

SLB_sum = [sum(SLB_LFP);sum(SLB_NCMH);sum(SLB_NCMM);sum(SLB_NCML);sum(SLB_NCA);sum(SLB_LMO)];
