%%%%%%% 这个版本为v8: 改正了城市间电池运输规模的限制
%%%%%%% 运行这个文件之前需要先运行BattDegrad.m文件来获得SLB_year.mat和SLB_RTE.mat两个文件

%%%%%%% 1）首先根据需求，修改EncouPolicy.m, TransPolicy.m, DegradPolicy.m
%%%%%%% 2）然后运行optmiz03.m, 本版本在一台普通电脑上运行一般至少需要14h
%%%%%%% 3）最后运行reslut_calcul.m，得到论文分析的基本数据
%%%%%%% * 可改变optimiza03.m中的碳中和限制，来进行提前碳中和的分析
%%%%%%% * 可改变InvCost.m中的退役电池定价参数，来分析高、中、低三档电池价格对结果的影响

clc;
clear;
power_energy_rate = 12/15; %%% 动力型电池使用年限与能量型电池使用年限之比
run BattDegrad.m;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
clear all class;
warning off;
tic
%% 简写
% sc:集中式光伏 sd:分布式光伏 won:陆上风电 woff:海上风电 es:电化学储能 ps:抽水蓄能 csp:聚光太阳能 c:煤炭 g:天然气  
% bio:生物质能 cccs:煤炭ccs gccs:天然气ccs bioccs:生物质能ccs  nu: 核电 h: 水电

%% load typical day data(PV,wind,load_demand,CSP)
load Distributed_PV_data.mat;  
load Utility_PV_data.mat;
load Offshore_wind_data.mat;
load Onshore_wind_data.mat;
load Typical_day_load_data.mat;
load CSP_data.mat;
load battery_outflow_v1.mat;
% COT = COT; % yuan
load SLB_year.mat;
load SLB_RTE.mat;
load SLB_N.mat;
load SOH_coeff.mat;
load rdelI_Battery.mat;

exchange_rate = 1/0.144982;

%%%%%%%%% 计算每个省的退役电池规模
run SLB_amount.m; %%% GWh
% SLB_LFP(:,1) = 0; %%% 2020-2025流入市场的退役电池规模为0
% SLB_NCMH(:,1) = 0;
% SLB_NCMM(:,1) = 0;
% SLB_NCML(:,1) = 0;
% SLB_NCA(:,1) = 0;
% SLB_LMO(:,1) = 0;
SLB_percent = 0.7; % 流入市场的比例
SLB_LFP = SLB_LFP*SLB_percent; %%% 2020-2025流入市场的退役电池规模为0
SLB_NCMH = SLB_NCMH*SLB_percent;
SLB_NCMM = SLB_NCMM*SLB_percent;
SLB_NCML = SLB_NCML*SLB_percent;
SLB_NCA = SLB_NCA*SLB_percent;
SLB_LMO = SLB_LMO*SLB_percent;

Day_num=[32,30,19,21,19,22,58,50,39,33,17,25];
%% parameters
casename = 'new_data_1.xlsx';


% province_num = 5;%省份数
% province = ['BJ','TJ','HE','SX','NM']; %省份缩写
% index_province = struct('BJ',1,'TJ',2,'HE',3,'SX',4,'NM',5);
% city_num = 36;

province_num = 31; 
province = ['BJ','TJ','HE','SX','NM','LN','JL','HL','SH','JS','ZJ','AH','FJ','JX','SD','HA','HB','HN','GD','GX','HI','CQ','SC','GZ','YN','XZ','SN','GS','QH','NX','XJ']; % abbreviation of each province
index_province = struct('BJ',1,'TJ',2,'HE',3,'SX',4,'NM',5,'LN',6,'JL',7,'HL',8,'SH',9,'JS',10,'ZJ',11,'AH',12,'FJ',13,'JX',14,'SD',15,'HA',16,'HB',17,'HN',18,'GD',19,'GX',20,'HI',21,'CQ',22,'SC',23,'GZ',24,'YN',25,'XZ',26,'SN',27,'GS',28,'QH',29,'NX',30,'XJ',31); % dict
city_num = 337;

stage = 6;%6; % 2020-2050共6个阶段
seg = 7; %分段线性化分段数
% delIR_SLB_LFP_COT_sum = zeros(31,stage,1);
% delIR_SLB_NCMH_COT_sum = zeros(31,stage,1);
% delIR_SLB_NCMM_COT_sum = zeros(31,stage,1);
% delIR_SLB_NCML_COT_sum = zeros(31,stage,1);
% delIR_SLB_NCA_COT_sum = zeros(31,stage,1);
% delIR_SLB_LMO_COT_sum = zeros(31,stage,1);

COT_city = zeros(city_num,city_num);
for n = 1:city_num
    for m = 1:city_num
        if COT(n,m) == 'NaN'
            COT(n,m) = 17.7828257898154;
        end
        COT_city(n,m) = COT(n,m);
    end
end
steppp = 1

T = 12;
cf_nu = 0.8562; % 核电容量因子 7500/8760
cf_coal = 0.456617;% 煤炭容量因子 sum(all_cf_coal)/(8760*31)
cf_gas = 0.285388; % 天然气容量因子 2500/8760 
cf_bio = 0.5807077;% 5087/8760

e_coal = 0.865; % 煤电碳排放量 0.865t/MWh
e_gas = 0.312; % 气电碳排放量 0.312t/MWh
e_bio = 0.350; % 生物质能碳排放量 0.35t/Mwh
eta_gas = 160227;% unit：标方/GWH

SOC_min = 0.1; % 2022-Yaling Wu-Optimal battery capacity of grid-connected PV-battery systems
SOC_max = 0.95;

%不考虑各省容量因子的差异（容量因子均设为1）
cap_factor_onwind=ones(31,1);
cap_factor_pv=ones(31,1);

%考虑各省容量因子的差异
cap_factor_onwind=[1.212669683
1.212669683
1.212669683
1.212669683
1.212669683
1.140271493
1.140271493
1.140271493
1
1
1
1
1
0.850678733
1.212669683
0.850678733
0.850678733
0.850678733
1.013574661
1.013574661
1.013574661
0.936651584
0.936651584
1.013574661
1.013574661
0.936651584
1.135746606
1.135746606
1.135746606
1.135746606
1.135746606
];

cap_factor_pv=[1.520661157
1.520661157
1.520661157
1.520661157
1.520661157
1.32231405
1.32231405
1.32231405
1
1
1
1
1
0.958677686
1.520661157
0.958677686
0.958677686
0.958677686
1.123966942
1.123966942
1.123966942
1.479338843
1.479338843
1.123966942
1.123966942
1.479338843
1.355371901
1.355371901
1.355371901
1.355371901
1.355371901];    

%% 引入数据
TLs = readtable(casename, 'sheet','existing_lines'); %输电线路
gas_limits = xlsread(casename,'gas');
cf_h_upper = xlsread(casename,'cf_h_upper');

I0 = xlsread(casename, 'I0_zhang');  % 各省各类型能源2020年初始装机量（MW）
I0 = I0'/1000; % 初始装机量（GW）
I0(:,16) = zeros(31,1); %SLB_LFP(:,1);
I0(:,17) = zeros(31,1); %SLB_NCMH(:,1);
I0(:,18) = zeros(31,1); %SLB_NCMM(:,1);
I0(:,19) = zeros(31,1); %SLB_NCML(:,1);
I0(:,20) = zeros(31,1); %SLB_NCA(:,1);
I0(:,21) = zeros(31,1); %SLB_LMO(:,1);
ld = load_data_select;
wind_off = wind_data_select_ofs;
wind_on = wind_data_select_ol;
solar = solar_data_select_dis;
solar_u = solar_data_select_ut;
csp_data = csp_data_select;

ydl = xlsread(casename, 'ydl_cn2050'); % 各省市各阶段用电量
manucap = xlsread(casename,'m1'); % 全国各阶段装机制造能力上限

if province_num == 5
    manucap(7,:) = SLB_LFP(1,:)+SLB_LFP(2,:)+SLB_LFP(3,:)+SLB_LFP(4,:)+SLB_LFP(5,:); % GWh
    manucap(8,:) = SLB_NCMH(1,:)+SLB_NCMH(2,:)+SLB_NCMH(3,:)+SLB_NCMH(4,:)+SLB_NCMH(5,:);
    manucap(9,:) = SLB_NCMM(1,:)+SLB_NCMM(2,:)+SLB_NCMM(3,:)+SLB_NCMM(4,:)+SLB_NCMM(5,:);
    manucap(10,:) = SLB_NCML(1,:)+SLB_NCML(2,:)+SLB_NCML(3,:)+SLB_NCML(4,:)+SLB_NCML(5,:);
    manucap(11,:) = SLB_NCA(1,:)+SLB_NCA(2,:)+SLB_NCA(3,:)+SLB_NCA(4,:)+SLB_NCA(5,:);
    manucap(12,:) = SLB_LMO(1,:)+SLB_LMO(2,:)+SLB_LMO(3,:)+SLB_LMO(4,:)+SLB_LMO(5,:);
else
    manucap(7,:) = sum(SLB_LFP,1); % GWh
    manucap(8,:) = sum(SLB_NCMH,1);
    manucap(9,:) = sum(SLB_NCMM,1);
    manucap(10,:) = sum(SLB_NCML,1);
    manucap(11,:) = sum(SLB_NCA,1);
    manucap(12,:) = sum(SLB_LMO,1);
end

upper_limit = xlsread(casename,'upper_limit'); % 各省各类VRE总装机容量上限

% 初始线路容量矩阵
[AC_matrix,DC_matrix,line_cost_AC,line_cost_DC,loss_AC,loss_DC,MAT_AC,MAT_DC,candidate_AC,candidate_DC] = generate_topo_matrix(TLs,index_province,province_num);
% 线路矩阵稀疏处理
Sparse_AC_matrix = sparse_method(AC_matrix,province_num);
Sparse_AC_candidate = sparse_method(candidate_AC,province_num);
Sparse_DC_matrix = sparse_method(DC_matrix,province_num);
Sparse_DC_candidate = sparse_method(candidate_DC,province_num);
Sparse_AC_total = sparse_method(AC_matrix+candidate_AC,province_num);
Sparse_DC_total = sparse_method(DC_matrix+candidate_DC,province_num);

% 各类能源的投资成本、运行成本及维护成本数据
cost_inv = xlsread(casename, 'cost_inv')*1000;             
cost_fom = xlsread(casename, 'cost_fom')*1000;
cost_ope = xlsread(casename, 'cost_ope')*1000;


% LD表示标幺值为1时各省各阶段对应的最大负荷------代入典型日天数数据
%各省份的总的负荷标幺值：
for prv =1:province_num
    for d = 1:12
%         for s=1:stage
        pu_sum_ld(prv,d) = sum(ld(:,d,prv)*Day_num(d)); %Gwh
%         end
    end
end

for prv =1:province_num
    for s=1:stage
        LD(prv,s) = (ydl(prv,s)*100)/sum(pu_sum_ld(prv,:)); %Gwh
    end
end
steppp = 2

%% 陆上风电和光伏的分段线性化成本部分
piecewise_data_wind = xlsread('piecewise1.xlsx','Wind');
piecewise_data_pv = xlsread('piecewise1.xlsx','PV');

[won_capacity_piecewise,cost_won_pw] = generate_piecewise_data(piecewise_data_wind,upper_limit(4,:),province_num,I0(1:province_num,4));
[pv_capacity_piecewise,cost_pv_pw] = generate_piecewise_data(piecewise_data_pv,upper_limit(3,:),province_num,I0(1:province_num,5) + I0(1:province_num,11));
%% 定义待规划变量
% 新增线路容量（不考虑线路退役）
AC_del_topo_capaity = sdpvar(stage,province_num,province_num,'full');
DC_del_topo_capaity = sdpvar(stage,province_num,province_num,'full');

% 总线路容量规划
AC_total_topo_capaity = sdpvar(stage,province_num,province_num,'full');
DC_total_topo_capaity = sdpvar(stage,province_num,province_num,'full');

% 机组规划变量  2020-2050年总共有6个阶段
delI_c=sdpvar(province_num,stage,1,'full');                         
delI_g=sdpvar(province_num,stage,1,'full');  
delI_won=sdpvar(province_num,stage,seg,1,'full');  
delI_woff = sdpvar(province_num,stage,1,'full');  
delI_sc=sdpvar(province_num,stage,seg,1,'full');  
delI_h=sdpvar(province_num,stage,1,'full');  
delI_nu=sdpvar(province_num,stage,'full');  
delI_es=sdpvar(province_num,stage,1,'full');  
delI_cccs=sdpvar(province_num,stage,1,'full');  
delI_gccs=sdpvar(province_num,stage,1,'full');  
delI_sd=sdpvar(province_num,stage,seg,1,'full');  
delI_bio=sdpvar(province_num,stage,1,'full');  
delI_bioccs=sdpvar(province_num,stage,1,'full');  
delI_ps=sdpvar(province_num,stage,1,'full'); 
delI_csp=sdpvar(province_num,stage,1,'full'); 

delI_SLB_LFP=sdpvar(province_num,stage,1,'full');
delI_SLB_NCMH=sdpvar(province_num,stage,1,'full');
delI_SLB_NCMM=sdpvar(province_num,stage,1,'full');
delI_SLB_NCML=sdpvar(province_num,stage,1,'full');
delI_SLB_NCA=sdpvar(province_num,stage,1,'full');
delI_SLB_LMO=sdpvar(province_num,stage,1,'full');
% delI_SLB_LFP=zeros(province_num,stage,1);
% delI_SLB_NCMH=zeros(province_num,stage,1);
% delI_SLB_NCMM=zeros(province_num,stage,1);
% delI_SLB_NCML=zeros(province_num,stage,1);
% delI_SLB_NCA=zeros(province_num,stage,1);
% delI_SLB_LMO=zeros(province_num,stage,1);

delI_SLB_LFP_conv=zeros(province_num,1); % v5, 计算时的成本，运行，以及其他限制可能需要乘的数，表达平均折算
delI_SLB_NCMH_conv=zeros(province_num,1); 
delI_SLB_NCMM_conv=zeros(province_num,1); 
delI_SLB_NCML_conv=zeros(province_num,1); 
delI_SLB_NCA_conv=zeros(province_num,1); 
delI_SLB_LMO_conv=zeros(province_num,1);

% 机组退役变量  
delIR_c=sdpvar(province_num,stage,1,'full');  
delIR_g=sdpvar(province_num,stage,1,'full');  
delIR_won=sdpvar(province_num,stage,seg,1,'full');
delIR_woff = sdpvar(province_num,stage,1,'full'); 
delIR_sc=sdpvar(province_num,stage,seg,1,'full'); 
delIR_h=sdpvar(province_num,stage,1,'full');  
delIR_nu=sdpvar(province_num,stage,1,'full');  
delIR_es=sdpvar(province_num,stage,1,'full'); 
delIR_cccs=sdpvar(province_num,stage,1,'full');  
delIR_gccs=sdpvar(province_num,stage,1,'full');  
delIR_sd=sdpvar(province_num,stage,seg,1,'full');  
delIR_bio=sdpvar(province_num,stage,1,'full');  
delIR_bioccs=sdpvar(province_num,stage,1,'full');  
delIR_ps=sdpvar(province_num,stage,1,'full');  
delIR_csp=sdpvar(province_num,stage,1,'full');  

delIR_SLB_LFP=sdpvar(province_num,stage,1,'full'); 
delIR_SLB_NCMH=sdpvar(province_num,stage,1,'full'); 
delIR_SLB_NCMM=sdpvar(province_num,stage,1,'full'); 
delIR_SLB_NCML=sdpvar(province_num,stage,1,'full'); 
delIR_SLB_NCA=sdpvar(province_num,stage,1,'full'); 
delIR_SLB_LMO=sdpvar(province_num,stage,1,'full'); 

delI_SLB_LFP_COT=sdpvar(city_num,city_num,stage,'full'); % 每个城市间的电池传输量
delI_SLB_NCMH_COT=sdpvar(city_num,city_num,stage,'full'); 
delI_SLB_NCMM_COT=sdpvar(city_num,city_num,stage,'full'); 
delI_SLB_NCML_COT=sdpvar(city_num,city_num,stage,'full'); 
delI_SLB_NCA_COT=sdpvar(city_num,city_num,stage,'full'); 
delI_SLB_LMO_COT=sdpvar(city_num,city_num,stage,'full'); 

% 机组总规划容量
I_c=sdpvar(province_num,stage,1,'full');  
I_g=sdpvar(province_num,stage,1,'full');  
I_won=sdpvar(province_num,stage,1,'full');  
I_woff=sdpvar(province_num,stage,1,'full'); 
I_sc=sdpvar(province_num,stage,1,'full');  
I_h=sdpvar(province_num,stage,1,'full');  
I_nu=sdpvar(province_num,stage,'full');  
I_es=sdpvar(province_num,stage,1,'full');                                         
I_cccs=sdpvar(province_num,stage,1,'full');  
I_gccs=sdpvar(province_num,stage,1,'full');  
I_sd=sdpvar(province_num,stage,1,'full');  
I_bio=sdpvar(province_num,stage,1,'full');  
I_bioccs=sdpvar(province_num,stage,1,'full');  
I_ps=sdpvar(province_num,stage,1,'full');  
I_csp = sdpvar(province_num,stage,1,'full'); 

I_SLB_LFP=sdpvar(province_num,stage,1,'full');
I_SLB_NCMH=sdpvar(province_num,stage,1,'full');
I_SLB_NCMM=sdpvar(province_num,stage,1,'full');
I_SLB_NCML=sdpvar(province_num,stage,1,'full');
I_SLB_NCA=sdpvar(province_num,stage,1,'full');
I_SLB_LMO=sdpvar(province_num,stage,1,'full');

I_won_seg=sdpvar(province_num,stage,seg,1,'full');  %海上风电规划
I_sc_seg=sdpvar(province_num,stage,seg,1,'full');  %集中式光伏规划
I_sd_seg=sdpvar(province_num,stage,seg,1,'full');  %分布式光伏规划

%运行变量               
P_loadshedding = sdpvar(province_num,T,24,stage,'full');
P_c = sdpvar(province_num,T,24,stage,'full');  
P_g=sdpvar(province_num,T,24,stage,'full');  
P_bio=sdpvar(province_num,T,24,stage,'full');  
P_cccs=sdpvar(province_num,T,24,stage,'full');  
P_gccs=sdpvar(province_num,T,24,stage,'full');  
P_bioccs=sdpvar(province_num,T,24,stage,'full');  
P_netcccs=sdpvar(province_num,T,24,stage,'full');  
P_netgccs=sdpvar(province_num,T,24,stage,'full');  
P_netbioccs=sdpvar(province_num,T,24,stage,'full');  
P_woff=sdpvar(province_num,T,24,stage,'full');  
P_won=sdpvar(province_num,T,24,stage,'full'); 
P_sc=sdpvar(province_num,T,24,stage,'full');  
P_sd=sdpvar(province_num,T,24,stage,'full');  
P_h=sdpvar(province_num,T,24,stage,'full');  
P_nu=sdpvar(province_num,T,24,stage,'full');  
P_ch=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES=sdpvar(province_num,T,24,stage,'full'); %电化学储能的能量存储
P_psch=sdpvar(province_num,T,24,stage,'full'); %抽水蓄能充电
P_psdis=sdpvar(province_num,T,24,stage,'full'); %抽水蓄能放电
PS=sdpvar(province_num,T,24,stage,'full'); %抽水蓄能的能量存储

ES_SLB_LFP=sdpvar(province_num,T,24,stage,'full'); %SLB LFP电化学储能的能量存储
P_ch_SLB_LFP=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_LFP=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES_SLB_NCMH=sdpvar(province_num,T,24,stage,'full'); %SLB NNMH电化学储能的能量存储
P_ch_SLB_NCMH=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_NCMH=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES_SLB_NCMM=sdpvar(province_num,T,24,stage,'full'); %SLB NCMM电化学储能的能量存储
P_ch_SLB_NCMM=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_NCMM=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES_SLB_NCML=sdpvar(province_num,T,24,stage,'full'); %SLB NCML电化学储能的能量存储
P_ch_SLB_NCML=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_NCML=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES_SLB_NCA=sdpvar(province_num,T,24,stage,'full'); %SLB NCA电化学储能的能量存储
P_ch_SLB_NCA=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_NCA=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电
ES_SLB_LMO=sdpvar(province_num,T,24,stage,'full'); %SLB LMO电化学储能的能量存储
P_ch_SLB_LMO=sdpvar(province_num,T,24,stage,'full');  %电化学储能充电
P_dis_SLB_LMO=sdpvar(province_num,T,24,stage,'full');  %电化学储能放电

% CSP 变量
P_csp = sdpvar(province_num,T,24,stage,'full'); % csp发电量
CAP_csp_SF=sdpvar(province_num,stage,'full'); %cap_cap
CAP_csp_TES=sdpvar(province_num,stage,'full');
CSP_S=sdpvar(province_num,T,24,stage,'full');% S

%无ccs火电机组在线容量
I_onc=sdpvar(province_num,T,24,stage,'full');
I_ong=sdpvar(province_num,T,24,stage,'full');
I_onbio=sdpvar(province_num,T,24,stage,'full');
delI_onc=sdpvar(province_num,T,24,stage,'full'); 
delI_ong=sdpvar(province_num,T,24,stage,'full');
delI_onbio=sdpvar(province_num,T,24,stage,'full');
delID_onc=sdpvar(province_num,T,24,stage,'full'); 
delID_ong=sdpvar(province_num,T,24,stage,'full');
delID_onbio=sdpvar(province_num,T,24,stage,'full');

%含有ccs火电机组在线容量
I_oncccs=sdpvar(province_num,T,24,stage,'full');
I_ongccs=sdpvar(province_num,T,24,stage,'full');
I_onbioccs=sdpvar(province_num,T,24,stage,'full');
delI_oncccs=sdpvar(province_num,T,24,stage,'full'); 
delI_ongccs=sdpvar(province_num,T,24,stage,'full');
delI_onbioccs=sdpvar(province_num,T,24,stage,'full');
delID_oncccs=sdpvar(province_num,T,24,stage,'full'); 
delID_ongccs=sdpvar(province_num,T,24,stage,'full');
delID_onbioccs=sdpvar(province_num,T,24,stage,'full');

% 核电在线容量
I_onnu = sdpvar(province_num,T,24,stage,'full');
delI_onnu=sdpvar(province_num,T,24,stage,'full');
delID_onnu=sdpvar(province_num,T,24,stage,'full');

% %旋转备用能力
Phot_c=sdpvar(province_num,T,24,stage,'full');
Phot_g=sdpvar(province_num,T,24,stage,'full');
Phot_bio=sdpvar(province_num,T,24,stage,'full');
Phot_cccs=sdpvar(province_num,T,24,stage,'full');
Phot_gccs=sdpvar(province_num,T,24,stage,'full');
Phot_bioccs=sdpvar(province_num,T,24,stage,'full');
Phot_h=sdpvar(province_num,T,24,stage,'full');
Phot_nu=sdpvar(province_num,T,24,stage,'full');
Phot_es=sdpvar(province_num,T,24,stage,'full');
Phot_ps=sdpvar(province_num,T,24,stage,'full');
Phot_csp=sdpvar(province_num,T,24,stage,'full');

Phot_SLB_LFP=sdpvar(province_num,T,24,stage,'full');
Phot_SLB_NCMH=sdpvar(province_num,T,24,stage,'full'); 
Phot_SLB_NCMM=sdpvar(province_num,T,24,stage,'full');
Phot_SLB_NCML=sdpvar(province_num,T,24,stage,'full');
Phot_SLB_NCA=sdpvar(province_num,T,24,stage,'full');
Phot_SLB_LMO=sdpvar(province_num,T,24,stage,'full');

% Phot_IF_DC_from = sdpvar(province_num,province_num,T,24,stage,'full');
Phot_IF_DC_to = sdpvar(province_num,province_num,T,24,stage,'full');

% 输电线路传输功率  
P_AC_from = sdpvar(province_num,province_num,12,24,stage,'full'); 
P_AC_to = sdpvar(province_num,province_num,12,24,stage,'full');
P_DC_from = sdpvar(province_num,province_num,12,24,stage,'full');
P_DC_to = sdpvar(province_num,province_num,12,24,stage,'full');

% 传输线路建模的辅助变量（auxiliary variables）
P_AC_forward = sdpvar(province_num,province_num,12,24,stage,'full');
P_AC_back = sdpvar(province_num,province_num,12,24,stage,'full');
P_DC_forward = sdpvar(province_num,province_num,12,24,stage,'full');

%CCS      
emcap_c = sdpvar(province_num,T,24,stage,'full'); %ccs煤电机组碳捕捉重量
emcap_g = sdpvar(province_num,T,24,stage,'full'); %ccs气电机组碳捕捉重量
emcap_bio = sdpvar(province_num,T,24,stage,'full'); %ccs气电机组碳捕捉重量
emnet_c = sdpvar(province_num,T,24,stage,'full'); %ccs煤电机组净碳排放量
emnet_g = sdpvar(province_num,T,24,stage,'full'); %ccs气电机组净碳排放量
emnet_bio = sdpvar(province_num,T,24,stage,'full'); %ccs气电机组净碳排放量


%% 约束
C_var = [];
C_var = [C_var,
    delI_c >= 0,
    delI_g >= 0,
    delI_won >= 0,
    delI_woff >= 0,
    delI_sc >= 0,
    delI_h >= 0,
    delI_nu >= 0,
    delI_es >= 0,
    delI_cccs >= 0,
    delI_gccs >= 0,
    delI_sd >= 0,
    delI_bio >= 0,
    delI_bioccs >= 0,
    delI_ps >= 0,
    delI_csp >=0,
    delI_SLB_LFP >= 0,
    delI_SLB_NCMH >= 0,
    delI_SLB_NCMM >= 0,
    delI_SLB_NCML >= 0,
    delI_SLB_NCA >= 0,
    delI_SLB_LMO >= 0,

    delIR_c >= 0,
    delIR_g >= 0,
    delIR_won >= 0,
    delIR_woff >= 0,
    delIR_sc >= 0,
    delIR_h >= 0,
    delIR_nu >= 0,
    delIR_es >= 0, 

    delIR_cccs >= 0,
    delIR_gccs >= 0,
    delIR_sd >= 0,
    delIR_bio >= 0,
    delIR_bioccs >= 0,
    delID_onnu >= 0,
    delI_onnu>=0,
    delIR_ps >= 0,
    delIR_csp>=0,

    delIR_SLB_LFP >= 0,
    delIR_SLB_NCMH >= 0,
    delIR_SLB_NCMM >= 0,
    delIR_SLB_NCML >= 0,
    delIR_SLB_NCA >= 0,
    delIR_SLB_LMO >= 0,

    %开停机容量非负约束 (22)-(23)
    delI_onc >= 0,
    delID_onc >= 0,
    delI_ong >= 0,
    delID_ong >= 0,
    delI_onbio >= 0,
    delID_onbio >= 0,
    
    delI_oncccs >= 0,
    delID_oncccs >= 0,
    delI_ongccs >= 0,
    delID_ongccs >= 0,
    delI_onbioccs >= 0,
    delID_onbioccs >= 0,
    
    I_won_seg>=0;
    I_sc_seg>=0;
    I_sd_seg>=0;

    P_c >=0,
    P_g>=0,
    P_cccs>=0,
    P_gccs>=0,
    P_bio>=0,
    P_bioccs>=0,
    P_nu>=0,
    P_csp>=0,

    %  新增线路非负
    AC_del_topo_capaity >= 0,
    DC_del_topo_capaity >= 0,
    ];
% 
% for i = 1:stage%%%%%%%%%%%%
%     if i <= 3
%         C_var = [C_var,delIR_es(:,i,1) >= 0,];
%     else
%         C_var = [C_var,delIR_es(:,i,1) == delI_es(:,i-3,1),];
%     end
% end
steppp = 3

%% 将TLs相关的矩阵中无需规划的变量都赋值为零，避免出现无界的情况
C_ERR = [];
for prv = 1:province_num
    for intr = 1:province_num
        if AC_matrix(prv,intr) + candidate_AC(prv,intr) == 0
            C_ERR = [C_ERR,
                AC_total_topo_capaity(:,prv,intr) == 0,
                AC_del_topo_capaity(:,prv,intr) == 0,
                P_AC_from(prv,intr,:,:,:) == 0,
                P_AC_to(prv,intr,:,:,:) == 0,
                P_AC_forward(prv,intr,:,:,:) ==0,
                P_AC_back(prv,intr,:,:,:) == 0,
            ];
        end
        if DC_matrix(prv,intr) + candidate_DC(prv,intr) == 0
            C_ERR = [C_ERR,
                DC_total_topo_capaity(:,prv,intr) == 0,
                DC_del_topo_capaity(:,prv,intr) == 0,
                P_DC_forward(prv,intr,:,:,:) == 0,
                P_DC_from(prv,intr,:,:,:) == 0,
                P_DC_to(prv,intr,:,:,:) == 0,
                Phot_IF_DC_to(prv,intr,:,:,:) == 0,
                ];
        end
    end
end
steppp = 4 % 2min

%% 传输线路新增容量上限的约束
for prv = 1:province_num
    for intr = 1:province_num
        if AC_matrix(prv,intr) + candidate_AC(prv,intr) ~= 0
            C_ERR = [C_ERR,
                AC_total_topo_capaity(:,prv,intr) <= AC_matrix(prv,intr) + candidate_AC(prv,intr),
                ];
        end
        if DC_matrix(prv,intr) + candidate_DC(prv,intr) ~= 0
            C_ERR = [C_ERR,
                DC_total_topo_capaity(:,prv,intr) <= DC_matrix(prv,intr) + candidate_DC(prv,intr),
                ];
        end
    end
end
steppp = 5

%% 针对没有海上风电、光伏、陆上风电等的省份（因为这里是系数，若某个省系数为零，则规划变量可以无限小，最终可能会出现负的情况）
for prv = 1:province_num
    if wind_off(:,:,prv) == 0 %海上风电
        C_ERR = [C_ERR,
            I_woff(prv,:) == 0,
            delI_woff(prv,:) == 0,
            delIR_woff(prv,:) == 0,
            ];
    end
    if wind_on(:,:,prv) == 0 %陆上风电
        C_ERR = [C_ERR,
            I_won(prv,:) == 0,
            delI_won(prv,:,:) == 0,
            delIR_won(prv,:,:) == 0,
            ];
    end
    if solar_u(:,:,prv) == 0 % 集中式光伏
        C_ERR = [C_ERR,
            I_sc(prv,:,:) == 0,
            delI_sc(prv,:,:) == 0,
            delIR_sc(prv,:,:) == 0,
            ];
    end
    if solar(:,:,prv) == 0 % 分布式光伏
        C_ERR = [C_ERR,
            I_sd(prv,:,:) == 0,
            delI_sd(prv,:,:) == 0,
            delIR_sd(prv,:,:) == 0,
            ];
    end
    if csp_data(:,:,prv) == 0 % 分布式光伏
    C_ERR = [C_ERR,
        I_csp(prv,:) == 0,
        delI_csp(prv,:) == 0,
        delIR_csp(prv,:) == 0,
        ];
    end
end
steppp = 6

s1=1;
%% Total Developable Renewable Capacity Constraints
C_CAP = [];
%加一个天然气的上限试试
C_CAP = [C_CAP,
    sum(I_g(:,stage)) <= 421, %csp容量上限
    ];

% for s = 1:stage
%     for n = 1:city_num
%         for m = 1:city_num
%             C_CAP = [C_CAP,
%                 delI_SLB_LFP_COT(n,m,s) >= 0,
%                 delI_SLB_NCMH_COT(n,m,s) >= 0,
%                 delI_SLB_NCMM_COT(n,m,s) >= 0,
%                 delI_SLB_NCML_COT(n,m,s) >= 0,
%                 delI_SLB_NCA_COT(n,m,s) >= 0,
%                 delI_SLB_LMO_COT(n,m,s) >= 0,
%                 ];
%         end
%     end
%     steppp = 6+s
% end
% for s = 1:stage
%     for n = 1:city_num
%         for m = 1:city_num
            C_CAP = [C_CAP,
                delI_SLB_LFP_COT >= 0,
                delI_SLB_NCMH_COT >= 0,
                delI_SLB_NCMM_COT >= 0,
                delI_SLB_NCML_COT >= 0,
                delI_SLB_NCA_COT >= 0,
                delI_SLB_LMO_COT >= 0,
                ];
%         end
%     end
    steppp = 7
% end

for prv = 1:province_num
    C_CAP = [C_CAP,
        I_nu(prv,:) <= upper_limit(1,prv)/1000, % 核电装机限制
        I_sc(prv,:)+ I_sd(prv,:) <= upper_limit(3,prv)/1000, % 光伏总装机上限约束
        I_sd(prv,:) <= upper_limit(2,prv)/1000, % 分布式光伏总装机上限约束
        I_won(prv,:) <= upper_limit(4,prv)/1000, % 陆上风电
        I_woff(prv,:) <= upper_limit(5,prv)/1000, % 海上风电
        I_h(prv,:) <= upper_limit(6,prv)/1000,% 水电容量上限
        I_bio(prv,:) <=upper_limit(7,prv)/1000,  % 生物质能
        I_csp(prv,:) <= upper_limit(8,prv)/1000, %csp容量上限
        
        ]; 
end
steppp = 13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 陆上风电及光伏的阶段总装机容量
for prv = 1:province_num
    for seg_num=1:seg
        C_CAP = [C_CAP,
            I_won_seg(prv,s1,seg_num,1) == delI_won(prv,s1,seg_num,1) - delIR_won(prv,s1,seg_num,1),
            I_sc_seg(prv,s1,seg_num,1) == delI_sc(prv,s1,seg_num,1) - delIR_sc(prv,s1,seg_num,1),
            I_sd_seg(prv,s1,seg_num,1) == delI_sd(prv,s1,seg_num,1) - delIR_sd(prv,s1,seg_num,1),
            I_won_seg(prv,s1,seg_num,1) <= won_capacity_piecewise(prv,seg_num),
            I_sc_seg(prv,s1,seg_num,1) + I_sd_seg(prv,s1,seg_num,1)<= pv_capacity_piecewise(prv,seg_num),
            ];          

    end
        C_CAP = [C_CAP,
            I_won(prv,s1) == I0(prv,4) + sum(I_won_seg(prv,s1,:)),
            I_sc(prv,s1) == I0(prv,5) + sum(I_sc_seg(prv,s1,:)),
            I_sd(prv,s1) == I0(prv,11) + sum(I_sd_seg(prv,s1,:)),
            ];
    for s = 2:stage
        for seg_num=1:seg
        C_CAP = [C_CAP,
            I_won_seg(prv,s,seg_num,1) == I_won_seg(prv,s-1,seg_num,1) + delI_won(prv,s,seg_num,1) - delIR_won(prv,s,seg_num,1),
            I_sc_seg(prv,s,seg_num,1) == I_sc_seg(prv,s-1,seg_num,1) + delI_sc(prv,s,seg_num,1) - delIR_sc(prv,s,seg_num,1),
            I_sd_seg(prv,s,seg_num,1) == I_sd_seg(prv,s-1,seg_num,1) + delI_sd(prv,s,seg_num,1) - delIR_sd(prv,s,seg_num,1),
            I_won_seg(prv,s,seg_num,1)<= won_capacity_piecewise(prv,seg_num),
            I_sc_seg(prv,s,seg_num,1) + I_sd_seg(prv,s,seg_num,1) <= pv_capacity_piecewise(prv,seg_num),
                       
            ];
        end
        C_CAP = [C_CAP,
            I_won(prv,s) == I0(prv,4) + sum(I_won_seg(prv,s,:)),
            I_sc(prv,s) == I0(prv,5) + sum(I_sc_seg(prv,s,:)),
            I_sd(prv,s) == I0(prv,11) + sum(I_sd_seg(prv,s,:)),
            ];
        
    end
    
end
steppp = 14

%% Natural Gas Resource Constraints
C_GAS = [];
% P_g=sdpvar(province_num,T,24,stage,'full');  
% 
% for prv = 1:province_num
%     for s = 1:stage
%         C_GAS = [C_GAS,
%             eta_gas*sum(sum(P_g(prv,:,:,s)))*365/(12*10^6) <= gas_limits(prv,s)*10^2,
%             ];
%     end
% end

% 考虑典型日天数版本
P_gofDay = sdpvar(province_num,stage,T,'full');
for prv = 1:province_num
    for s = 1:stage
        for d = 1:12
            C_GAS = [C_GAS,
                P_gofDay(prv,s,d) == Day_num(d)*sum(P_g(prv,d,:,s));   %每种典型日的产气量
                ];
        end
    end
end
steppp = 15

for prv = 1:province_num
    for s = 1:stage
            C_GAS = [C_GAS,
                eta_gas*sum(P_gofDay(prv,s,:))/(10^6) <= gas_limits(prv,s)*10^2,
            ];
    end
end
steppp = 16

%% Water Constraints

%% Generator Capacity Factor Constraint
C_CF = [];
for prv = 1:province_num
    for s = 1:stage 
        C_CF = [C_CF,
            sum(sum(P_c(prv,:,:,s))) >= 0.228310*I_c(prv,s)*12*24, %2000/8760
            sum(sum(P_cccs(prv,:,:,s))) >= 0.228310*I_cccs(prv,s)*12*24,
            sum(sum(P_g(prv,:,:,s))) >= 0.1712328*I_g(prv,s)*12*24,%1500/8760
            sum(sum(P_gccs(prv,:,:,s))) >= 0.1712328*I_gccs(prv,s)*12*24,
            sum(sum(P_bio(prv,:,:,s))) >= 0.228310*I_bio(prv,s)*12*24, %2000/8760
            sum(sum(P_bio(prv,:,:,s))) <= 0.856164*I_bio(prv,s)*12*24,%7500/8760
            sum(sum(P_bioccs(prv,:,:,s))) >= 0.228310*I_bioccs(prv,s)*12*24,
            sum(sum(P_bioccs(prv,:,:,s))) <= 0.856164*I_bioccs(prv,s)*12*24,
            sum(sum(P_h(prv,:,:,s))) <= cf_h_upper(prv,1)*I_h(prv,s)*12*24,
            sum(sum(P_nu(prv,:,:,s))) >= 0.684931*I_nu(prv,s)*12*24,%6000/8760
            sum(sum(P_nu(prv,:,:,s))) <= cf_nu*I_nu(prv,s)*12*24,
            ];
    end
end
steppp = 17

%% Carbon Emission Reduction Goals
C_CARBON = [];
% for prv = 1:province_num
%     for s = 1:stage  
%         emission_cin(prv,s) = (sum(sum(P_c(prv,:,:,s)))*865 + sum(sum(P_g(prv,:,:,s)))*312 + sum(sum(emnet_c(prv,:,:,s) + emnet_g(prv,:,:,s) + emnet_bio(prv,:,:,s))))*365/(12*10^8);
%     end
% end
% 
% % 阶段碳排放目标约束（cn2050）初始2020排放量是45.45  
% carbon_lim = [43.60 34.85 21.86 7.62 1.69 0];
% for s=1:stage
%     C_CARBON = [C_CARBON,
%         sum(emission_cin(:,s)) <= carbon_lim(s),
%         ];
% end

% for prv = 1:province_num
%     for s = 1:stage  
%         emission_cin(prv,s) = (sum(sum(P_c(prv,:,:,s)))*865 + sum(sum(P_g(prv,:,:,s)))*312 + sum(sum(emnet_c(prv,:,:,s) + emnet_g(prv,:,:,s) + emnet_bio(prv,:,:,s))))*365/(12*10^8);
%     end
% end
% 
% % 阶段碳排放目标约束（cn2050）初始2020排放量是45.45    
% C_CARBON = [C_CARBON, 
%     %总碳排放约束
% %     (45.45 + sum(emission_cin(:,1)))*5/2 + 5*sum(sum(emission_cin(:,:))) - 5*(sum(emission_cin(:,1)) + sum(emission_cin(:,6)))/2<= (662-45.45), %小于等于662亿吨
%     %时间节点约束 emission_c(1)为2025年
%     sum(emission_cin(:,1)) <= 43.60,
%     sum(emission_cin(:,2)) <= 34.85,
%     sum(emission_cin(:,3)) <= 21.86,
%     sum(emission_cin(:,4)) <= 7.62,
%     sum(emission_cin(:,5)) <= 1.69,
%     sum(emission_cin(:,6)) <= 0,
%     ];

%计及典型日天数版本
emission_cin = sdpvar(province_num,T,stage,'full');
for prv = 1:province_num
    for s = 1:stage
        for d = 1:12
            C_CARBON = [C_CARBON,
                emission_cin(prv,d,s) == Day_num(d)*(sum(sum(P_c(prv,d,:,s)))*865 + sum(sum(P_g(prv,d,:,s)))*312 + sum(sum(emnet_c(prv,d,:,s) + emnet_g(prv,d,:,s) + emnet_bio(prv,d,:,s))))/(10^8);
                ];
        end
    end
end
steppp = 18
% 阶段碳排放目标约束（cn2050）初始2020排放量是45.45    
% C_CARBON = [C_CARBON, 
%     总碳排放约束
%     (45.45 + sum(emission_cin(:,1)))*5/2 + 5*sum(sum(emission_cin(:,:))) - 5*(sum(emission_cin(:,1)) + sum(emission_cin(:,6)))/2<= (662-45.45), %小于等于662亿吨
%     时间节点约束 emission_c(1)为2025年
%     sum(sum(emission_cin(:,:,1))) <= 43.60,
%     sum(sum(emission_cin(:,:,2))) <= 34.85,
%     sum(sum(emission_cin(:,:,3))) <= 21.86,
%     sum(sum(emission_cin(:,:,4))) <= 7.62,
%     sum(sum(emission_cin(:,:,5))) <= 1.69,
%     sum(sum(emission_cin(:,:,6))) <= 0,
%     ];

% 阶段碳排放目标约束（cn2050）初始2020排放量是45.45  
carbon_lim = [43.60 34.85 21.86 7.62 1.69 0]; % 2050
% carbon_lim = [43.60 34.85 21.86 7.62 0 0]; %2045
for s=1:stage
    C_CARBON = [C_CARBON,
        sum(sum(emission_cin(:,:,s))) <= carbon_lim(s),
        ];
end
steppp = 19

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear num;
%% Transmission Line Model --num=1728 
%% 这里时间有好几分钟,5个省
num = 0;
[len_s_AC,~] = size(Sparse_AC_total);
[len_s_DC,~] = size(Sparse_DC_total);
C_Lines = [];

for s= 1:stage
    for day = 1:12
        for t = 1:24
            num = num + 1;
            for qq = 1:len_s_AC
                prv = Sparse_AC_total(qq,1);
                intr = Sparse_AC_total(qq,2);
                C_Lines= [C_Lines,
                    P_AC_from(prv,intr,day,t,s) == P_AC_forward(prv,intr,day,t,s) - (1-loss_AC(prv,intr))*P_AC_back(prv,intr,day,t,s),
                    P_AC_to(prv,intr,day,t,s) == (1-loss_AC(prv,intr))*P_AC_forward(prv,intr,day,t,s) - P_AC_back(prv,intr,day,t,s),
                    0 <= P_AC_forward(prv,intr,day,t,s) <= AC_total_topo_capaity(s,prv,intr),
                    0 <= P_AC_back(prv,intr,day,t,s) <= AC_total_topo_capaity(s,prv,intr),
                    ];

            end
            if Sparse_DC_total ~=0
                for jj = 1:len_s_DC
                    prv = Sparse_DC_total(jj,1);
                    intr = Sparse_DC_total(jj,2);
                    C_Lines = [C_Lines,
                        P_DC_from(prv,intr,day,t,s) == P_DC_forward(prv,intr,day,t,s),
                        P_DC_to(prv,intr,day,t,s) == (1-loss_DC(prv,intr))*P_DC_forward(prv,intr,day,t,s),
                        0 <= P_DC_forward(prv,intr,day,t,s) <= DC_total_topo_capaity(s,prv,intr),
                        ];
                end
            end
        end
    end
end
steppp = 20 % 360min，全国

clear num;
clear prv intr;
%% Thermal and Nuclear Power Generation Constraints
C_thermal = [];
        C_thermal = [C_thermal,
               P_c <= I_onc, %最小发电功率约束(19)
               P_c >= 0.4.*I_onc, 
               P_g <= I_ong, 
               P_g >= 0.3.*I_ong,
               P_bio <= I_onbio, 
               P_bio >= 0.35.*I_onbio,
               %有ccs的火电发电约束
               P_cccs <= I_oncccs, % 发电功率约束(19)
               P_cccs >= 0.4.*I_oncccs,
               P_gccs <= I_ongccs, 
               P_gccs >= 0.3.*I_ongccs,
               P_bioccs <= I_onbioccs, 
               P_bioccs >= 0.35.*I_onbioccs,
               % 核电约束
               0.5.*I_onnu <= P_nu,
               P_nu <= I_onnu,
               
               0 <= I_onc,  
               0 <= I_ong, 
               0 <= I_onbio, 
               0 <= I_oncccs, 
               0 <= I_ongccs, 
               0 <= I_onbioccs, 
               
               0 <= I_onnu ,

               ];
for prv=1:province_num
    for s= 1:stage
        for i=1:T  % 12个典型日
        C_thermal = [C_thermal,
               I_onc(prv,i,:,s) <= I_c(prv,s), %在线容量小于总容量
               I_ong(prv,i,:,s) <= I_g(prv,s),
               I_onbio(prv,i,:,s) <= I_bio(prv,s),
               I_oncccs(prv,i,:,s) <= I_cccs(prv,s,1), % 在线容量约束(20)
               I_ongccs(prv,i,:,s) <= I_gccs(prv,s,1),
               I_onbioccs(prv,i,:,s) <= I_bioccs(prv,s,1), 
               
               I_onnu(prv,i,:,s) <= I_nu(prv,s,1),

               ];

        end
    end
end
steppp = 21

t1=1;
for prv=1:province_num
    for s= 1:stage
        C_thermal = [C_thermal,
             I_onc(prv,:,t1,s)==cf_coal*I_c(prv,s),
             I_ong(prv,:,t1,s) == cf_gas*I_g(prv,s),
             I_onbio(prv,:,t1,s) == cf_bio*I_bio(prv,s),
             I_oncccs(prv,:,t1,s) == cf_coal*I_cccs(prv,s),
             I_ongccs(prv,:,t1,s) == cf_gas*I_gccs(prv,s),
             I_onbioccs(prv,:,t1,s) == cf_bio*I_bioccs(prv,s),
             ];
        for t=2:24
            C_thermal = [C_thermal,
               % 没有ccs火电机组
               I_onc(prv,:,t,s) == I_onc(prv,:,t-1,s) + delI_onc(prv,:,t,s) - delID_onc(prv,:,t,s), 
               I_ong(prv,:,t,s) == I_ong(prv,:,t-1,s) + delI_ong(prv,:,t,s) - delID_ong(prv,:,t,s),
               I_onbio(prv,:,t,s) == I_onbio(prv,:,t-1,s) + delI_onbio(prv,:,t,s) - delID_onbio(prv,:,t,s),
               I_onnu(prv,:,t,s) == I_onnu(prv,:,t-1,s) + delI_onnu(prv,:,t,s) - delID_onnu(prv,:,t,s),
               
               % 有ccs的火电机组
               I_oncccs(prv,:,t,s) == I_oncccs(prv,:,t-1,s) + delI_oncccs(prv,:,t,s) - delID_oncccs(prv,:,t,s), 
               I_ongccs(prv,:,t,s) == I_ongccs(prv,:,t-1,s) + delI_ongccs(prv,:,t,s) - delID_ongccs(prv,:,t,s),
               I_onbioccs(prv,:,t,s) == I_onbioccs(prv,:,t-1,s) + delI_onbioccs(prv,:,t,s) - delID_onbioccs(prv,:,t,s),
        
               % 核电一个典型日内出力不允许变化(38)
               P_nu(prv,:,t,s) ==  P_nu(prv,:,t-1,s),
               ];
            
        end
    end
end
steppp = 22

%% The model of CCS units-----
C_CCS = [];
for prv=1:province_num
    for s= 1:stage
        for i=1:T  % 12个典型日
            C_CCS = [C_CCS,
                  %CCS requirements(39)
                  (P_cccs(prv,i,:,s) - P_netcccs(prv,i,:,s) - 0.005*I_cccs(prv,s))*1000 == 0.296*emcap_c(prv,i,:,s),  %煤电碳捕捉用电量 0.296 MWH/t is given in the paper
                  (P_gccs(prv,i,:,s) - P_netgccs(prv,i,:,s) - 0.005*I_gccs(prv,s))*1000 == 0.296*emcap_g(prv,i,:,s),  %气电碳捕捉用电量
                  (P_bioccs(prv,i,:,s) - P_netbioccs(prv,i,:,s) - 0.005*I_bioccs(prv,s))*1000 == 0.296*emcap_bio(prv,i,:,s),  %bio电碳捕捉用电量
                  % 煤电和气电碳捕捉上下限) 假设最多90%的ccs(40)
                  emcap_c(prv,i,:,s) >= 0,   
                  emcap_c(prv,i,:,s) <= 0.9*e_coal*P_cccs(prv,i,:,s)*1000, %火电碳捕捉上限约束
                  emcap_g(prv,i,:,s) >= 0,
                  emcap_g(prv,i,:,s) <= 0.9*e_gas*P_gccs(prv,i,:,s)*1000, %气电碳捕捉上限约束
                  emcap_bio(prv,i,:,s) >= 0,
                  emcap_bio(prv,i,:,s) <= 0.9*e_bio*P_bioccs(prv,i,:,s)*1000, %生物质能捕捉上限约束
                  %CCS机组的净碳排放量(41)
                  emnet_c(prv,i,:,s) == e_coal*P_cccs(prv,i,:,s)*1000 - emcap_c(prv,i,:,s),
                  emnet_g(prv,i,:,s) == e_gas*P_gccs(prv,i,:,s)*1000 - emcap_g(prv,i,:,s),
                  emnet_bio(prv,i,:,s) == 0 - emcap_bio(prv,i,:,s),
                ];
        end
    end
end
steppp = 23

%% Wind and PV Power Generation Constraints & Hydro Plant Operation Constraints
C_RENEWS=[];
for prv=1:province_num
    for s= 1:stage
        for i=1:T  % 12个典型日
            C_RENEWS = [C_RENEWS,
            0 <= P_woff(prv,i,:,s) <= wind_off(:,i,prv)'.*I_woff(prv,s,1), 
            %陆上风电发电约束(27)
            0 <= P_won(prv,i,:,s) <= wind_on(:,i,prv)'.*I_won(prv,s,1),  
            %集中光伏发电约束(27)
            0 <= P_sc(prv,i,:,s) <=solar_u(:,i,prv)'.*I_sc(prv,s,1), 
            %分布式光伏发电约束
            0 <= P_sd(prv,i,:,s) <=solar(:,i,prv)'.*I_sd(prv,s,1),
            % Hydro Plant Operation Constraints(53)
            0 <= P_h(prv,i,:,s) <= I_h(prv,s,1), 
            ];
        end
    end
end
steppp = 24

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CSP
delta_sf = 2;
eff_csp = 0.38;
T_tes = 8;
C_CSP=[];
for prv = 1:province_num
    for s = 1:stage
        C_CSP = [C_CSP,
            CAP_csp_SF(prv,s) == delta_sf*I_csp(prv,s)/eff_csp,
            CAP_csp_TES(prv,s) == T_tes*I_csp(prv,s)/eff_csp,
            ];
    end
end
steppp = 25

for prv = 1:province_num
    for s = 1:stage
        for d = 1:12
            C_CSP = [C_CSP,
                 CSP_S(prv,d,1,s) == 0.5*CAP_csp_TES(prv,s), % 初始量设定
                 CSP_S(prv,d,1,s) == CSP_S(prv,d,24,s), %(50)
                 CSP_S(prv,d,:,s) >= 0,
                 CSP_S(prv,d,:,s) <= CAP_csp_TES(prv,s), %(51)
                 P_csp(prv,d,:,s) >= 0,
                 P_csp(prv,d,:,s) <= I_csp(prv,s), %(52)
                ];
            for t = 2:24
                C_CSP = [C_CSP,
                     (CSP_S(prv,d,t,s) - CSP_S(prv,d,t-1,s)) + P_csp(prv,d,t,s)/eff_csp <= csp_data(t,d,prv)*CAP_csp_SF(prv,s),
                    ];
            end
        end
    end
end
steppp = 26

%% 对于SLB，每种电池，每个省，SOH变化区间都会不同
run DegradPolicy.m;
steppp = 27

prov_SLB_LFP_COT = sdpvar(province_num,stage,'full');
prov_SLB_NCMH_COT = sdpvar(province_num,stage,'full');
prov_SLB_NCMM_COT = sdpvar(province_num,stage,'full');
prov_SLB_NCML_COT = sdpvar(province_num,stage,'full');
prov_SLB_NCA_COT = sdpvar(province_num,stage,'full');
prov_SLB_LMO_COT = sdpvar(province_num,stage,'full');
%% Continuity Equation Constraints of Installed Capacity
run manucap_storage.m;
for s = 1:stage
    C_CAP = [C_CAP,
        sum(sum(delI_woff(:,s,1))) <= manucap(2,s)*5,  % 海上风电 Offshore wind
        sum(sum(delI_won(:,s,:,1))) <= manucap(1,s)*5, % 陆上风电 onshore wind

        sum(sum(delI_sc(:,s,:,1))) <= manucap(3,s), % 集中式光伏 utility PV
        sum(sum(delI_sd(:,s,:,1))) <= manucap(4,s)*5, % 分布式光伏 distributed PV
        sum(delI_es(:,s,1)) <= manucap(6,s)*5*province_num/31, % BESS
        sum(delI_csp(:,s,1)) <= manucap(5,s)*5,% CSP
        
        sum(delI_ps(:,s,1)) <= 90, % PS
        sum(delI_nu(:,s,1)) <= 40, % nu
        sum(delI_h(:,s,1)) <= 70, % nu
        ];

    % 运输分配策略
    run TransPolicy.m; % 运输分配策略
end
steppp = 28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run DegradPolicyInUse.m;
for prv = 1:province_num
    C_CAP = [C_CAP,
        % 总装机容量计算
        I_c(prv,s1,1) == I0(prv,1) + delI_c(prv,s1,1) - delIR_c(prv,s1,1),
        I_g(prv,s1,1) == I0(prv,2) + delI_g(prv,s1,1) - delIR_g(prv,s1,1),
        I_woff(prv,s1,1) == I0(prv,3) + delI_woff(prv,s1,1) - delIR_woff(prv,s1,1),
        I_h(prv,s1,1) == I0(prv,6) + delI_h(prv,s1,1) - delIR_h(prv,s1,1),
        I_nu(prv,s1,1) == I0(prv,7) + delI_nu(prv,s1,1) - delIR_nu(prv,s1,1),
        I_es(prv,s1,1) == I0(prv,8) + delI_es_conv(prv,1)*delI_es(prv,s1,1) - delI_es_conv(prv,1)*delIR_es(prv,s1,1), % v5
        I_cccs(prv,s1,1) == I0(prv,9) + delI_cccs(prv,s1,1) - delIR_cccs(prv,s1,1),
        I_gccs(prv,s1,1) == I0(prv,10) + delI_gccs(prv,s1,1) - delIR_gccs(prv,s1,1),
        I_bio(prv,s1,1) == I0(prv,12) + delI_bio(prv,s1,1) - delIR_bio(prv,s1,1),
        I_bioccs(prv,s1,1) == I0(prv,13) + delI_bioccs(prv,s1,1) - delIR_bioccs(prv,s1,1),
        I_ps(prv,s1,1) == I0(prv,14) + delI_ps(prv,s1,1) - delIR_ps(prv,s1,1),
        I_csp(prv,s1,1) == I0(prv,15) + delI_csp(prv,s1,1) - delIR_csp(prv,s1,1),

        I_SLB_LFP(prv,s1,1) == I0(prv,16) + delI_SLB_LFP_conv(prv,1)*delI_SLB_LFP(prv,s1,1) - delI_SLB_LFP_conv(prv,1)*delIR_SLB_LFP(prv,s1,1), % v5
        I_SLB_NCMH(prv,s1,1) == I0(prv,17) + delI_SLB_NCMH_conv(prv,1)*delI_SLB_NCMH(prv,s1,1) - delI_SLB_NCMH_conv(prv,1)*delIR_SLB_NCMH(prv,s1,1),
        I_SLB_NCMM(prv,s1,1) == I0(prv,18) + delI_SLB_NCMM_conv(prv,1)*delI_SLB_NCMM(prv,s1,1) - delI_SLB_NCMM_conv(prv,1)*delIR_SLB_NCMM(prv,s1,1),
        I_SLB_NCML(prv,s1,1) == I0(prv,19) + delI_SLB_NCML_conv(prv,1)*delI_SLB_NCML(prv,s1,1) - delI_SLB_NCML_conv(prv,1)*delIR_SLB_NCML(prv,s1,1),
        I_SLB_NCA(prv,s1,1) == I0(prv,20) + delI_SLB_NCA_conv(prv,1)*delI_SLB_NCA(prv,s1,1) - delI_SLB_NCA_conv(prv,1)*delIR_SLB_NCA(prv,s1,1),
        I_SLB_LMO(prv,s1,1) == I0(prv,20) + delI_SLB_LMO_conv(prv,1)*delI_SLB_LMO(prv,s1,1) - delI_SLB_LMO_conv(prv,1)*delIR_SLB_LMO(prv,s1,1),
               
        % 初始线路规划
        AC_total_topo_capaity(1,prv,:) == AC_matrix(prv,:) + AC_del_topo_capaity(1,prv,:),
        DC_total_topo_capaity(1,prv,:) == DC_matrix(prv,:) + DC_del_topo_capaity(1,prv,:),
        
];

    for s = 2:stage
        C_CAP = [C_CAP,
            I_c(prv,s,1) == I_c(prv,s-1,1) + delI_c(prv,s,1) - delIR_c(prv,s,1),
            I_g(prv,s,1) == I_g(prv,s-1,1) + delI_g(prv,s,1) - delIR_g(prv,s,1),
            I_woff(prv,s,1) == I_woff(prv,s-1,1) + delI_woff(prv,s,1) - delIR_woff(prv,s,1),
            I_h(prv,s,1) == I_h(prv,s-1,1) + delI_h(prv,s,1) - delIR_h(prv,s,1),
            I_nu(prv,s,1) == I_nu(prv,s-1,1) + delI_nu(prv,s,1) - delIR_nu(prv,s,1),
            I_es(prv,s,1) == I_es(prv,s-1,1) + delI_es_conv(prv,1)*delI_es(prv,s,1) - delI_es_conv(prv,1)*delIR_es(prv,s,1),
            I_cccs(prv,s,1) == I_cccs(prv,s-1,1) + delI_cccs(prv,s,1) - delIR_cccs(prv,s,1),
            I_gccs(prv,s,1) == I_gccs(prv,s-1,1) + delI_gccs(prv,s,1) - delIR_gccs(prv,s,1),
            I_bio(prv,s,1) == I_bio(prv,s-1,1) + delI_bio(prv,s,1) - delIR_bio(prv,s,1),
            I_bioccs(prv,s,1) == I_bioccs(prv,s-1,1) + delI_bioccs(prv,s,1) - delIR_bioccs(prv,s,1),
            I_ps(prv,s,1) == I_ps(prv,s-1,1) + delI_ps(prv,s,1) - delIR_ps(prv,s,1),
            I_csp(prv,s,1) == I_csp(prv,s-1,1) + delI_csp(prv,s,1) - delIR_csp(prv,s,1),
            
            I_SLB_LFP(prv,s,1) == I_SLB_LFP(prv,s-1,1) + delI_SLB_LFP_conv(prv,1)*delI_SLB_LFP(prv,s,1) - delI_SLB_LFP_conv(prv,1)*delIR_SLB_LFP(prv,s,1),
            I_SLB_NCMH(prv,s,1) == I_SLB_NCMH(prv,s-1,1) + delI_SLB_NCMH_conv(prv,1)*delI_SLB_NCMH(prv,s,1) - delI_SLB_NCMH_conv(prv,1)*delIR_SLB_NCMH(prv,s,1),
            I_SLB_NCMM(prv,s,1) == I_SLB_NCMM(prv,s-1,1) + delI_SLB_NCMM_conv(prv,1)*delI_SLB_NCMM(prv,s,1) - delI_SLB_NCMM_conv(prv,1)*delIR_SLB_NCMM(prv,s,1),
            I_SLB_NCML(prv,s,1) == I_SLB_NCML(prv,s-1,1) + delI_SLB_NCML_conv(prv,1)*delI_SLB_NCML(prv,s,1) - delI_SLB_NCML_conv(prv,1)*delIR_SLB_NCML(prv,s,1),
            I_SLB_NCA(prv,s,1) == I_SLB_NCA(prv,s-1,1) + delI_SLB_NCA_conv(prv,1)*delI_SLB_NCA(prv,s,1) - delI_SLB_NCA_conv(prv,1)*delIR_SLB_NCA(prv,s,1),
            I_SLB_LMO(prv,s,1) == I_SLB_LMO(prv,s-1,1) + delI_SLB_LMO_conv(prv,1)*delI_SLB_LMO(prv,s,1) - delI_SLB_LMO_conv(prv,1)*delIR_SLB_LMO(prv,s,1),
        
            %输电线路规划
            AC_total_topo_capaity(s,prv,:) == AC_total_topo_capaity(s-1,prv,:) + AC_del_topo_capaity(s,prv,:),
            DC_total_topo_capaity(s,prv,:) == DC_total_topo_capaity(s-1,prv,:) + DC_del_topo_capaity(s,prv,:),
            AC_total_topo_capaity(s,prv,:) >= AC_matrix(prv,:),
            DC_total_topo_capaity(s,prv,:) >= DC_matrix(prv,:),

        ];
       
    end
    
end
steppp = 29

%% Power Reserve Requirements
C_PowerReserve = [];
for prv = 1:province_num
    for s = 1:stage
        C_PowerReserve = [C_PowerReserve,
            %power reserve requirement: reserve rate通常13-15%，先假设13%的备用率
            I_c(prv,s,1) + I_g(prv,s,1) + I_cccs(prv,s,1) + I_gccs(prv,s,1) +  (I_bio(prv,s,1) + I_bioccs(prv,s,1)) ...
            + 0.05*(I_won(prv,s,1) + I_woff(prv,s,1)) + I_h(prv,s,1) + I_nu(prv,s,1) + I_es(prv,s,1) + I_ps(prv,s,1) ...
            + I_csp(prv,s,1) + sum(DC_total_topo_capaity(s,:,prv)) ...
            + I_SLB_LFP(prv,s,1) + I_SLB_NCMH(prv,s,1) + I_SLB_NCMM(prv,s,1) + I_SLB_NCML(prv,s,1) + I_SLB_NCA(prv,s,1) + I_SLB_LMO(prv,s,1) ...
            >= (1+0.13)*(LD(prv,s)+ sum(DC_total_topo_capaity(s,prv,:))),
        ];
    end
end
steppp = 30

%% Regional Power Balancing
%%% 这里时间也很长，5省4min
C_RegionPowerBalance = [];
num = 0;
for prv=1:province_num
    for s= 1:stage
        for i = 1:T
            num = num+1;
            for t = 1:24
                C_RegionPowerBalance =[C_RegionPowerBalance,
                    % 各省功率平衡
                    P_c(prv,i,t,s) + P_g(prv,i,t,s) + P_bio(prv,i,t,s) + P_netcccs(prv,i,t,s) + P_netgccs(prv,i,t,s) + P_netbioccs(prv,i,t,s) ...
                    + P_woff(prv,i,t,s) + P_won(prv,i,t,s) + P_sc(prv,i,t,s) + P_sd(prv,i,t,s) + P_csp(prv,i,t,s) + P_h(prv,i,t,s) + P_nu(prv,i,t,s)...
                    - P_ch(prv,i,t,s) + P_dis(prv,i,t,s) - P_psch(prv,i,t,s) + P_psdis(prv,i,t,s) ...
                    - sum(P_AC_from(prv,:,i,t,s)) - sum(P_DC_from(prv,:,i,t,s)) + sum(P_AC_to(:,prv,i,t,s)) + sum(P_DC_to(:,prv,i,t,s)) ...
                    - P_ch_SLB_LFP(prv,i,t,s) + P_dis_SLB_LFP(prv,i,t,s) - P_ch_SLB_NCMH(prv,i,t,s) + P_dis_SLB_NCMH(prv,i,t,s) ...
                    - P_ch_SLB_NCMM(prv,i,t,s) + P_dis_SLB_NCMM(prv,i,t,s) - P_ch_SLB_NCML(prv,i,t,s) + P_dis_SLB_NCML(prv,i,t,s) ...
                    - P_ch_SLB_NCA(prv,i,t,s) + P_dis_SLB_NCA(prv,i,t,s) - P_ch_SLB_LMO(prv,i,t,s) + P_dis_SLB_LMO(prv,i,t,s) ...
                    == (ld(t,i,prv)*LD(prv,s)-P_loadshedding(prv,i,t,s))/(1-0.07),       
                    0 <= P_loadshedding(prv,i,t,s) <= ld(t,i,prv)*LD(prv,s),
                    ];
            end
        end
    end
end
steppp = 31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Energy Storage System Model
C_ESS = [];
for prv=1:province_num
    for s= 1:stage
        for i=1:T  % 12个典型日
            %(43),(45),(46)
            C_ESS = [C_ESS,
                %电化学储能
                0 <= P_ch(prv,i,:,s) <= I_es(prv,s), %充电功率约束, 1C
                0 <= P_dis(prv,i,:,s) <= I_es(prv,s), %(34)放电功率约束,1C
                0 <= ES(prv,i,:,s) <= 2*I_es(prv,s)*SOH_coeff, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES(prv,i,1,s) == ES(prv,i,24,s), %(37)典型日初始能量与结束能量相同
%              ES(prv,i,1,s) == 2*0.5*I_es(prv,s,1), %储能初始荷电率为50%

                %抽水蓄能
                0 <= P_psch(prv,i,:,s) <= I_ps(prv,s,1),
                0 <= P_psdis(prv,i,:,s) <= I_ps(prv,s,1),
                0 <= PS(prv,i,:,s) <= 8*I_ps(prv,s,1), %抽水蓄能的最大充电时间按照8小时计算
                PS(prv,i,1,s) == PS(prv,i,24,s),
%             PS(prv,i,1,s) == 4*I_ps(prv,s,1),

                % SLB
                0 <= P_ch_SLB_LFP(prv,i,:,s) <= I_SLB_LFP(prv,s), %充电功率约束
                0 <= P_dis_SLB_LFP(prv,i,:,s) <= I_SLB_LFP(prv,s), %(34)放电功率约束
                0 <= ES_SLB_LFP(prv,i,:,s) <= 2*I_SLB_LFP(prv,s)*SOH_coeff_LFP, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_LFP(prv,i,1,s) == ES_SLB_LFP(prv,i,24,s), %(37)典型日初始能量与结束能量相同

                0 <= P_ch_SLB_NCMH(prv,i,:,s) <= I_SLB_NCMH(prv,s), %充电功率约束
                0 <= P_dis_SLB_NCMH(prv,i,:,s) <= I_SLB_NCMH(prv,s), %(34)放电功率约束
                0 <= ES_SLB_NCMH(prv,i,:,s) <= 2*I_SLB_NCMH(prv,s)*SOH_coeff_NCMH, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_NCMH(prv,i,1,s) == ES_SLB_NCMH(prv,i,24,s), %(37)典型日初始能量与结束能量相同

                0 <= P_ch_SLB_NCMM(prv,i,:,s) <= I_SLB_NCMM(prv,s), %充电功率约束
                0 <= P_dis_SLB_NCMM(prv,i,:,s) <= I_SLB_NCMM(prv,s), %(34)放电功率约束
                0 <= ES_SLB_NCMM(prv,i,:,s) <= 2*I_SLB_NCMM(prv,s)*SOH_coeff_NCMM, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_NCMM(prv,i,1,s) == ES_SLB_NCMM(prv,i,24,s), %(37)典型日初始能量与结束能量相同

                0 <= P_ch_SLB_NCML(prv,i,:,s) <= I_SLB_NCML(prv,s), %充电功率约束
                0 <= P_dis_SLB_NCML(prv,i,:,s) <= I_SLB_NCML(prv,s), %(34)放电功率约束
                0 <= ES_SLB_NCML(prv,i,:,s) <= 2*I_SLB_NCML(prv,s)*SOH_coeff_NCML, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_NCML(prv,i,1,s) == ES_SLB_NCML(prv,i,24,s), %(37)典型日初始能量与结束能量相同

                0 <= P_ch_SLB_NCA(prv,i,:,s) <= I_SLB_NCA(prv,s), %充电功率约束
                0 <= P_dis_SLB_NCA(prv,i,:,s) <= I_SLB_NCA(prv,s), %(34)放电功率约束
                0 <= ES_SLB_NCA(prv,i,:,s) <= 2*I_SLB_NCA(prv,s)*SOH_coeff_NCA, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_NCA(prv,i,1,s) == ES_SLB_NCA(prv,i,24,s), %(37)典型日初始能量与结束能量相同

                0 <= P_ch_SLB_LMO(prv,i,:,s) <= I_SLB_LMO(prv,s), %充电功率约束
                0 <= P_dis_SLB_LMO(prv,i,:,s) <= I_SLB_LMO(prv,s), %(34)放电功率约束
                0 <= ES_SLB_LMO(prv,i,:,s) <= 2*I_SLB_LMO(prv,s)*SOH_coeff_LMO, %(36)储能的最大能量为装机功率的2倍，按照2小时的储能计算
                ES_SLB_LMO(prv,i,1,s) == ES_SLB_LMO(prv,i,24,s), %(37)典型日初始能量与结束能量相同
                ];
        end
    end
end
steppp = 32

for prv=1:province_num
    for s = 1:stage
        for t = 2:24
            %(44)
            C_ESS = [C_ESS,
            %储能能量变化约束
            ES(prv,:,t,s) == ES(prv,:,t-1,s) + RTE*P_ch(prv,:,t,s) - P_dis(prv,:,t,s)/RTE, % the efficiency of storage discharging  --BESS
            %抽水蓄能
            PS(prv,:,t,s) == PS(prv,:,t-1,s) + 0.75*P_psch(prv,:,t,s) - P_psdis(prv,:,t,s)/0.75, % the efficiency of storage discharging  --PHS
            %SLB
            ES_SLB_LFP(prv,:,t,s) == ES_SLB_LFP(prv,:,t-1,s) + RTE_LFP*P_ch_SLB_LFP(prv,:,t,s) - P_dis_SLB_LFP(prv,:,t,s)/RTE_LFP, % the efficiency of storage discharging  --SLB LFP
            ES_SLB_NCMH(prv,:,t,s) == ES_SLB_NCMH(prv,:,t-1,s) + RTE_NCMH*P_ch_SLB_NCMH(prv,:,t,s) - P_dis_SLB_NCMH(prv,:,t,s)/RTE_NCMH, % the efficiency of storage discharging  --SLB NCMH
            ES_SLB_NCMM(prv,:,t,s) == ES_SLB_NCMM(prv,:,t-1,s) + RTE_NCMM*P_ch_SLB_NCMM(prv,:,t,s) - P_dis_SLB_NCMM(prv,:,t,s)/RTE_NCMM, % the efficiency of storage discharging  --SLB NCMH
            ES_SLB_NCML(prv,:,t,s) == ES_SLB_NCML(prv,:,t-1,s) + RTE_NCML*P_ch_SLB_NCML(prv,:,t,s) - P_dis_SLB_NCML(prv,:,t,s)/RTE_NCML, % the efficiency of storage discharging  --SLB NCMH
            ES_SLB_NCA(prv,:,t,s) == ES_SLB_NCA(prv,:,t-1,s) + RTE_NCA*P_ch_SLB_NCA(prv,:,t,s) - P_dis_SLB_NCA(prv,:,t,s)/RTE_NCA, % the efficiency of storage discharging  --SLB NCMH
            ES_SLB_LMO(prv,:,t,s) == ES_SLB_LMO(prv,:,t-1,s) + RTE_LMO*P_ch_SLB_LMO(prv,:,t,s) - P_dis_SLB_LMO(prv,:,t,s)/RTE_LMO, % the efficiency of storage discharging  --SLB NCMH
            ];
        end
    end
end
steppp = 33

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Minimum System Inertia Limits
h0 = 0.7;
H_g = sdpvar(province_num,stage,12,24,'full');
H_c = sdpvar(province_num,stage,12,24,'full');
H_bio = sdpvar(province_num,stage,12,24,'full');
H_cccs = sdpvar(province_num,stage,12,24,'full');
H_gccs = sdpvar(province_num,stage,12,24,'full');
H_bioccs = sdpvar(province_num,stage,12,24,'full');
H_nu = sdpvar(province_num,stage,12,24,'full');

H_hydro = sdpvar(province_num,stage,12,24,'full'); 
H_es = sdpvar(province_num,stage,12,24,'full');
H_ps = sdpvar(province_num,stage,12,24,'full');
H_csp = sdpvar(province_num,stage,12,24,'full');
H_SLB_LFP = sdpvar(province_num,stage,12,24,'full');
H_SLB_NCMH = sdpvar(province_num,stage,12,24,'full');
H_SLB_NCMM = sdpvar(province_num,stage,12,24,'full');
H_SLB_NCML = sdpvar(province_num,stage,12,24,'full');
H_SLB_NCA = sdpvar(province_num,stage,12,24,'full');
H_SLB_LMO = sdpvar(province_num,stage,12,24,'full');
C_Inertia = [];

for prv= 1:province_num
    for s = 1:stage
        for i = 1:T
            C_Inertia = [C_Inertia,
                H_g(prv,s,i,:) + H_c(prv,s,i,:) + H_bio(prv,s,i,:) + H_cccs(prv,s,i,:) + H_gccs(prv,s,i,:) ...
                + H_bioccs(prv,s,i,:) + H_nu(prv,s,i,:) + H_hydro(prv,s,i,:) + H_es(prv,s,i,:) + H_ps(prv,s,i,:) ...
                + H_csp(prv,s,i,:) ...
                + H_SLB_LFP(prv,s,i,:) + H_SLB_NCMH(prv,s,i,:) + H_SLB_NCMM(prv,s,i,:) + H_SLB_NCML(prv,s,i,:) + H_SLB_NCA(prv,s,i,:) + H_SLB_LMO(prv,s,i,:) ...
                >= 0.7*h0*(LD(prv,s).*ld(:,i,prv)),
                H_g(prv,s,i,:) == 4.97.*I_ong(prv,i,:,s),
                H_c(prv,s,i,:) == 5.89.*I_onc(prv,i,:,s),
                H_bio(prv,s,i,:) == 2.94.*I_onbio(prv,i,:,s),
                H_cccs(prv,s,i,:) == 5.89.*I_oncccs(prv,i,:,s),
                H_gccs(prv,s,i,:) == 4.97.*I_ongccs(prv,i,:,s),
                H_bioccs(prv,s,i,:) == 2.94.*I_onbio(prv,i,:,s),
                H_nu(prv,s,i,:) == 4.07.*I_onnu(prv,i,:,s),
                
                H_hydro(prv,s,i,:) == 2.83.*I_h(prv,s),
                H_ps(prv,s,i,:) == 2.83.*I_ps(prv,s),
                H_es(prv,s,i,:) == 5.89.*I_es(prv,s),
                H_csp(prv,s,i,:) == 2.94.*I_csp(prv,s), 
                H_SLB_LFP(prv,s,i,:) == 5.89.*I_SLB_LFP(prv,s),%%%%%%%%%%%%%%%%%%5.89
                H_SLB_NCMH(prv,s,i,:) == 5.89.*I_SLB_NCMH(prv,s),
                H_SLB_NCMM(prv,s,i,:) == 5.89.*I_SLB_NCMM(prv,s),
                H_SLB_NCML(prv,s,i,:) == 5.89.*I_SLB_NCML(prv,s),
                H_SLB_NCA(prv,s,i,:) == 5.89.*I_SLB_NCA(prv,s),
                H_SLB_LMO(prv,s,i,:) == 5.89.*I_SLB_LMO(prv,s),
                ];
        end
    end
end
steppp = 34

%% 目标函数

jd = 6;

%计及典型日的运行成本计算
c_ope_day=sdpvar(province_num,stage,T,'full');
c_on_day=sdpvar(province_num,stage,T,'full');
c_ccs_day=sdpvar(province_num,stage,T,'full');
c_Lsh_day=sdpvar(province_num,stage,T,'full');


for prv = 1:province_num
    for s=1:stage
        for d=1:12
            C_var = [C_var,
            c_ope_day(prv,s,d) == huansuan1(6)*Day_num(d)*(cost_ope(15,s+jd)*sum(P_csp(prv,d,:,s)) + cost_ope(1,s+jd)*sum(P_c(prv,d,:,s)) + cost_ope(2,s+jd)*sum(P_g(prv,d,:,s)) + cost_ope(12,s+jd)*sum(P_bio(prv,d,:,s)) + cost_ope(9,s+jd)*sum(P_cccs(prv,d,:,s)) + cost_ope(10,s+jd)*sum(P_gccs(prv,d,:,s)) + cost_ope(13,s+jd)*sum(P_bioccs(prv,d,:,s)) + cost_ope(7,s+jd)*sum(P_nu(prv,d,:,s)))/(1000000),
            % 开机成本 单位：10亿CNY  煤电1.1CNY/kW  气电0.3CNY/kW  开机只用开一次，不用乘5
            c_on_day(prv,s,d) ==  huansuan1(6)*Day_num(d)*(22*sum(delI_onnu(prv,d,:,s)) + 1.1*sum(delI_onc(prv,d,:,s) + delI_oncccs(prv,d,:,s)) + 0.3*sum(delI_ong(prv,d,:,s) + delI_ongccs(prv,d,:,s)) + 0.5*sum(delI_onbio(prv,d,:,s) + delI_onbioccs(prv,d,:,s)))/(10^3),
            % ccs成本 单位：10亿CNY
            c_ccs_day(prv,s,d) ==  huansuan1(6)*Day_num(d)*(390.8*sum(emcap_c(prv,d,:,s)) + 305.4*sum(emcap_g(prv,d,:,s)) + 305.4*sum(emcap_bio(prv,d,:,s)))/(10^9),
            % Load shedding cost
            c_Lsh_day(prv,s,d) ==  huansuan1(6)*Day_num(d)*(3*sum(P_loadshedding(prv,d,:,s)))/(10^3),
            ];            
        end
    end
end
steppp = 35

for prv = 1:province_num
    for s=1:stage
        c_ope(prv,s) = sum(c_ope_day(prv,s,:));
        c_on(prv,s) = sum(c_on_day(prv,s,:));
        c_ccs(prv,s) = sum(c_ccs_day(prv,s,:));
        c_Lsh(prv,s) = sum(c_Lsh_day(prv,s,:));
    end
end
steppp = 36

run InvCost.m;
run MaintCost.m; 
steppp = 37

%%%%%%%%% 鼓励政策
run EncouPolicy.m; 
steppp = 38

% c_total = c_inv + c_fom + c_ope + c_ccs + c_on + c_Lsh + c_inv_pw + c_trans;
% cc_total = [c_inv; c_fom; c_ope ; c_ccs; c_on; c_Lsh; c_inv_pw; c_trans];
c_total = c_inv + c_fom + c_ope + c_ccs + c_on + c_Lsh + c_inv_pw ;
cc_total = [c_inv; c_fom; c_ope ; c_ccs; c_on; c_Lsh; c_inv_pw];

for s=1:stage
    cc_total_hs(:,s) = 1.06^(0-5*s)*cc_total(:,s); %%%%%
end
steppp = 39
toc
tic

%% 目标函数优化求解
C = [C_var,C_ERR,C_CAP,C_GAS,C_CF,C_CARBON,C_PowerReserve,C_RegionPowerBalance,C_Lines,C_thermal,C_CCS,C_RENEWS,C_ESS,C_CSP,C_Inertia,C_Encou];

n_vars = yalmip('nvars');  % 总变量数
n_constraints = length(C);  % 总约束数

ops=sdpsettings('solver','gurobi');

% DualReductions = 0;

ops.gurobi.MIPGap = 1e-4; %误差允许
% ops.gurobi.Timelimit = 500; %时间限制
% ops.cplex.mip.tolerances.mipgap = 1e-3;
result = optimize(C, sum(cc_total_hs(:)), ops);
% iis = gurobi_iis(result)

if result.problem == 0 % problem =0 代表求解成功
else
    error('求解出错');
end

toc


run result_calcul.m;
