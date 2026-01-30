%%%%%%%%%%%%%%%%%%%%%%%只能邻省流通限制       

% for n = 1:city
% for prv = 1:province_num
%             if prv == 1 %%%%%%%% Beijing
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s) + SLB_LFP(2,s) + SLB_LFP(3,s), % 某个省使用的梯次电池小于等于邻省加本省的退役电池之和
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s) + SLB_NCMH(2,s) + SLB_NCMH(3,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s) + SLB_NCMM(2,s) + SLB_NCMM(3,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s) + SLB_NCML(2,s) + SLB_NCML(3,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s) + SLB_NCA(2,s) + SLB_NCA(3,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s) + SLB_LMO(2,s) + SLB_LMO(3,s),
                    delI_SLB_LFP(1,s,1) == delI_SLB_LFP_COT(1,1,s) + delI_SLB_LFP_COT(2,1,s) + sum(delI_SLB_LFP_COT(3:13,1,s)), % 邻省向北京运送的梯次电池等于北京梯次电池的装机量
                    delI_SLB_NCMH(1,s,1) == delI_SLB_NCMH_COT(1,1,s) + delI_SLB_NCMH_COT(2,1,s) + sum(delI_SLB_NCMH_COT(3:13,1,s)), 
                    delI_SLB_NCMM(1,s,1) == delI_SLB_NCMM_COT(1,1,s) + delI_SLB_NCMM_COT(2,1,s) + sum(delI_SLB_NCMM_COT(3:13,1,s)), 
                    delI_SLB_NCML(1,s,1) == delI_SLB_NCML_COT(1,1,s) + delI_SLB_NCML_COT(2,1,s) + sum(delI_SLB_NCML_COT(3:13,1,s)), 
                    delI_SLB_NCA(1,s,1) == delI_SLB_NCA_COT(1,1,s) + delI_SLB_NCA_COT(2,1,s) + sum(delI_SLB_NCA_COT(3:13,1,s)), 
                    delI_SLB_LMO(1,s,1) == delI_SLB_LMO_COT(1,1,s) + delI_SLB_LMO_COT(2,1,s) + sum(delI_SLB_LMO_COT(3:13,1,s)), 
                    ];
                
%             elseif prv == 2 %%%%%%%% Tianjin
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(1,s)+SLB_LFP(3,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(1,s)+SLB_NCMH(3,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(1,s)+SLB_NCMM(3,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(1,s)+SLB_NCML(3,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(1,s)+SLB_NCA(3,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(1,s)+SLB_LMO(3,s),
                    delI_SLB_LFP(2,s,1) == delI_SLB_LFP_COT(2,2,s) + delI_SLB_LFP_COT(1,2,s) + sum(delI_SLB_LFP_COT(3:13,2,s)),
                    delI_SLB_NCMH(2,s,1) == delI_SLB_NCMH_COT(2,2,s) + delI_SLB_NCMH_COT(1,2,s) + sum(delI_SLB_NCMH_COT(3:13,2,s)),
                    delI_SLB_NCMM(2,s,1) == delI_SLB_NCMM_COT(2,2,s) + delI_SLB_NCMM_COT(1,2,s) + sum(delI_SLB_NCMM_COT(3:13,2,s)),
                    delI_SLB_NCML(2,s,1) == delI_SLB_NCML_COT(2,2,s) + delI_SLB_NCML_COT(1,2,s) + sum(delI_SLB_NCML_COT(3:13,2,s)),
                    delI_SLB_NCA(2,s,1) == delI_SLB_NCA_COT(2,2,s) + delI_SLB_NCA_COT(1,2,s) + sum(delI_SLB_NCA_COT(3:13,2,s)),
                    delI_SLB_LMO(2,s,1) == delI_SLB_LMO_COT(2,2,s) + delI_SLB_LMO_COT(1,2,s) + sum(delI_SLB_LMO_COT(3:13,2,s)),
                    ]; 
%             elseif prv == 3 %%%%%%%%% Hebei
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(2,s)+SLB_LFP(1,s)+SLB_LFP(4,s)+SLB_LFP(5,s)+SLB_LFP(6,s)+SLB_LFP(15,s)+SLB_LFP(16,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(2,s)+SLB_NCMH(1,s)+SLB_NCMH(4,s)+SLB_NCMH(5,s)+SLB_NCMH(6,s)+SLB_NCMH(15,s)+SLB_NCMH(16,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(2,s)+SLB_NCMM(1,s)+SLB_NCMM(4,s)+SLB_NCMM(5,s)+SLB_NCMM(6,s)+SLB_NCMM(15,s)+SLB_NCMM(16,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(2,s)+SLB_NCML(1,s)+SLB_NCML(4,s)+SLB_NCML(5,s)+SLB_NCML(6,s)+SLB_NCML(15,s)+SLB_NCML(16,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(2,s)+SLB_NCA(1,s)+SLB_NCA(4,s)+SLB_NCA(5,s)+SLB_NCA(6,s)+SLB_NCA(15,s)+SLB_NCA(16,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(2,s)+SLB_LMO(1,s)+SLB_LMO(4,s)+SLB_LMO(5,s)+SLB_LMO(6,s)+SLB_LMO(15,s)+SLB_LMO(16,s),
                    delI_SLB_LFP(3,s,1) == sum(sum(delI_SLB_LFP_COT(3:13,3:13,s))) + sum(delI_SLB_LFP_COT(2,3:13,s)) + sum(delI_SLB_LFP_COT(1,3:13,s)) + sum(sum(delI_SLB_LFP_COT(14:24,3:13,s))) + sum(sum(delI_SLB_LFP_COT(25:36,3:13,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(37:50,3:13,s))) + sum(sum(delI_SLB_LFP_COT(134:149,3:13,s))) + sum(sum(delI_SLB_LFP_COT(150:166,3:13,s))),
                    delI_SLB_NCMH(3,s,1) == sum(sum(delI_SLB_NCMH_COT(3:13,3:13,s))) + sum(delI_SLB_NCMH_COT(2,3:13,s)) + sum(delI_SLB_NCMH_COT(1,3:13,s)) + sum(sum(delI_SLB_NCMH_COT(14:24,3:13,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,3:13,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(37:50,3:13,s))) + sum(sum(delI_SLB_NCMH_COT(134:149,3:13,s))) + sum(sum(delI_SLB_NCMH_COT(150:166,3:13,s))),
                    delI_SLB_NCMM(3,s,1) == sum(sum(delI_SLB_NCMM_COT(3:13,3:13,s))) + sum(delI_SLB_NCMM_COT(2,3:13,s)) + sum(delI_SLB_NCMM_COT(1,3:13,s)) + sum(sum(delI_SLB_NCMM_COT(14:24,3:13,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,3:13,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(37:50,3:13,s))) + sum(sum(delI_SLB_NCMM_COT(134:149,3:13,s))) + sum(sum(delI_SLB_NCMM_COT(150:166,3:13,s))),
                    delI_SLB_NCML(3,s,1) == sum(sum(delI_SLB_NCML_COT(3:13,3:13,s))) + sum(delI_SLB_NCML_COT(2,3:13,s)) + sum(delI_SLB_NCML_COT(1,3:13,s)) + sum(sum(delI_SLB_NCML_COT(14:24,3:13,s))) + sum(sum(delI_SLB_NCML_COT(25:36,3:13,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(37:50,3:13,s))) + sum(sum(delI_SLB_NCML_COT(134:149,3:13,s))) + sum(sum(delI_SLB_NCML_COT(150:166,3:13,s))),
                    delI_SLB_NCA(3,s,1) == sum(sum(delI_SLB_NCA_COT(3:13,3:13,s))) + sum(delI_SLB_NCA_COT(2,3:13,s)) + sum(delI_SLB_NCA_COT(1,3:13,s)) + sum(sum(delI_SLB_NCA_COT(14:24,3:13,s))) + sum(sum(delI_SLB_NCA_COT(25:36,3:13,s))) ...
                    sum(sum(delI_SLB_NCA_COT(37:50,3:13,s))) + sum(sum(delI_SLB_NCA_COT(134:149,3:13,s))) + sum(sum(delI_SLB_NCA_COT(150:166,3:13,s))),
                    delI_SLB_LMO(3,s,1) == sum(sum(delI_SLB_LMO_COT(3:13,3:13,s))) + sum(delI_SLB_LMO_COT(2,3:13,s)) + sum(delI_SLB_LMO_COT(1,3:13,s)) + sum(sum(delI_SLB_LMO_COT(14:24,3:13,s))) + sum(sum(delI_SLB_LMO_COT(25:36,3:13,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(37:50,3:13,s))) + sum(sum(delI_SLB_LMO_COT(134:149,3:13,s))) + sum(sum(delI_SLB_LMO_COT(150:166,3:13,s))),
                    ];
%             elseif prv == 4 %%%%%%%%% Shanxi
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(3,s)+SLB_LFP(5,s)+SLB_LFP(16,s)+SLB_LFP(27,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(3,s)+SLB_NCMH(5,s)+SLB_NCMH(16,s)+SLB_NCMH(27,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(3,s)+SLB_NCMM(5,s)+SLB_NCMM(16,s)+SLB_NCMM(27,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(3,s)+SLB_NCML(5,s)+SLB_NCML(16,s)+SLB_NCML(27,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(3,s)+SLB_NCA(5,s)+SLB_NCA(16,s)+SLB_NCA(27,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(3,s)+SLB_LMO(5,s)+SLB_LMO(16,s)+SLB_LMO(27,s),
                    delI_SLB_LFP(4,s,1) == sum(sum(delI_SLB_LFP_COT(14:24,14:24,s))) + sum(sum(delI_SLB_LFP_COT(3:13,14:24,s))) + sum(sum(delI_SLB_LFP_COT(25:36,14:24,s))) + sum(sum(delI_SLB_LFP_COT(150:166,14:24,s))) + sum(sum(delI_SLB_LFP_COT(287:296,14:24,s))),
                    delI_SLB_NCMH(4,s,1) == sum(sum(delI_SLB_NCMH_COT(14:24,14:24,s))) + sum(sum(delI_SLB_NCMH_COT(3:13,14:24,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,14:24,s))) + sum(sum(delI_SLB_NCMH_COT(150:166,14:24,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,14:24,s))),
                    delI_SLB_NCMM(4,s,1) == sum(sum(delI_SLB_NCMM_COT(14:24,14:24,s))) + sum(sum(delI_SLB_NCMM_COT(3:13,14:24,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,14:24,s))) + sum(sum(delI_SLB_NCMM_COT(150:166,14:24,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,14:24,s))),
                    delI_SLB_NCML(4,s,1) == sum(sum(delI_SLB_NCML_COT(14:24,14:24,s))) + sum(sum(delI_SLB_NCML_COT(3:13,14:24,s))) + sum(sum(delI_SLB_NCML_COT(25:36,14:24,s))) + sum(sum(delI_SLB_NCML_COT(150:166,14:24,s))) + sum(sum(delI_SLB_NCML_COT(287:296,14:24,s))),
                    delI_SLB_NCA(4,s,1) == sum(sum(delI_SLB_NCA_COT(14:24,14:24,s))) + sum(sum(delI_SLB_NCA_COT(3:13,14:24,s))) + sum(sum(delI_SLB_NCA_COT(25:36,14:24,s))) + sum(sum(delI_SLB_NCA_COT(150:166,14:24,s))) + sum(sum(delI_SLB_NCA_COT(287:296,14:24,s))),
                    delI_SLB_LMO(4,s,1) == sum(sum(delI_SLB_LMO_COT(14:24,14:24,s))) + sum(sum(delI_SLB_LMO_COT(3:13,14:24,s))) + sum(sum(delI_SLB_LMO_COT(25:36,14:24,s))) + sum(sum(delI_SLB_LMO_COT(150:166,14:24,s))) + sum(sum(delI_SLB_LMO_COT(287:296,14:24,s))),
                    ];
%             elseif prv == 5 %%%%%%%%% Neimenggu
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(3,s)+SLB_LFP(4,s)+SLB_LFP(6,s)+SLB_LFP(7,s)+SLB_LFP(8,s)+SLB_LFP(27,s)+SLB_LFP(28,s)+SLB_LFP(30,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(3,s)+SLB_NCMH(4,s)+SLB_NCMH(6,s)+SLB_NCMH(7,s)+SLB_NCMH(8,s)+SLB_NCMH(27,s)+SLB_NCMH(28,s)+SLB_NCMH(30,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(3,s)+SLB_NCMM(4,s)+SLB_NCMM(6,s)+SLB_NCMM(7,s)+SLB_NCMM(8,s)+SLB_NCMM(27,s)+SLB_NCMM(28,s)+SLB_NCMM(30,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(3,s)+SLB_NCML(4,s)+SLB_NCML(6,s)+SLB_NCML(7,s)+SLB_NCML(8,s)+SLB_NCML(27,s)+SLB_NCML(28,s)+SLB_NCML(30,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(3,s)+SLB_NCA(4,s)+SLB_NCA(6,s)+SLB_NCA(7,s)+SLB_NCA(8,s)+SLB_NCA(27,s)+SLB_NCA(28,s)+SLB_NCA(30,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(3,s)+SLB_LMO(4,s)+SLB_LMO(6,s)+SLB_LMO(7,s)+SLB_LMO(8,s)+SLB_LMO(27,s)+SLB_LMO(28,s)+SLB_LMO(30,s),
                    delI_SLB_LFP(5,s,1) == sum(sum(delI_SLB_LFP_COT(25:36,25:36,s))) + sum(sum(delI_SLB_LFP_COT(3:13,25:36,s))) + sum(sum(delI_SLB_LFP_COT(14:24,25:36,s))) + sum(sum(delI_SLB_LFP_COT(37:50,25:36,s))) + sum(sum(delI_SLB_LFP_COT(51:59,25:36,s))) + sum(sum(delI_SLB_LFP_COT(60:72,25:36,s))) + sum(sum(delI_SLB_LFP_COT(287:296,25:36,s))) + sum(sum(delI_SLB_LFP_COT(297:310,25:36,s))) + sum(sum(delI_SLB_LFP_COT(319:323,25:36,s))),
                    delI_SLB_NCMH(5,s,1) == sum(sum(delI_SLB_NCMH_COT(25:36,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(3:13,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(14:24,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(37:50,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(51:59,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(60:72,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,25:36,s))) + sum(sum(delI_SLB_NCMH_COT(319:323,25:36,s))),
                    delI_SLB_NCMM(5,s,1) == sum(sum(delI_SLB_NCMM_COT(25:36,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(3:13,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(14:24,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(37:50,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(51:59,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(60:72,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,25:36,s))) + sum(sum(delI_SLB_NCMM_COT(319:323,25:36,s))),
                    delI_SLB_NCML(5,s,1) == sum(sum(delI_SLB_NCML_COT(25:36,25:36,s))) + sum(sum(delI_SLB_NCML_COT(3:13,25:36,s))) + sum(sum(delI_SLB_NCML_COT(14:24,25:36,s))) + sum(sum(delI_SLB_NCML_COT(37:50,25:36,s))) + sum(sum(delI_SLB_NCML_COT(51:59,25:36,s))) + sum(sum(delI_SLB_NCML_COT(60:72,25:36,s))) + sum(sum(delI_SLB_NCML_COT(287:296,25:36,s))) + sum(sum(delI_SLB_NCML_COT(297:310,25:36,s))) + sum(sum(delI_SLB_NCML_COT(319:323,25:36,s))),
                    delI_SLB_NCA(5,s,1) == sum(sum(delI_SLB_NCA_COT(25:36,25:36,s))) + sum(sum(delI_SLB_NCA_COT(3:13,25:36,s))) + sum(sum(delI_SLB_NCA_COT(14:24,25:36,s))) + sum(sum(delI_SLB_NCA_COT(37:50,25:36,s))) + sum(sum(delI_SLB_NCA_COT(51:59,25:36,s))) + sum(sum(delI_SLB_NCA_COT(60:72,25:36,s))) + sum(sum(delI_SLB_NCA_COT(287:296,25:36,s))) + sum(sum(delI_SLB_NCA_COT(297:310,25:36,s))) + sum(sum(delI_SLB_NCA_COT(319:323,25:36,s))),
                    delI_SLB_LMO(5,s,1) == sum(sum(delI_SLB_LMO_COT(25:36,25:36,s))) + sum(sum(delI_SLB_LMO_COT(3:13,25:36,s))) + sum(sum(delI_SLB_LMO_COT(14:24,25:36,s))) + sum(sum(delI_SLB_LMO_COT(37:50,25:36,s))) + sum(sum(delI_SLB_LMO_COT(51:59,25:36,s))) + sum(sum(delI_SLB_LMO_COT(60:72,25:36,s))) + sum(sum(delI_SLB_LMO_COT(287:296,25:36,s))) + sum(sum(delI_SLB_LMO_COT(297:310,25:36,s))) + sum(sum(delI_SLB_LMO_COT(319:323,25:36,s))),
                    ];
                if province_num > 5
%             elseif prv == 6 %%%%%%%%% Liaoning
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(3,s)+SLB_LFP(5,s)+SLB_LFP(7,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(3,s)+SLB_NCMH(5,s)+SLB_NCMH(7,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(3,s)+SLB_NCMM(5,s)+SLB_NCMM(7,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(3,s)+SLB_NCML(5,s)+SLB_NCML(7,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(3,s)+SLB_NCA(5,s)+SLB_NCA(7,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(3,s)+SLB_LMO(5,s)+SLB_LMO(7,s),
                    delI_SLB_LFP(6,s,1) == sum(sum(delI_SLB_LFP_COT(37:50,37:50,s))) + sum(sum(delI_SLB_LFP_COT(3:13,37:50,s))) + sum(sum(delI_SLB_LFP_COT(25:36,37:50,s))) + sum(sum(delI_SLB_LFP_COT(51:59,37:50,s))),
                    delI_SLB_NCMH(6,s,1) == sum(sum(delI_SLB_NCMH_COT(37:50,37:50,s))) + sum(sum(delI_SLB_NCMH_COT(3:13,37:50,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,37:50,s))) + sum(sum(delI_SLB_NCMH_COT(51:59,37:50,s))),
                    delI_SLB_NCMM(6,s,1) == sum(sum(delI_SLB_NCMM_COT(37:50,37:50,s))) + sum(sum(delI_SLB_NCMM_COT(3:13,37:50,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,37:50,s))) + sum(sum(delI_SLB_NCMM_COT(51:59,37:50,s))),
                    delI_SLB_NCML(6,s,1) == sum(sum(delI_SLB_NCML_COT(37:50,37:50,s))) + sum(sum(delI_SLB_NCML_COT(3:13,37:50,s))) + sum(sum(delI_SLB_NCML_COT(25:36,37:50,s))) + sum(sum(delI_SLB_NCML_COT(51:59,37:50,s))),
                    delI_SLB_NCA(6,s,1) == sum(sum(delI_SLB_NCA_COT(37:50,37:50,s))) + sum(sum(delI_SLB_NCA_COT(3:13,37:50,s))) + sum(sum(delI_SLB_NCA_COT(25:36,37:50,s))) + sum(sum(delI_SLB_NCA_COT(51:59,37:50,s))),
                    delI_SLB_LMO(6,s,1) == sum(sum(delI_SLB_LMO_COT(37:50,37:50,s))) + sum(sum(delI_SLB_LMO_COT(3:13,37:50,s))) + sum(sum(delI_SLB_LMO_COT(25:36,37:50,s))) + sum(sum(delI_SLB_LMO_COT(51:59,37:50,s))),
                    ];
%              elseif prv == 7 %%%%%%%%% Jilin
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(8,s)+SLB_LFP(5,s)+SLB_LFP(6,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(8,s)+SLB_NCMH(5,s)+SLB_NCMH(6,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(8,s)+SLB_NCMM(5,s)+SLB_NCMM(6,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(8,s)+SLB_NCML(5,s)+SLB_NCML(6,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(8,s)+SLB_NCA(5,s)+SLB_NCA(6,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(8,s)+SLB_LMO(5,s)+SLB_LMO(6,s),
                    delI_SLB_LFP(7,s,1) == sum(sum(delI_SLB_LFP_COT(51:59,51:59,s))) + sum(sum(delI_SLB_LFP_COT(60:72,51:59,s))) + sum(sum(delI_SLB_LFP_COT(25:36,51:59,s))) + sum(sum(delI_SLB_LFP_COT(37:50,51:59,s))),
                    delI_SLB_NCMH(7,s,1) == sum(sum(delI_SLB_NCMH_COT(51:59,51:59,s))) + sum(sum(delI_SLB_NCMH_COT(60:72,51:59,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,51:59,s))) + sum(sum(delI_SLB_NCMH_COT(37:50,51:59,s))),
                    delI_SLB_NCMM(7,s,1) == sum(sum(delI_SLB_NCMM_COT(51:59,51:59,s))) + sum(sum(delI_SLB_NCMM_COT(60:72,51:59,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,51:59,s))) + sum(sum(delI_SLB_NCMM_COT(37:50,51:59,s))),
                    delI_SLB_NCML(7,s,1) == sum(sum(delI_SLB_NCML_COT(51:59,51:59,s))) + sum(sum(delI_SLB_NCML_COT(60:72,51:59,s))) + sum(sum(delI_SLB_NCML_COT(25:36,51:59,s))) + sum(sum(delI_SLB_NCML_COT(37:50,51:59,s))),
                    delI_SLB_NCA(7,s,1) == sum(sum(delI_SLB_NCA_COT(51:59,51:59,s))) + sum(sum(delI_SLB_NCA_COT(60:72,51:59,s))) + sum(sum(delI_SLB_NCA_COT(25:36,51:59,s))) + sum(sum(delI_SLB_NCA_COT(37:50,51:59,s))),
                    delI_SLB_LMO(7,s,1) == sum(sum(delI_SLB_LMO_COT(51:59,51:59,s))) + sum(sum(delI_SLB_LMO_COT(60:72,51:59,s))) + sum(sum(delI_SLB_LMO_COT(25:36,51:59,s))) + sum(sum(delI_SLB_LMO_COT(37:50,51:59,s))),
                    ];
%             elseif prv == 8 %%%%%%%%% Heilongjiang
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(5,s)+SLB_LFP(7,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(5,s)+SLB_NCMH(7,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(5,s)+SLB_NCMM(7,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(5,s)+SLB_NCML(7,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(5,s)+SLB_LMO(7,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(5,s)+SLB_NCA(7,s),
                   delI_SLB_LFP(8,s,1) == sum(sum(delI_SLB_LFP_COT(60:72,60:72,s))) + sum(sum(delI_SLB_LFP_COT(25:36,60:72,s))) + sum(sum(delI_SLB_LFP_COT(51:59,60:72,s))),
                    delI_SLB_NCMH(8,s,1) == sum(sum(delI_SLB_NCMH_COT(60:72,60:72,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,60:72,s))) + sum(sum(delI_SLB_NCMH_COT(51:59,60:72,s))),
                    delI_SLB_NCMM(8,s,1) == sum(sum(delI_SLB_NCMM_COT(60:72,60:72,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,60:72,s))) + sum(sum(delI_SLB_NCMM_COT(51:59,60:72,s))),
                    delI_SLB_NCML(8,s,1) == sum(sum(delI_SLB_NCML_COT(60:72,60:72,s))) + sum(sum(delI_SLB_NCML_COT(25:36,60:72,s))) + sum(sum(delI_SLB_NCML_COT(51:59,60:72,s))),
                    delI_SLB_NCA(8,s,1) == sum(sum(delI_SLB_NCA_COT(60:72,60:72,s))) + sum(sum(delI_SLB_NCA_COT(25:36,60:72,s))) + sum(sum(delI_SLB_NCA_COT(51:59,60:72,s))),
                    delI_SLB_LMO(8,s,1) == sum(sum(delI_SLB_LMO_COT(60:72,60:72,s))) + sum(sum(delI_SLB_LMO_COT(25:36,60:72,s))) + sum(sum(delI_SLB_LMO_COT(51:59,60:72,s))),
                    ];
%             elseif prv == 9 %%%%%%%%% Shanghai
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s) + SLB_LFP(10,s) + SLB_LFP(11,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(10,s)+SLB_NCMH(11,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(10,s)+SLB_NCMM(11,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(10,s)+SLB_NCML(11,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(10,s)+SLB_NCA(11,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(10,s)+SLB_LMO(11,s),
                    delI_SLB_LFP(9,s,1) == delI_SLB_LFP_COT(73,73,s) + sum(delI_SLB_LFP_COT(74:86,73,s)) + sum(delI_SLB_LFP_COT(87:97,73,s)),
                    delI_SLB_NCMH(9,s,1) == delI_SLB_NCMH_COT(73,73,s) + sum(delI_SLB_NCMH_COT(74:86,73,s)) + sum(delI_SLB_NCMH_COT(87:97,73,s)),
                    delI_SLB_NCMM(9,s,1) == delI_SLB_NCMM_COT(73,73,s) + sum(delI_SLB_NCMM_COT(74:86,73,s)) + sum(delI_SLB_NCMM_COT(87:97,73,s)),
                    delI_SLB_NCML(9,s,1) == delI_SLB_NCML_COT(73,73,s) + sum(delI_SLB_NCML_COT(74:86,73,s)) + sum(delI_SLB_NCML_COT(87:97,73,s)),
                    delI_SLB_NCA(9,s,1) == delI_SLB_NCA_COT(73,73,s) + sum(delI_SLB_NCA_COT(74:86,73,s)) + sum(delI_SLB_NCA_COT(87:97,73,s)),
                    delI_SLB_LMO(9,s,1) == delI_SLB_LMO_COT(73,73,s) + sum(delI_SLB_LMO_COT(74:86,73,s)) + sum(delI_SLB_LMO_COT(87:97,73,s)),
                    ];
%             elseif prv == 10 %%%%%%%%% Jiangsu
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(9,s)+SLB_LFP(11,s)+SLB_LFP(12,s)+SLB_LFP(15,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(9,s)+SLB_NCMH(11,s)+SLB_NCMH(12,s)+SLB_NCMH(15,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(9,s)+SLB_NCMM(11,s)+SLB_NCMM(12,s)+SLB_NCMM(15,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(9,s)+SLB_NCML(11,s)+SLB_NCML(12,s)+SLB_NCML(15,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(9,s)+SLB_NCA(11,s)+SLB_NCA(12,s)+SLB_NCA(15,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(9,s)+SLB_LMO(11,s)+SLB_LMO(12,s)+SLB_LMO(15,s),
                    delI_SLB_LFP(10,s,1) == sum(sum(delI_SLB_LFP_COT(74:86,74:86,s))) + sum(delI_SLB_LFP_COT(73,74:86,s)) + sum(sum(delI_SLB_LFP_COT(87:97,74:86,s))) + sum(sum(delI_SLB_LFP_COT(98:113,74:86,s))) + sum(sum(delI_SLB_LFP_COT(134:149,74:86,s))),
                    delI_SLB_NCMH(10,s,1) == sum(sum(delI_SLB_NCMH_COT(74:86,74:86,s))) + sum(delI_SLB_NCMH_COT(73,74:86,s)) + sum(sum(delI_SLB_NCMH_COT(87:97,74:86,s))) + sum(sum(delI_SLB_NCMH_COT(98:113,74:86,s))) + sum(sum(delI_SLB_NCMH_COT(134:149,74:86,s))),
                    delI_SLB_NCMM(10,s,1) == sum(sum(delI_SLB_NCMM_COT(74:86,74:86,s))) + sum(delI_SLB_NCMM_COT(73,74:86,s)) + sum(sum(delI_SLB_NCMM_COT(87:97,74:86,s))) + sum(sum(delI_SLB_NCMM_COT(98:113,74:86,s))) + sum(sum(delI_SLB_NCMM_COT(134:149,74:86,s))),
                    delI_SLB_NCML(10,s,1) == sum(sum(delI_SLB_NCML_COT(74:86,74:86,s))) + sum(delI_SLB_NCML_COT(73,74:86,s)) + sum(sum(delI_SLB_NCML_COT(87:97,74:86,s))) + sum(sum(delI_SLB_NCML_COT(98:113,74:86,s))) + sum(sum(delI_SLB_NCML_COT(134:149,74:86,s))),
                    delI_SLB_NCA(10,s,1) == sum(sum(delI_SLB_NCA_COT(74:86,74:86,s))) + sum(delI_SLB_NCA_COT(73,74:86,s)) + sum(sum(delI_SLB_NCA_COT(87:97,74:86,s))) + sum(sum(delI_SLB_NCA_COT(98:113,74:86,s))) + sum(sum(delI_SLB_NCA_COT(134:149,74:86,s))),
                    delI_SLB_LMO(10,s,1) == sum(sum(delI_SLB_LMO_COT(74:86,74:86,s))) + sum(delI_SLB_LMO_COT(73,74:86,s)) + sum(sum(delI_SLB_LMO_COT(87:97,74:86,s))) + sum(sum(delI_SLB_LMO_COT(98:113,74:86,s))) + sum(sum(delI_SLB_LMO_COT(134:149,74:86,s))),
                    ];
%             elseif prv == 11 %%%%%%%%% Zhejiang
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(9,s)+SLB_LFP(10,s)+SLB_LFP(12,s)+SLB_LFP(13,s)+SLB_LFP(14,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(9,s)+SLB_NCMH(10,s)+SLB_NCMH(12,s)+SLB_NCMH(13,s)+SLB_NCMH(14,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(9,s)+SLB_NCMM(10,s)+SLB_NCMM(12,s)+SLB_NCMM(13,s)+SLB_NCMM(14,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(9,s)+SLB_NCML(10,s)+SLB_NCML(12,s)+SLB_NCML(13,s)+SLB_NCML(14,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(9,s)+SLB_NCA(10,s)+SLB_NCA(12,s)+SLB_NCA(13,s)+SLB_NCA(14,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(9,s)+SLB_LMO(10,s)+SLB_LMO(12,s)+SLB_LMO(13,s)+SLB_LMO(14,s),
                    delI_SLB_LFP(11,s,1) == sum(sum(delI_SLB_LFP_COT(87:97,87:97,s))) + sum(delI_SLB_LFP_COT(73,87:97,s)) + sum(sum(delI_SLB_LFP_COT(74:86,87:97,s))) + sum(sum(delI_SLB_LFP_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(114:122,87:97,s))) + sum(sum(delI_SLB_LFP_COT(123:133,87:97,s))),
                    delI_SLB_NCMH(11,s,1) == sum(sum(delI_SLB_NCMH_COT(87:97,87:97,s))) + sum(delI_SLB_NCMH_COT(73,87:97,s)) + sum(sum(delI_SLB_NCMH_COT(74:86,87:97,s))) + sum(sum(delI_SLB_NCMH_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(114:122,87:97,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,87:97,s))),
                    delI_SLB_NCMM(11,s,1) == sum(sum(delI_SLB_NCMM_COT(87:97,87:97,s))) + sum(delI_SLB_NCMM_COT(73,87:97,s)) + sum(sum(delI_SLB_NCMM_COT(74:86,87:97,s))) + sum(sum(delI_SLB_NCMM_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(114:122,87:97,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,87:97,s))),
                    delI_SLB_NCML(11,s,1) == sum(sum(delI_SLB_NCML_COT(87:97,87:97,s))) + sum(delI_SLB_NCML_COT(73,87:97,s)) + sum(sum(delI_SLB_NCML_COT(74:86,87:97,s))) + sum(sum(delI_SLB_NCML_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(114:122,87:97,s))) + sum(sum(delI_SLB_NCML_COT(123:133,87:97,s))),
                    delI_SLB_NCA(11,s,1) == sum(sum(delI_SLB_NCA_COT(87:97,87:97,s))) + sum(delI_SLB_NCA_COT(73,87:97,s)) + sum(sum(delI_SLB_NCA_COT(74:86,87:97,s))) + sum(sum(delI_SLB_NCA_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_NCA_COT(114:122,87:97,s))) + sum(sum(delI_SLB_NCA_COT(123:133,87:97,s))),
                    delI_SLB_LMO(11,s,1) == sum(sum(delI_SLB_LMO_COT(87:97,87:97,s))) + sum(delI_SLB_LMO_COT(73,87:97,s)) + sum(sum(delI_SLB_LMO_COT(74:86,87:97,s))) + sum(sum(delI_SLB_LMO_COT(98:113,87:97,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(114:122,87:97,s))) + sum(sum(delI_SLB_LMO_COT(123:133,87:97,s))),
                    ];
%             elseif prv == 12 %%%%%%%%% Anhui
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(9,s)+SLB_LFP(10,s)+SLB_LFP(11,s)+SLB_LFP(13,s)+SLB_LFP(14,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(9,s)+SLB_NCMH(10,s)+SLB_NCMH(11,s)+SLB_NCMH(13,s)+SLB_NCMH(14,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(9,s)+SLB_NCMM(10,s)+SLB_NCMM(11,s)+SLB_NCMM(13,s)+SLB_NCMM(14,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(9,s)+SLB_NCML(10,s)+SLB_NCML(11,s)+SLB_NCML(13,s)+SLB_NCML(14,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(9,s)+SLB_NCA(10,s)+SLB_NCA(11,s)+SLB_NCA(13,s)+SLB_NCA(14,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(9,s)+SLB_LMO(10,s)+SLB_LMO(11,s)+SLB_LMO(13,s)+SLB_LMO(14,s),
                    delI_SLB_LFP(12,s,1) == sum(sum(delI_SLB_LFP_COT(98:113,98:113,s))) + sum(delI_SLB_LFP_COT(73,98:113,s)) + sum(sum(delI_SLB_LFP_COT(74:86,98:113,s))) + sum(sum(delI_SLB_LFP_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(114:122,98:113,s))) + sum(sum(delI_SLB_LFP_COT(123:133,98:113,s))),
                    delI_SLB_NCMH(12,s,1) == sum(sum(delI_SLB_NCMH_COT(98:113,98:113,s))) + sum(delI_SLB_NCMH_COT(73,98:113,s)) + sum(sum(delI_SLB_NCMH_COT(74:86,98:113,s))) + sum(sum(delI_SLB_NCMH_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(114:122,98:113,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,98:113,s))),
                    delI_SLB_NCMM(12,s,1) == sum(sum(delI_SLB_NCMM_COT(98:113,98:113,s))) + sum(delI_SLB_NCMM_COT(73,98:113,s)) + sum(sum(delI_SLB_NCMM_COT(74:86,98:113,s))) + sum(sum(delI_SLB_NCMM_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(114:122,98:113,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,98:113,s))),
                    delI_SLB_NCML(12,s,1) == sum(sum(delI_SLB_NCML_COT(98:113,98:113,s))) + sum(delI_SLB_NCML_COT(73,98:113,s)) + sum(sum(delI_SLB_NCML_COT(74:86,98:113,s))) + sum(sum(delI_SLB_NCML_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(114:122,98:113,s))) + sum(sum(delI_SLB_NCML_COT(123:133,98:113,s))),
                    delI_SLB_NCA(12,s,1) == sum(sum(delI_SLB_NCA_COT(98:113,98:113,s))) + sum(delI_SLB_NCA_COT(73,98:113,s)) + sum(sum(delI_SLB_NCA_COT(74:86,98:113,s))) + sum(sum(delI_SLB_NCA_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_NCA_COT(114:122,98:113,s))) + sum(sum(delI_SLB_NCA_COT(123:133,98:113,s))),
                    delI_SLB_LMO(12,s,1) == sum(sum(delI_SLB_LMO_COT(98:113,98:113,s))) + sum(delI_SLB_LMO_COT(73,98:113,s)) + sum(sum(delI_SLB_LMO_COT(74:86,98:113,s))) + sum(sum(delI_SLB_LMO_COT(87:97,98:113,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(114:122,98:113,s))) + sum(sum(delI_SLB_LMO_COT(123:133,98:113,s))),
                    ];
%             elseif prv == 13 %%%%%%%%% Fujian
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(19,s)+SLB_LFP(11,s)+SLB_LFP(14,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(19,s)+SLB_NCMH(11,s)+SLB_NCMH(14,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(19,s)+SLB_NCMM(11,s)+SLB_NCMM(14,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(19,s)+SLB_NCML(11,s)+SLB_NCML(14,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(19,s)+SLB_NCA(11,s)+SLB_NCA(14,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(19,s)+SLB_LMO(11,s)+SLB_LMO(14,s),
                    delI_SLB_LFP(13,s,1) == sum(sum(delI_SLB_LFP_COT(114:122,114:122,s))) + sum(sum(delI_SLB_LFP_COT(194:214,114:122,s))) + sum(sum(delI_SLB_LFP_COT(87:97,114:122,s))) + sum(sum(delI_SLB_LFP_COT(123:133,114:122,s))),
                    delI_SLB_NCMH(13,s,1) == sum(sum(delI_SLB_NCMH_COT(114:122,114:122,s))) + sum(sum(delI_SLB_NCMH_COT(194:214,114:122,s))) + sum(sum(delI_SLB_NCMH_COT(87:97,114:122,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,114:122,s))),
                    delI_SLB_NCMM(13,s,1) == sum(sum(delI_SLB_NCMM_COT(114:122,114:122,s))) + sum(sum(delI_SLB_NCMM_COT(194:214,114:122,s))) + sum(sum(delI_SLB_NCMM_COT(87:97,114:122,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,114:122,s))),
                    delI_SLB_NCML(13,s,1) == sum(sum(delI_SLB_NCML_COT(114:122,114:122,s))) + sum(sum(delI_SLB_NCML_COT(194:214,114:122,s))) + sum(sum(delI_SLB_NCML_COT(87:97,114:122,s))) + sum(sum(delI_SLB_NCML_COT(123:133,114:122,s))),
                    delI_SLB_NCA(13,s,1) == sum(sum(delI_SLB_NCA_COT(114:122,114:122,s))) + sum(sum(delI_SLB_NCA_COT(194:214,114:122,s))) + sum(sum(delI_SLB_NCA_COT(87:97,114:122,s))) + sum(sum(delI_SLB_NCA_COT(123:133,114:122,s))),
                    delI_SLB_LMO(13,s,1) == sum(sum(delI_SLB_LMO_COT(114:122,114:122,s))) + sum(sum(delI_SLB_LMO_COT(194:214,114:122,s))) + sum(sum(delI_SLB_LMO_COT(87:97,114:122,s))) + sum(sum(delI_SLB_LMO_COT(123:133,114:122,s))),
                    ];
%             elseif prv == 14 %%%%%%%%% Jiangxi
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(19,s)+SLB_LFP(11,s)+SLB_LFP(13,s)+SLB_LFP(12,s)+SLB_LFP(17,s)+SLB_LFP(18,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(19,s)+SLB_NCMH(11,s)+SLB_NCMH(13,s)+SLB_NCMH(12,s)+SLB_NCMH(17,s)+SLB_NCMH(18,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(19,s)+SLB_NCMM(11,s)+SLB_NCMM(13,s)+SLB_NCMM(12,s)+SLB_NCMM(17,s)+SLB_NCMM(18,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(19,s)+SLB_NCML(11,s)+SLB_NCML(13,s)+SLB_NCML(12,s)+SLB_NCML(17,s)+SLB_NCML(18,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(19,s)+SLB_NCA(11,s)+SLB_NCA(13,s)+SLB_NCA(12,s)+SLB_NCA(17,s)+SLB_NCA(18,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(19,s)+SLB_LMO(11,s)+SLB_LMO(13,s)+SLB_LMO(12,s)+SLB_LMO(17,s)+SLB_LMO(18,s),
                    delI_SLB_LFP(14,s,1) == sum(sum(delI_SLB_LFP_COT(123:133,123:133,s))) + sum(sum(delI_SLB_LFP_COT(194:214,123:133,s))) + sum(sum(delI_SLB_LFP_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(114:122,123:133,s))) + sum(sum(delI_SLB_LFP_COT(98:113,123:133,s))) + sum(sum(delI_SLB_LFP_COT(167:179,123:133,s))) + sum(sum(delI_SLB_LFP_COT(180:193,123:133,s))),
                    delI_SLB_NCMH(14,s,1) == sum(sum(delI_SLB_NCMH_COT(123:133,123:133,s))) + sum(sum(delI_SLB_NCMH_COT(194:214,123:133,s))) + sum(sum(delI_SLB_NCMH_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(114:122,123:133,s))) + sum(sum(delI_SLB_NCMH_COT(98:113,123:133,s))) + sum(sum(delI_SLB_NCMH_COT(167:179,123:133,s))) + sum(sum(delI_SLB_NCMH_COT(180:193,123:133,s))),
                    delI_SLB_NCMM(14,s,1) == sum(sum(delI_SLB_NCMM_COT(123:133,123:133,s))) + sum(sum(delI_SLB_NCMM_COT(194:214,123:133,s))) + sum(sum(delI_SLB_NCMM_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(114:122,123:133,s))) + sum(sum(delI_SLB_NCMM_COT(98:113,123:133,s))) + sum(sum(delI_SLB_NCMM_COT(167:179,123:133,s))) + sum(sum(delI_SLB_NCMM_COT(180:193,123:133,s))),
                    delI_SLB_NCML(14,s,1) == sum(sum(delI_SLB_NCML_COT(123:133,123:133,s))) + sum(sum(delI_SLB_NCML_COT(194:214,123:133,s))) + sum(sum(delI_SLB_NCML_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(114:122,123:133,s))) + sum(sum(delI_SLB_NCML_COT(98:113,123:133,s))) + sum(sum(delI_SLB_NCML_COT(167:179,123:133,s))) + sum(sum(delI_SLB_NCML_COT(180:193,123:133,s))),
                    delI_SLB_NCA(14,s,1) == sum(sum(delI_SLB_NCA_COT(123:133,123:133,s))) + sum(sum(delI_SLB_NCA_COT(194:214,123:133,s))) + sum(sum(delI_SLB_NCA_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_NCA_COT(114:122,123:133,s))) + sum(sum(delI_SLB_NCA_COT(98:113,123:133,s))) + sum(sum(delI_SLB_NCA_COT(167:179,123:133,s))) + sum(sum(delI_SLB_NCA_COT(180:193,123:133,s))),
                    delI_SLB_LMO(14,s,1) == sum(sum(delI_SLB_LMO_COT(123:133,123:133,s))) + sum(sum(delI_SLB_LMO_COT(194:214,123:133,s))) + sum(sum(delI_SLB_LMO_COT(87:97,123:133,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(114:122,123:133,s))) + sum(sum(delI_SLB_LMO_COT(98:113,123:133,s))) + sum(sum(delI_SLB_LMO_COT(167:179,123:133,s))) + sum(sum(delI_SLB_LMO_COT(180:193,123:133,s))),
                    ];
%             elseif prv == 15 %%%%%%%%% Shandong
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(3,s)+SLB_LFP(10,s)+SLB_LFP(12,s)+SLB_LFP(16,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(3,s)+SLB_NCMH(10,s)+SLB_NCMH(12,s)+SLB_NCMH(16,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(3,s)+SLB_NCMM(10,s)+SLB_NCMM(12,s)+SLB_NCMM(16,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(3,s)+SLB_NCML(10,s)+SLB_NCML(12,s)+SLB_NCML(16,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(3,s)+SLB_NCA(10,s)+SLB_NCA(12,s)+SLB_NCA(16,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(3,s)+SLB_LMO(10,s)+SLB_LMO(12,s)+SLB_LMO(16,s),
                    delI_SLB_LFP(15,s,1) == sum(sum(delI_SLB_LFP_COT(134:149,134:149,s))) + sum(sum(delI_SLB_LFP_COT(3:13,134:149,s))) + sum(sum(delI_SLB_LFP_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(98:113,134:149,s))) + sum(sum(delI_SLB_LFP_COT(150:166,134:149,s))),
                    delI_SLB_NCMH(15,s,1) == sum(sum(delI_SLB_NCMH_COT(134:149,134:149,s))) + sum(sum(delI_SLB_NCMH_COT(3:13,134:149,s))) + sum(sum(delI_SLB_NCMH_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(98:113,134:149,s))) + sum(sum(delI_SLB_NCMH_COT(150:166,134:149,s))),
                    delI_SLB_NCMM(15,s,1) == sum(sum(delI_SLB_NCMM_COT(134:149,134:149,s))) + sum(sum(delI_SLB_NCMM_COT(3:13,134:149,s))) + sum(sum(delI_SLB_NCMM_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(98:113,134:149,s))) + sum(sum(delI_SLB_NCMM_COT(150:166,134:149,s))),
                    delI_SLB_NCML(15,s,1) == sum(sum(delI_SLB_NCML_COT(134:149,134:149,s))) + sum(sum(delI_SLB_NCML_COT(3:13,134:149,s))) + sum(sum(delI_SLB_NCML_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(98:113,134:149,s))) + sum(sum(delI_SLB_NCML_COT(150:166,134:149,s))),
                    delI_SLB_NCA(15,s,1) == sum(sum(delI_SLB_NCA_COT(134:149,134:149,s))) + sum(sum(delI_SLB_NCA_COT(3:13,134:149,s))) + sum(sum(delI_SLB_NCA_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_NCA_COT(98:113,134:149,s))) + sum(sum(delI_SLB_NCA_COT(150:166,134:149,s))),
                    delI_SLB_LMO(15,s,1) == sum(sum(delI_SLB_LMO_COT(134:149,134:149,s))) + sum(sum(delI_SLB_LMO_COT(3:13,134:149,s))) + sum(sum(delI_SLB_LMO_COT(74:86,134:149,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(98:113,134:149,s))) + sum(sum(delI_SLB_LMO_COT(150:166,134:149,s))),
                    ];
%             elseif prv == 16 %%%%%%%%% Henan
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(3,s)+SLB_LFP(4,s)+SLB_LFP(12,s)+SLB_LFP(15,s)+SLB_LFP(17,s)+SLB_LFP(27,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(3,s)+SLB_NCMH(4,s)+SLB_NCMH(12,s)+SLB_NCMH(15,s)+SLB_NCMH(17,s)+SLB_NCMH(27,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(3,s)+SLB_NCMM(4,s)+SLB_NCMM(12,s)+SLB_NCMM(15,s)+SLB_NCMM(17,s)+SLB_NCMM(27,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(3,s)+SLB_NCML(4,s)+SLB_NCML(12,s)+SLB_NCML(15,s)+SLB_NCML(17,s)+SLB_NCML(27,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(3,s)+SLB_NCA(4,s)+SLB_NCA(12,s)+SLB_NCA(15,s)+SLB_NCA(17,s)+SLB_NCA(27,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(3,s)+SLB_LMO(4,s)+SLB_LMO(12,s)+SLB_LMO(15,s)+SLB_LMO(17,s)+SLB_LMO(27,s),
                    delI_SLB_LFP(16,s,1) == sum(sum(delI_SLB_LFP_COT(150:166,150:166,s))) + sum(sum(delI_SLB_LFP_COT(3:13,150:166,s))) + sum(sum(delI_SLB_LFP_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_LFP_COT(98:113,150:166,s))) + sum(sum(delI_SLB_LFP_COT(134:149,150:166,s))) + sum(sum(delI_SLB_LFP_COT(167:179,150:166,s))) + sum(sum(delI_SLB_LFP_COT(287:296,150:166,s))),
                    delI_SLB_NCMH(16,s,1) == sum(sum(delI_SLB_NCMH_COT(150:166,150:166,s))) + sum(sum(delI_SLB_NCMH_COT(3:13,150:166,s))) + sum(sum(delI_SLB_NCMH_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_NCMH_COT(98:113,150:166,s))) + sum(sum(delI_SLB_NCMH_COT(134:149,150:166,s))) + sum(sum(delI_SLB_NCMH_COT(167:179,150:166,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,150:166,s))),
                    delI_SLB_NCMM(16,s,1) == sum(sum(delI_SLB_NCMM_COT(150:166,150:166,s))) + sum(sum(delI_SLB_NCMM_COT(3:13,150:166,s))) + sum(sum(delI_SLB_NCMM_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_NCMM_COT(98:113,150:166,s))) + sum(sum(delI_SLB_NCMM_COT(134:149,150:166,s))) + sum(sum(delI_SLB_NCMM_COT(167:179,150:166,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,150:166,s))),
                    delI_SLB_NCML(16,s,1) == sum(sum(delI_SLB_NCML_COT(150:166,150:166,s))) + sum(sum(delI_SLB_NCML_COT(3:13,150:166,s))) + sum(sum(delI_SLB_NCML_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_NCML_COT(98:113,150:166,s))) + sum(sum(delI_SLB_NCML_COT(134:149,150:166,s))) + sum(sum(delI_SLB_NCML_COT(167:179,150:166,s))) + sum(sum(delI_SLB_NCML_COT(287:296,150:166,s))),
                    delI_SLB_NCA(16,s,1) == sum(sum(delI_SLB_NCA_COT(150:166,150:166,s))) + sum(sum(delI_SLB_NCA_COT(3:13,150:166,s))) + sum(sum(delI_SLB_NCA_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_NCA_COT(98:113,150:166,s))) + sum(sum(delI_SLB_NCA_COT(134:149,150:166,s))) + sum(sum(delI_SLB_NCA_COT(167:179,150:166,s))) + sum(sum(delI_SLB_NCA_COT(287:296,150:166,s))),
                    delI_SLB_LMO(16,s,1) == sum(sum(delI_SLB_LMO_COT(150:166,150:166,s))) + sum(sum(delI_SLB_LMO_COT(3:13,150:166,s))) + sum(sum(delI_SLB_LMO_COT(14:24,150:166,s))) ...
                    + sum(sum(delI_SLB_LMO_COT(98:113,150:166,s))) + sum(sum(delI_SLB_LMO_COT(134:149,150:166,s))) + sum(sum(delI_SLB_LMO_COT(167:179,150:166,s))) + sum(sum(delI_SLB_LMO_COT(287:296,150:166,s))),
                    ];
%             elseif prv == 17 %%%%%%%%% Hubei
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(12,s)+SLB_LFP(14,s)+SLB_LFP(16,s)+SLB_LFP(18,s)+SLB_LFP(22,s)+SLB_LFP(27,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(12,s)+SLB_NCMH(14,s)+SLB_NCMH(16,s)+SLB_NCMH(18,s)+SLB_NCMH(22,s)+SLB_NCMH(27,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(12,s)+SLB_NCMM(14,s)+SLB_NCMM(16,s)+SLB_NCMM(18,s)+SLB_NCMM(22,s)+SLB_NCMM(27,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(12,s)+SLB_NCML(14,s)+SLB_NCML(16,s)+SLB_NCML(18,s)+SLB_NCML(22,s)+SLB_NCML(27,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(12,s)+SLB_NCA(14,s)+SLB_NCA(16,s)+SLB_NCA(18,s)+SLB_NCA(22,s)+SLB_NCA(27,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(12,s)+SLB_LMO(14,s)+SLB_LMO(16,s)+SLB_LMO(18,s)+SLB_LMO(22,s)+SLB_LMO(27,s),
                    delI_SLB_LFP(17,s,1) == sum(sum(delI_SLB_LFP_COT(167:179,167:179,s))) + sum(sum(delI_SLB_LFP_COT(98:113,167:179,s))) + sum(sum(delI_SLB_LFP_COT(123:133,167:179,s))) + sum(sum(delI_SLB_LFP_COT(150:166,167:179,s))) + sum(sum(delI_SLB_LFP_COT(180:193,167:179,s))) + sum(delI_SLB_LFP_COT(233,167:179,s)) + sum(sum(delI_SLB_LFP_COT(287:296,167:179,s))),
                    delI_SLB_NCMH(17,s,1) == sum(sum(delI_SLB_NCMH_COT(167:179,167:179,s))) + sum(sum(delI_SLB_NCMH_COT(98:113,167:179,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,167:179,s))) + sum(sum(delI_SLB_NCMH_COT(150:166,167:179,s))) + sum(sum(delI_SLB_NCMH_COT(180:193,167:179,s))) + sum(delI_SLB_NCMH_COT(233,167:179,s)) + sum(sum(delI_SLB_NCMH_COT(287:296,167:179,s))),   
                    delI_SLB_NCMM(17,s,1) == sum(sum(delI_SLB_NCMM_COT(167:179,167:179,s))) + sum(sum(delI_SLB_NCMM_COT(98:113,167:179,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,167:179,s))) + sum(sum(delI_SLB_NCMM_COT(150:166,167:179,s))) + sum(sum(delI_SLB_NCMM_COT(180:193,167:179,s))) + sum(delI_SLB_NCMM_COT(233,167:179,s)) + sum(sum(delI_SLB_NCMM_COT(287:296,167:179,s))),
                    delI_SLB_NCML(17,s,1) == sum(sum(delI_SLB_NCML_COT(167:179,167:179,s))) + sum(sum(delI_SLB_NCML_COT(98:113,167:179,s))) + sum(sum(delI_SLB_NCML_COT(123:133,167:179,s))) + sum(sum(delI_SLB_NCML_COT(150:166,167:179,s))) + sum(sum(delI_SLB_NCML_COT(180:193,167:179,s))) + sum(delI_SLB_NCML_COT(233,167:179,s)) + sum(sum(delI_SLB_NCML_COT(287:296,167:179,s))),                    
                    delI_SLB_NCA(17,s,1) == sum(sum(delI_SLB_NCA_COT(167:179,167:179,s))) + sum(sum(delI_SLB_NCA_COT(98:113,167:179,s))) + sum(sum(delI_SLB_NCA_COT(123:133,167:179,s))) + sum(sum(delI_SLB_NCA_COT(150:166,167:179,s))) + sum(sum(delI_SLB_NCA_COT(180:193,167:179,s))) + sum(delI_SLB_NCA_COT(233,167:179,s)) + sum(sum(delI_SLB_NCA_COT(287:296,167:179,s))),
                    delI_SLB_LMO(17,s,1) == sum(sum(delI_SLB_LMO_COT(167:179,167:179,s))) + sum(sum(delI_SLB_LMO_COT(98:113,167:179,s))) + sum(sum(delI_SLB_LMO_COT(123:133,167:179,s))) + sum(sum(delI_SLB_LMO_COT(150:166,167:179,s))) + sum(sum(delI_SLB_LMO_COT(180:193,167:179,s))) + sum(delI_SLB_LMO_COT(233,167:179,s)) + sum(sum(delI_SLB_LMO_COT(287:296,167:179,s))),
                    ];
%             elseif prv == 18 %%%%%%%%% Hunan
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(14,s)+SLB_LFP(17,s)+SLB_LFP(19,s)+SLB_LFP(20,s)+SLB_LFP(22,s)+SLB_LFP(24,s),
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(14,s)+SLB_NCMH(17,s)+SLB_NCMH(19,s)+SLB_NCMH(20,s)+SLB_NCMH(22,s)+SLB_NCMH(24,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(14,s)+SLB_NCMM(17,s)+SLB_NCMM(19,s)+SLB_NCMM(20,s)+SLB_NCMM(22,s)+SLB_NCMM(24,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(14,s)+SLB_NCML(17,s)+SLB_NCML(19,s)+SLB_NCML(20,s)+SLB_NCML(22,s)+SLB_NCML(24,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(14,s)+SLB_NCA(17,s)+SLB_NCA(19,s)+SLB_NCA(20,s)+SLB_NCA(22,s)+SLB_NCA(24,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(14,s)+SLB_LMO(17,s)+SLB_LMO(19,s)+SLB_LMO(20,s)+SLB_LMO(22,s)+SLB_LMO(24,s),
                    delI_SLB_LFP(18,s,1) == sum(sum(delI_SLB_LFP_COT(180:193,180:193,s))) + sum(sum(delI_SLB_LFP_COT(123:133,180:193,s))) + sum(sum(delI_SLB_LFP_COT(167:179,180:193,s))) + sum(sum(delI_SLB_LFP_COT(194:214,180:193,s))) + sum(sum(delI_SLB_LFP_COT(215:228,180:193,s))) + sum(delI_SLB_LFP_COT(233,180:193,s)) + sum(sum(delI_SLB_LFP_COT(255:263,180:193,s))),
                    delI_SLB_NCMH(18,s,1) == sum(sum(delI_SLB_NCMH_COT(180:193,180:193,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,180:193,s))) + sum(sum(delI_SLB_NCMH_COT(167:179,180:193,s))) + sum(sum(delI_SLB_NCMH_COT(194:214,180:193,s))) + sum(sum(delI_SLB_NCMH_COT(215:228,180:193,s))) + sum(delI_SLB_NCMH_COT(233,180:193,s)) + sum(sum(delI_SLB_NCMH_COT(255:263,180:193,s))),                    
                    delI_SLB_NCMM(18,s,1) == sum(sum(delI_SLB_NCMM_COT(180:193,180:193,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,180:193,s))) + sum(sum(delI_SLB_NCMM_COT(167:179,180:193,s))) + sum(sum(delI_SLB_NCMM_COT(194:214,180:193,s))) + sum(sum(delI_SLB_NCMM_COT(215:228,180:193,s))) + sum(delI_SLB_NCMM_COT(233,180:193,s)) + sum(sum(delI_SLB_NCMM_COT(255:263,180:193,s))),
                    delI_SLB_NCML(18,s,1) == sum(sum(delI_SLB_NCML_COT(180:193,180:193,s))) + sum(sum(delI_SLB_NCML_COT(123:133,180:193,s))) + sum(sum(delI_SLB_NCML_COT(167:179,180:193,s))) + sum(sum(delI_SLB_NCML_COT(194:214,180:193,s))) + sum(sum(delI_SLB_NCML_COT(215:228,180:193,s))) + sum(delI_SLB_NCML_COT(233,180:193,s)) + sum(sum(delI_SLB_NCML_COT(255:263,180:193,s))),
                    delI_SLB_NCA(18,s,1) == sum(sum(delI_SLB_NCA_COT(180:193,180:193,s))) + sum(sum(delI_SLB_NCA_COT(123:133,180:193,s))) + sum(sum(delI_SLB_NCA_COT(167:179,180:193,s))) + sum(sum(delI_SLB_NCA_COT(194:214,180:193,s))) + sum(sum(delI_SLB_NCA_COT(215:228,180:193,s))) + sum(delI_SLB_NCA_COT(233,180:193,s)) + sum(sum(delI_SLB_NCA_COT(255:263,180:193,s))),
                    delI_SLB_LMO(18,s,1) == sum(sum(delI_SLB_LMO_COT(180:193,180:193,s))) + sum(sum(delI_SLB_LMO_COT(123:133,180:193,s))) + sum(sum(delI_SLB_LMO_COT(167:179,180:193,s))) + sum(sum(delI_SLB_LMO_COT(194:214,180:193,s))) + sum(sum(delI_SLB_LMO_COT(215:228,180:193,s))) + sum(delI_SLB_LMO_COT(233,180:193,s)) + sum(sum(delI_SLB_LMO_COT(255:263,180:193,s))),
                    ];
%             elseif prv == 19 %%%%%%%%% Guangdong
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(13,s)+SLB_LFP(14,s)+SLB_LFP(18,s)+SLB_LFP(20,s)+SLB_LFP(21,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(13,s)+SLB_NCMH(14,s)+SLB_NCMH(18,s)+SLB_NCMH(20,s)+SLB_NCMH(21,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(13,s)+SLB_NCMM(14,s)+SLB_NCMM(18,s)+SLB_NCMM(20,s)+SLB_NCMM(21,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(13,s)+SLB_NCML(14,s)+SLB_NCML(18,s)+SLB_NCML(20,s)+SLB_NCML(21,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(13,s)+SLB_NCA(14,s)+SLB_NCA(18,s)+SLB_NCA(20,s)+SLB_NCA(21,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(13,s)+SLB_LMO(14,s)+SLB_LMO(18,s)+SLB_LMO(20,s)+SLB_LMO(21,s),
                    delI_SLB_LFP(19,s,1) == sum(sum(delI_SLB_LFP_COT(194:214,194:214,s))) + sum(sum(delI_SLB_LFP_COT(114:122,194:214,s))) + sum(sum(delI_SLB_LFP_COT(123:133,194:214,s))) + sum(sum(delI_SLB_LFP_COT(180:193,194:214,s))) + sum(sum(delI_SLB_LFP_COT(215:228,194:214,s))) + sum(sum(delI_SLB_LFP_COT(229:232,194:214,s))), 
                    delI_SLB_NCMH(19,s,1) == sum(sum(delI_SLB_NCMH_COT(194:214,194:214,s))) + sum(sum(delI_SLB_NCMH_COT(114:122,194:214,s))) + sum(sum(delI_SLB_NCMH_COT(123:133,194:214,s))) + sum(sum(delI_SLB_NCMH_COT(180:193,194:214,s))) + sum(sum(delI_SLB_NCMH_COT(215:228,194:214,s))) + sum(sum(delI_SLB_NCMH_COT(229:232,194:214,s))), 
                    delI_SLB_NCMM(19,s,1) == sum(sum(delI_SLB_NCMM_COT(194:214,194:214,s))) + sum(sum(delI_SLB_NCMM_COT(114:122,194:214,s))) + sum(sum(delI_SLB_NCMM_COT(123:133,194:214,s))) + sum(sum(delI_SLB_NCMM_COT(180:193,194:214,s))) + sum(sum(delI_SLB_NCMM_COT(215:228,194:214,s))) + sum(sum(delI_SLB_NCMM_COT(229:232,194:214,s))), 
                    delI_SLB_NCML(19,s,1) == sum(sum(delI_SLB_NCML_COT(194:214,194:214,s))) + sum(sum(delI_SLB_NCML_COT(114:122,194:214,s))) + sum(sum(delI_SLB_NCML_COT(123:133,194:214,s))) + sum(sum(delI_SLB_NCML_COT(180:193,194:214,s))) + sum(sum(delI_SLB_NCML_COT(215:228,194:214,s))) + sum(sum(delI_SLB_NCML_COT(229:232,194:214,s))), 
                    delI_SLB_NCA(19,s,1) == sum(sum(delI_SLB_NCA_COT(194:214,194:214,s))) + sum(sum(delI_SLB_NCA_COT(114:122,194:214,s))) + sum(sum(delI_SLB_NCA_COT(123:133,194:214,s))) + sum(sum(delI_SLB_NCA_COT(180:193,194:214,s))) + sum(sum(delI_SLB_NCA_COT(215:228,194:214,s))) + sum(sum(delI_SLB_NCA_COT(229:232,194:214,s))), 
                    delI_SLB_LMO(19,s,1) == sum(sum(delI_SLB_LMO_COT(194:214,194:214,s))) + sum(sum(delI_SLB_LMO_COT(114:122,194:214,s))) + sum(sum(delI_SLB_LMO_COT(123:133,194:214,s))) + sum(sum(delI_SLB_LMO_COT(180:193,194:214,s))) + sum(sum(delI_SLB_LMO_COT(215:228,194:214,s))) + sum(sum(delI_SLB_LMO_COT(229:232,194:214,s))), 
                    ];
%             elseif prv == 20 %%%%%%%%% Guangxi
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(18,s)+SLB_LFP(19,s)+SLB_LFP(24,s)+SLB_LFP(25,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(18,s)+SLB_NCMH(19,s)+SLB_NCMH(24,s)+SLB_NCMH(25,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(18,s)+SLB_NCMM(19,s)+SLB_NCMM(24,s)+SLB_NCMM(25,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(18,s)+SLB_NCML(19,s)+SLB_NCML(24,s)+SLB_NCML(25,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(18,s)+SLB_NCA(19,s)+SLB_NCA(24,s)+SLB_NCA(25,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(18,s)+SLB_LMO(19,s)+SLB_LMO(24,s)+SLB_LMO(25,s),
                    delI_SLB_LFP(20,s,1) == sum(sum(delI_SLB_LFP_COT(215:228,215:228,s))) + sum(sum(delI_SLB_LFP_COT(180:193,215:228,s))) + sum(sum(delI_SLB_LFP_COT(194:214,215:228,s))) + sum(sum(delI_SLB_LFP_COT(255:263,215:228,s))) + sum(sum(delI_SLB_LFP_COT(264:279,215:228,s))), 
                    delI_SLB_NCMH(20,s,1) == sum(sum(delI_SLB_NCMH_COT(215:228,215:228,s))) + sum(sum(delI_SLB_NCMH_COT(180:193,215:228,s))) + sum(sum(delI_SLB_NCMH_COT(194:214,215:228,s))) + sum(sum(delI_SLB_NCMH_COT(255:263,215:228,s))) + sum(sum(delI_SLB_NCMH_COT(264:279,215:228,s))),                     
                    delI_SLB_NCMM(20,s,1) == sum(sum(delI_SLB_NCMM_COT(215:228,215:228,s))) + sum(sum(delI_SLB_NCMM_COT(180:193,215:228,s))) + sum(sum(delI_SLB_NCMM_COT(194:214,215:228,s))) + sum(sum(delI_SLB_NCMM_COT(255:263,215:228,s))) + sum(sum(delI_SLB_NCMM_COT(264:279,215:228,s))), 
                    delI_SLB_NCML(20,s,1) == sum(sum(delI_SLB_NCML_COT(215:228,215:228,s))) + sum(sum(delI_SLB_NCML_COT(180:193,215:228,s))) + sum(sum(delI_SLB_NCML_COT(194:214,215:228,s))) + sum(sum(delI_SLB_NCML_COT(255:263,215:228,s))) + sum(sum(delI_SLB_NCML_COT(264:279,215:228,s))), 
                    delI_SLB_NCA(20,s,1) == sum(sum(delI_SLB_NCA_COT(215:228,215:228,s))) + sum(sum(delI_SLB_NCA_COT(180:193,215:228,s))) + sum(sum(delI_SLB_NCA_COT(194:214,215:228,s))) + sum(sum(delI_SLB_NCA_COT(255:263,215:228,s))) + sum(sum(delI_SLB_NCA_COT(264:279,215:228,s))), 
                    delI_SLB_LMO(20,s,1) == sum(sum(delI_SLB_LMO_COT(215:228,215:228,s))) + sum(sum(delI_SLB_LMO_COT(180:193,215:228,s))) + sum(sum(delI_SLB_LMO_COT(194:214,215:228,s))) + sum(sum(delI_SLB_LMO_COT(255:263,215:228,s))) + sum(sum(delI_SLB_LMO_COT(264:279,215:228,s))), 
                    ];
%             elseif prv == 21 %%%%%%%%% Hainan
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(19,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(19,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(19,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(19,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(19,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(19,s),
                    delI_SLB_LFP(21,s,1) == sum(sum(delI_SLB_LFP_COT(229:232,229:232,s))) + sum(sum(delI_SLB_LFP_COT(194:214,229:232,s))), 
                    delI_SLB_NCMH(21,s,1) == sum(sum(delI_SLB_NCMH_COT(229:232,229:232,s))) + sum(sum(delI_SLB_NCMH_COT(194:214,229:232,s))), 
                    delI_SLB_NCMM(21,s,1) == sum(sum(delI_SLB_NCMM_COT(229:232,229:232,s))) + sum(sum(delI_SLB_NCMM_COT(194:214,229:232,s))), 
                    delI_SLB_NCML(21,s,1) == sum(sum(delI_SLB_NCML_COT(229:232,229:232,s))) + sum(sum(delI_SLB_NCML_COT(194:214,229:232,s))), 
                    delI_SLB_NCA(21,s,1) == sum(sum(delI_SLB_NCA_COT(229:232,229:232,s))) + sum(sum(delI_SLB_NCA_COT(194:214,229:232,s))), 
                    delI_SLB_LMO(21,s,1) == sum(sum(delI_SLB_LMO_COT(229:232,229:232,s))) + sum(sum(delI_SLB_LMO_COT(194:214,229:232,s))), 
                    ];
%             elseif prv == 22 %%%%%%%%% Chongqing
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(17,s)+SLB_LFP(18,s)+SLB_LFP(23,s)+SLB_LFP(24,s)+SLB_LFP(27,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(17,s)+SLB_NCMH(18,s)+SLB_NCMH(23,s)+SLB_NCMH(24,s)+SLB_NCMH(27,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(17,s)+SLB_NCMM(18,s)+SLB_NCMM(23,s)+SLB_NCMM(24,s)+SLB_NCMM(27,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(17,s)+SLB_NCML(18,s)+SLB_NCML(23,s)+SLB_NCML(24,s)+SLB_NCML(27,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(17,s)+SLB_NCA(18,s)+SLB_NCA(23,s)+SLB_NCA(24,s)+SLB_NCA(27,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(17,s)+SLB_LMO(18,s)+SLB_LMO(23,s)+SLB_LMO(24,s)+SLB_LMO(27,s),
                    delI_SLB_LFP(22,s,1) == delI_SLB_LFP_COT(233,233,s) + sum(delI_SLB_LFP_COT(167:179,233,s)) + sum(delI_SLB_LFP_COT(180:193,233,s)) + sum(delI_SLB_LFP_COT(234:254,233,s)) + sum(delI_SLB_LFP_COT(255:263,233,s)) + sum(delI_SLB_LFP_COT(287:296,233,s)), 
                    delI_SLB_NCMH(22,s,1) == delI_SLB_NCMH_COT(233,233,s) + sum(delI_SLB_NCMH_COT(167:179,233,s)) + sum(delI_SLB_NCMH_COT(180:193,233,s)) + sum(delI_SLB_NCMH_COT(234:254,233,s)) + sum(delI_SLB_NCMH_COT(255:263,233,s)) + sum(delI_SLB_NCMH_COT(287:296,233,s)), 
                    delI_SLB_NCMM(22,s,1) == delI_SLB_NCMM_COT(233,233,s) + sum(delI_SLB_NCMM_COT(167:179,233,s)) + sum(delI_SLB_NCMM_COT(180:193,233,s)) + sum(delI_SLB_NCMM_COT(234:254,233,s)) + sum(delI_SLB_NCMM_COT(255:263,233,s)) + sum(delI_SLB_NCMM_COT(287:296,233,s)), 
                    delI_SLB_NCML(22,s,1) == delI_SLB_NCML_COT(233,233,s) + sum(delI_SLB_NCML_COT(167:179,233,s)) + sum(delI_SLB_NCML_COT(180:193,233,s)) + sum(delI_SLB_NCML_COT(234:254,233,s)) + sum(delI_SLB_NCML_COT(255:263,233,s)) + sum(delI_SLB_NCML_COT(287:296,233,s)), 
                    delI_SLB_NCA(22,s,1) == delI_SLB_NCA_COT(233,233,s) + sum(delI_SLB_NCA_COT(167:179,233,s)) + sum(delI_SLB_NCA_COT(180:193,233,s)) + sum(delI_SLB_NCA_COT(234:254,233,s)) + sum(delI_SLB_NCA_COT(255:263,233,s)) + sum(delI_SLB_NCA_COT(287:296,233,s)), 
                    delI_SLB_LMO(22,s,1) == delI_SLB_LMO_COT(233,233,s) + sum(delI_SLB_LMO_COT(167:179,233,s)) + sum(delI_SLB_LMO_COT(180:193,233,s)) + sum(delI_SLB_LMO_COT(234:254,233,s)) + sum(delI_SLB_LMO_COT(255:263,233,s)) + sum(delI_SLB_LMO_COT(287:296,233,s)), 
                    ];
%             elseif prv == 23 %%%%%%%%% Sichuan
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(22,s)+SLB_LFP(24,s)+SLB_LFP(25,s)+SLB_LFP(26,s)+SLB_LFP(27,s)+SLB_LFP(28,s)+SLB_LFP(29,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(22,s)+SLB_NCMH(24,s)+SLB_NCMH(25,s)+SLB_NCMH(26,s)+SLB_NCMH(27,s)+SLB_NCMH(28,s)+SLB_NCMH(29,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(22,s)+SLB_NCMM(24,s)+SLB_NCMM(25,s)+SLB_NCMM(26,s)+SLB_NCMM(27,s)+SLB_NCMM(28,s)+SLB_NCMM(29,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(22,s)+SLB_NCML(24,s)+SLB_NCML(25,s)+SLB_NCML(26,s)+SLB_NCML(27,s)+SLB_NCML(28,s)+SLB_NCML(29,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(22,s)+SLB_NCA(24,s)+SLB_NCA(25,s)+SLB_NCA(26,s)+SLB_NCA(27,s)+SLB_NCA(28,s)+SLB_NCA(29,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(22,s)+SLB_LMO(24,s)+SLB_LMO(25,s)+SLB_LMO(26,s)+SLB_LMO(27,s)+SLB_LMO(28,s)+SLB_LMO(29,s),
                    delI_SLB_LFP(23,s,1) == sum(sum(delI_SLB_LFP_COT(234:254,234:254,s))) + sum(delI_SLB_LFP_COT(233,234:254,s)) + sum(sum(delI_SLB_LFP_COT(255:263,234:254,s))) + sum(sum(delI_SLB_LFP_COT(264:279,234:254,s))) + sum(sum(delI_SLB_LFP_COT(280:286,234:254,s))) + sum(sum(delI_SLB_LFP_COT(287:296,234:254,s))) + sum(sum(delI_SLB_LFP_COT(297:310,234:254,s))) + sum(sum(delI_SLB_LFP_COT(311:318,234:254,s))), 
                    delI_SLB_NCMH(23,s,1) == sum(sum(delI_SLB_NCMH_COT(234:254,234:254,s))) + sum(delI_SLB_NCMH_COT(233,234:254,s)) + sum(sum(delI_SLB_NCMH_COT(255:263,234:254,s))) + sum(sum(delI_SLB_NCMH_COT(264:279,234:254,s))) + sum(sum(delI_SLB_NCMH_COT(280:286,234:254,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,234:254,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,234:254,s))) + sum(sum(delI_SLB_NCMH_COT(311:318,234:254,s))), 
                    delI_SLB_NCMM(23,s,1) == sum(sum(delI_SLB_NCMM_COT(234:254,234:254,s))) + sum(delI_SLB_NCMM_COT(233,234:254,s)) + sum(sum(delI_SLB_NCMM_COT(255:263,234:254,s))) + sum(sum(delI_SLB_NCMM_COT(264:279,234:254,s))) + sum(sum(delI_SLB_NCMM_COT(280:286,234:254,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,234:254,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,234:254,s))) + sum(sum(delI_SLB_NCMM_COT(311:318,234:254,s))), 
                    delI_SLB_NCML(23,s,1) == sum(sum(delI_SLB_NCML_COT(234:254,234:254,s))) + sum(delI_SLB_NCML_COT(233,234:254,s)) + sum(sum(delI_SLB_NCML_COT(255:263,234:254,s))) + sum(sum(delI_SLB_NCML_COT(264:279,234:254,s))) + sum(sum(delI_SLB_NCML_COT(280:286,234:254,s))) + sum(sum(delI_SLB_NCML_COT(287:296,234:254,s))) + sum(sum(delI_SLB_NCML_COT(297:310,234:254,s))) + sum(sum(delI_SLB_NCML_COT(311:318,234:254,s))), 
                    delI_SLB_NCA(23,s,1) == sum(sum(delI_SLB_NCA_COT(234:254,234:254,s))) + sum(delI_SLB_NCA_COT(233,234:254,s)) + sum(sum(delI_SLB_NCA_COT(255:263,234:254,s))) + sum(sum(delI_SLB_NCA_COT(264:279,234:254,s))) + sum(sum(delI_SLB_NCA_COT(280:286,234:254,s))) + sum(sum(delI_SLB_NCA_COT(287:296,234:254,s))) + sum(sum(delI_SLB_NCA_COT(297:310,234:254,s))) + sum(sum(delI_SLB_NCA_COT(311:318,234:254,s))), 
                    delI_SLB_LMO(23,s,1) == sum(sum(delI_SLB_LMO_COT(234:254,234:254,s))) + sum(delI_SLB_LMO_COT(233,234:254,s)) + sum(sum(delI_SLB_LMO_COT(255:263,234:254,s))) + sum(sum(delI_SLB_LMO_COT(264:279,234:254,s))) + sum(sum(delI_SLB_LMO_COT(280:286,234:254,s))) + sum(sum(delI_SLB_LMO_COT(287:296,234:254,s))) + sum(sum(delI_SLB_LMO_COT(297:310,234:254,s))) + sum(sum(delI_SLB_LMO_COT(311:318,234:254,s))), 
                    ];
%             elseif prv == 24 %%%%%%%%% Guizhou
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(18,s)+SLB_LFP(20,s)+SLB_LFP(22,s)+SLB_LFP(23,s)+SLB_LFP(25,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(18,s)+SLB_NCMH(20,s)+SLB_NCMH(22,s)+SLB_NCMH(23,s)+SLB_NCMH(25,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(18,s)+SLB_NCMM(20,s)+SLB_NCMM(22,s)+SLB_NCMM(23,s)+SLB_NCMM(25,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(18,s)+SLB_NCML(20,s)+SLB_NCML(22,s)+SLB_NCML(23,s)+SLB_NCML(25,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(18,s)+SLB_NCA(20,s)+SLB_NCA(22,s)+SLB_NCA(23,s)+SLB_NCA(25,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(18,s)+SLB_LMO(20,s)+SLB_LMO(22,s)+SLB_LMO(23,s)+SLB_LMO(25,s),
                    delI_SLB_LFP(24,s,1) == sum(sum(delI_SLB_LFP_COT(255:263,255:263,s))) + sum(sum(delI_SLB_LFP_COT(180:193,255:263,s))) + sum(sum(delI_SLB_LFP_COT(215:228,255:263,s))) + sum(delI_SLB_LFP_COT(233,255:263,s)) + sum(sum(delI_SLB_LFP_COT(234:254,255:263,s))) + sum(sum(delI_SLB_LFP_COT(264:279,255:263,s))), 
                    delI_SLB_NCMH(24,s,1) == sum(sum(delI_SLB_NCMH_COT(255:263,255:263,s))) + sum(sum(delI_SLB_NCMH_COT(180:193,255:263,s))) + sum(sum(delI_SLB_NCMH_COT(215:228,255:263,s))) + sum(delI_SLB_NCMH_COT(233,255:263,s)) + sum(sum(delI_SLB_NCMH_COT(234:254,255:263,s))) + sum(sum(delI_SLB_NCMH_COT(264:279,255:263,s))), 
                    delI_SLB_NCMM(24,s,1) == sum(sum(delI_SLB_NCMM_COT(255:263,255:263,s))) + sum(sum(delI_SLB_NCMM_COT(180:193,255:263,s))) + sum(sum(delI_SLB_NCMM_COT(215:228,255:263,s))) + sum(delI_SLB_NCMM_COT(233,255:263,s)) + sum(sum(delI_SLB_NCMM_COT(234:254,255:263,s))) + sum(sum(delI_SLB_NCMM_COT(264:279,255:263,s))), 
                    delI_SLB_NCML(24,s,1) == sum(sum(delI_SLB_NCML_COT(255:263,255:263,s))) + sum(sum(delI_SLB_NCML_COT(180:193,255:263,s))) + sum(sum(delI_SLB_NCML_COT(215:228,255:263,s))) + sum(delI_SLB_NCML_COT(233,255:263,s)) + sum(sum(delI_SLB_NCML_COT(234:254,255:263,s))) + sum(sum(delI_SLB_NCML_COT(264:279,255:263,s))), 
                    delI_SLB_NCA(24,s,1) == sum(sum(delI_SLB_NCA_COT(255:263,255:263,s))) + sum(sum(delI_SLB_NCA_COT(180:193,255:263,s))) + sum(sum(delI_SLB_NCA_COT(215:228,255:263,s))) + sum(delI_SLB_NCA_COT(233,255:263,s)) + sum(sum(delI_SLB_NCA_COT(234:254,255:263,s))) + sum(sum(delI_SLB_NCA_COT(264:279,255:263,s))), 
                    delI_SLB_LMO(24,s,1) == sum(sum(delI_SLB_LMO_COT(255:263,255:263,s))) + sum(sum(delI_SLB_LMO_COT(180:193,255:263,s))) + sum(sum(delI_SLB_LMO_COT(215:228,255:263,s))) + sum(delI_SLB_LMO_COT(233,255:263,s)) + sum(sum(delI_SLB_LMO_COT(234:254,255:263,s))) + sum(sum(delI_SLB_LMO_COT(264:279,255:263,s))), 
                    ];
%             elseif prv == 25 %%%%%%%%% Yunnan
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(20,s)+SLB_LFP(23,s)+SLB_LFP(24,s)+SLB_LFP(26,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(20,s)+SLB_NCMH(23,s)+SLB_NCMH(24,s)+SLB_NCMH(26,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(20,s)+SLB_NCMM(23,s)+SLB_NCMM(24,s)+SLB_NCMM(26,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(20,s)+SLB_NCML(23,s)+SLB_NCML(24,s)+SLB_NCML(26,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(20,s)+SLB_NCA(23,s)+SLB_NCA(24,s)+SLB_NCA(26,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(20,s)+SLB_LMO(23,s)+SLB_LMO(24,s)+SLB_LMO(26,s),
                    delI_SLB_LFP(25,s,1) == sum(sum(delI_SLB_LFP_COT(264:279,264:279,s))) + sum(sum(delI_SLB_LFP_COT(215:228,264:279,s))) + sum(sum(delI_SLB_LFP_COT(234:254,264:279,s))) + sum(sum(delI_SLB_LFP_COT(255:263,264:279,s))) + sum(sum(delI_SLB_LFP_COT(280:286,264:279,s))), 
                    delI_SLB_NCMH(25,s,1) == sum(sum(delI_SLB_NCMH_COT(264:279,264:279,s))) + sum(sum(delI_SLB_NCMH_COT(215:228,264:279,s))) + sum(sum(delI_SLB_NCMH_COT(234:254,264:279,s))) + sum(sum(delI_SLB_NCMH_COT(255:263,264:279,s))) + sum(sum(delI_SLB_NCMH_COT(280:286,264:279,s))), 
                    delI_SLB_NCMM(25,s,1) == sum(sum(delI_SLB_NCMM_COT(264:279,264:279,s))) + sum(sum(delI_SLB_NCMM_COT(215:228,264:279,s))) + sum(sum(delI_SLB_NCMM_COT(234:254,264:279,s))) + sum(sum(delI_SLB_NCMM_COT(255:263,264:279,s))) + sum(sum(delI_SLB_NCMM_COT(280:286,264:279,s))), 
                    delI_SLB_NCML(25,s,1) == sum(sum(delI_SLB_NCML_COT(264:279,264:279,s))) + sum(sum(delI_SLB_NCML_COT(215:228,264:279,s))) + sum(sum(delI_SLB_NCML_COT(234:254,264:279,s))) + sum(sum(delI_SLB_NCML_COT(255:263,264:279,s))) + sum(sum(delI_SLB_NCML_COT(280:286,264:279,s))), 
                    delI_SLB_NCA(25,s,1) == sum(sum(delI_SLB_NCA_COT(264:279,264:279,s))) + sum(sum(delI_SLB_NCA_COT(215:228,264:279,s))) + sum(sum(delI_SLB_NCA_COT(234:254,264:279,s))) + sum(sum(delI_SLB_NCA_COT(255:263,264:279,s))) + sum(sum(delI_SLB_NCA_COT(280:286,264:279,s))), 
                    delI_SLB_LMO(25,s,1) == sum(sum(delI_SLB_LMO_COT(264:279,264:279,s))) + sum(sum(delI_SLB_LMO_COT(215:228,264:279,s))) + sum(sum(delI_SLB_LMO_COT(234:254,264:279,s))) + sum(sum(delI_SLB_LMO_COT(255:263,264:279,s))) + sum(sum(delI_SLB_LMO_COT(280:286,264:279,s))), 
                    ];
%             elseif prv == 26 %%%%%%%%% Xizang
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(23,s)+SLB_LFP(25,s)+SLB_LFP(29,s)+SLB_LFP(31,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(23,s)+SLB_NCMH(25,s)+SLB_NCMH(29,s)+SLB_NCMH(31,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(23,s)+SLB_NCMM(25,s)+SLB_NCMM(29,s)+SLB_NCMM(31,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(23,s)+SLB_NCML(25,s)+SLB_NCML(29,s)+SLB_NCML(31,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(23,s)+SLB_NCA(25,s)+SLB_NCA(29,s)+SLB_NCA(31,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(23,s)+SLB_LMO(25,s)+SLB_LMO(29,s)+SLB_LMO(31,s),
                    delI_SLB_LFP(26,s,1) == sum(sum(delI_SLB_LFP_COT(280:286,280:286,s))) + sum(sum(delI_SLB_LFP_COT(234:254,280:286,s))) + sum(sum(delI_SLB_LFP_COT(264:279,280:286,s))) + sum(sum(delI_SLB_LFP_COT(311:318,280:286,s))) + sum(sum(delI_SLB_LFP_COT(324:337,280:286,s))), 
                    delI_SLB_NCMH(26,s,1) == sum(sum(delI_SLB_NCMH_COT(280:286,280:286,s))) + sum(sum(delI_SLB_NCMH_COT(234:254,280:286,s))) + sum(sum(delI_SLB_NCMH_COT(264:279,280:286,s))) + sum(sum(delI_SLB_NCMH_COT(311:318,280:286,s))) + sum(sum(delI_SLB_NCMH_COT(324:337,280:286,s))), 
                    delI_SLB_NCMM(26,s,1) == sum(sum(delI_SLB_NCMM_COT(280:286,280:286,s))) + sum(sum(delI_SLB_NCMM_COT(234:254,280:286,s))) + sum(sum(delI_SLB_NCMM_COT(264:279,280:286,s))) + sum(sum(delI_SLB_NCMM_COT(311:318,280:286,s))) + sum(sum(delI_SLB_NCMM_COT(324:337,280:286,s))), 
                    delI_SLB_NCML(26,s,1) == sum(sum(delI_SLB_NCML_COT(280:286,280:286,s))) + sum(sum(delI_SLB_NCML_COT(234:254,280:286,s))) + sum(sum(delI_SLB_NCML_COT(264:279,280:286,s))) + sum(sum(delI_SLB_NCML_COT(311:318,280:286,s))) + sum(sum(delI_SLB_NCML_COT(324:337,280:286,s))), 
                    delI_SLB_NCA(26,s,1) == sum(sum(delI_SLB_NCA_COT(280:286,280:286,s))) + sum(sum(delI_SLB_NCA_COT(234:254,280:286,s))) + sum(sum(delI_SLB_NCA_COT(264:279,280:286,s))) + sum(sum(delI_SLB_NCA_COT(311:318,280:286,s))) + sum(sum(delI_SLB_NCA_COT(324:337,280:286,s))), 
                    delI_SLB_LMO(26,s,1) == sum(sum(delI_SLB_LMO_COT(280:286,280:286,s))) + sum(sum(delI_SLB_LMO_COT(234:254,280:286,s))) + sum(sum(delI_SLB_LMO_COT(264:279,280:286,s))) + sum(sum(delI_SLB_LMO_COT(311:318,280:286,s))) + sum(sum(delI_SLB_LMO_COT(324:337,280:286,s))), 
                    ];
%             elseif prv == 27 %%%%%%%%% Shaanxi
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(4,s)+SLB_LFP(5,s)+SLB_LFP(16,s)+SLB_LFP(17,s)+SLB_LFP(22,s)+SLB_LFP(23,s)+SLB_LFP(28,s)+SLB_LFP(30,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(4,s)+SLB_NCMH(5,s)+SLB_NCMH(16,s)+SLB_NCMH(17,s)+SLB_NCMH(22,s)+SLB_NCMH(23,s)+SLB_NCMH(28,s)+SLB_NCMH(30,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(4,s)+SLB_NCMM(5,s)+SLB_NCMM(16,s)+SLB_NCMM(17,s)+SLB_NCMM(22,s)+SLB_NCMM(23,s)+SLB_NCMM(28,s)+SLB_NCMM(30,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(4,s)+SLB_NCML(5,s)+SLB_NCML(16,s)+SLB_NCML(17,s)+SLB_NCML(22,s)+SLB_NCML(23,s)+SLB_NCML(28,s)+SLB_NCML(30,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(4,s)+SLB_NCA(5,s)+SLB_NCA(16,s)+SLB_NCA(17,s)+SLB_NCA(22,s)+SLB_NCA(23,s)+SLB_NCA(28,s)+SLB_NCA(30,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(4,s)+SLB_LMO(5,s)+SLB_LMO(16,s)+SLB_LMO(17,s)+SLB_LMO(22,s)+SLB_LMO(23,s)+SLB_LMO(28,s)+SLB_LMO(30,s),
                    delI_SLB_LFP(27,s,1) == sum(sum(delI_SLB_LFP_COT(287:296,287:296,s))) + sum(sum(delI_SLB_LFP_COT(14:24,287:296,s))) + sum(sum(delI_SLB_LFP_COT(25:36,287:296,s))) + sum(sum(delI_SLB_LFP_COT(150:166,287:296,s))) + sum(sum(delI_SLB_LFP_COT(167:179,287:296,s))) + sum(delI_SLB_LFP_COT(233,287:296,s)) + sum(sum(delI_SLB_LFP_COT(234:254,287:296,s))) + sum(sum(delI_SLB_LFP_COT(297:310,287:296,s))) + sum(sum(delI_SLB_LFP_COT(319:323,287:296,s))), 
                    delI_SLB_NCMH(27,s,1) == sum(sum(delI_SLB_NCMH_COT(287:296,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(14:24,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(150:166,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(167:179,287:296,s))) + sum(delI_SLB_NCMH_COT(233,287:296,s)) + sum(sum(delI_SLB_NCMH_COT(234:254,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,287:296,s))) + sum(sum(delI_SLB_NCMH_COT(319:323,287:296,s))), 
                    delI_SLB_NCMM(27,s,1) == sum(sum(delI_SLB_NCMM_COT(287:296,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(14:24,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(150:166,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(167:179,287:296,s))) + sum(delI_SLB_NCMM_COT(233,287:296,s)) + sum(sum(delI_SLB_NCMM_COT(234:254,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,287:296,s))) + sum(sum(delI_SLB_NCMM_COT(319:323,287:296,s))), 
                    delI_SLB_NCML(27,s,1) == sum(sum(delI_SLB_NCML_COT(287:296,287:296,s))) + sum(sum(delI_SLB_NCML_COT(14:24,287:296,s))) + sum(sum(delI_SLB_NCML_COT(25:36,287:296,s))) + sum(sum(delI_SLB_NCML_COT(150:166,287:296,s))) + sum(sum(delI_SLB_NCML_COT(167:179,287:296,s))) + sum(delI_SLB_NCML_COT(233,287:296,s)) + sum(sum(delI_SLB_NCML_COT(234:254,287:296,s))) + sum(sum(delI_SLB_NCML_COT(297:310,287:296,s))) + sum(sum(delI_SLB_NCML_COT(319:323,287:296,s))), 
                    delI_SLB_NCA(27,s,1) == sum(sum(delI_SLB_NCA_COT(287:296,287:296,s))) + sum(sum(delI_SLB_NCA_COT(14:24,287:296,s))) + sum(sum(delI_SLB_NCA_COT(25:36,287:296,s))) + sum(sum(delI_SLB_NCA_COT(150:166,287:296,s))) + sum(sum(delI_SLB_NCA_COT(167:179,287:296,s))) + sum(delI_SLB_NCA_COT(233,287:296,s)) + sum(sum(delI_SLB_NCA_COT(234:254,287:296,s))) + sum(sum(delI_SLB_NCA_COT(297:310,287:296,s))) + sum(sum(delI_SLB_NCA_COT(319:323,287:296,s))), 
                    delI_SLB_LMO(27,s,1) == sum(sum(delI_SLB_LMO_COT(287:296,287:296,s))) + sum(sum(delI_SLB_LMO_COT(14:24,287:296,s))) + sum(sum(delI_SLB_LMO_COT(25:36,287:296,s))) + sum(sum(delI_SLB_LMO_COT(150:166,287:296,s))) + sum(sum(delI_SLB_LMO_COT(167:179,287:296,s))) + sum(delI_SLB_LMO_COT(233,287:296,s)) + sum(sum(delI_SLB_LMO_COT(234:254,287:296,s))) + sum(sum(delI_SLB_LMO_COT(297:310,287:296,s))) + sum(sum(delI_SLB_LMO_COT(319:323,287:296,s))), 
                    ];
%             elseif prv == 28 %%%%%%%%% Gansu
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(5,s)+SLB_LFP(23,s)+SLB_LFP(27,s)+SLB_LFP(29,s)+SLB_LFP(30,s)+SLB_LFP(31,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(5,s)+SLB_NCMH(23,s)+SLB_NCMH(27,s)+SLB_NCMH(29,s)+SLB_NCMH(30,s)+SLB_NCMH(31,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(5,s)+SLB_NCMM(23,s)+SLB_NCMM(27,s)+SLB_NCMM(29,s)+SLB_NCMM(30,s)+SLB_NCMM(31,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(5,s)+SLB_NCML(23,s)+SLB_NCML(27,s)+SLB_NCML(29,s)+SLB_NCML(30,s)+SLB_NCML(31,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(5,s)+SLB_NCA(23,s)+SLB_NCA(27,s)+SLB_NCA(29,s)+SLB_NCA(30,s)+SLB_NCA(31,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(5,s)+SLB_LMO(23,s)+SLB_LMO(27,s)+SLB_LMO(29,s)+SLB_LMO(30,s)+SLB_LMO(31,s),
                    delI_SLB_LFP(28,s,1) == sum(sum(delI_SLB_LFP_COT(297:310,297:310,s))) + sum(sum(delI_SLB_LFP_COT(25:36,297:310,s))) + sum(sum(delI_SLB_LFP_COT(234:254,297:310,s))) + sum(sum(delI_SLB_LFP_COT(287:296,297:310,s))) + sum(sum(delI_SLB_LFP_COT(311:318,297:310,s))) + sum(sum(delI_SLB_LFP_COT(319:323,297:310,s))) + sum(sum(delI_SLB_LFP_COT(324:337,297:310,s))), 
                    delI_SLB_NCMH(28,s,1) == sum(sum(delI_SLB_NCMH_COT(297:310,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(234:254,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(311:318,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(319:323,297:310,s))) + sum(sum(delI_SLB_NCMH_COT(324:337,297:310,s))), 
                    delI_SLB_NCMM(28,s,1) == sum(sum(delI_SLB_NCMM_COT(297:310,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(234:254,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(311:318,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(319:323,297:310,s))) + sum(sum(delI_SLB_NCMM_COT(324:337,297:310,s))), 
                    delI_SLB_NCML(28,s,1) == sum(sum(delI_SLB_NCML_COT(297:310,297:310,s))) + sum(sum(delI_SLB_NCML_COT(25:36,297:310,s))) + sum(sum(delI_SLB_NCML_COT(234:254,297:310,s))) + sum(sum(delI_SLB_NCML_COT(287:296,297:310,s))) + sum(sum(delI_SLB_NCML_COT(311:318,297:310,s))) + sum(sum(delI_SLB_NCML_COT(319:323,297:310,s))) + sum(sum(delI_SLB_NCML_COT(324:337,297:310,s))), 
                    delI_SLB_NCA(28,s,1) == sum(sum(delI_SLB_NCA_COT(297:310,297:310,s))) + sum(sum(delI_SLB_NCA_COT(25:36,297:310,s))) + sum(sum(delI_SLB_NCA_COT(234:254,297:310,s))) + sum(sum(delI_SLB_NCA_COT(287:296,297:310,s))) + sum(sum(delI_SLB_NCA_COT(311:318,297:310,s))) + sum(sum(delI_SLB_NCA_COT(319:323,297:310,s))) + sum(sum(delI_SLB_NCA_COT(324:337,297:310,s))), 
                    delI_SLB_LMO(28,s,1) == sum(sum(delI_SLB_LMO_COT(297:310,297:310,s))) + sum(sum(delI_SLB_LMO_COT(25:36,297:310,s))) + sum(sum(delI_SLB_LMO_COT(234:254,297:310,s))) + sum(sum(delI_SLB_LMO_COT(287:296,297:310,s))) + sum(sum(delI_SLB_LMO_COT(311:318,297:310,s))) + sum(sum(delI_SLB_LMO_COT(319:323,297:310,s))) + sum(sum(delI_SLB_LMO_COT(324:337,297:310,s))), 
                    ];
%             elseif prv == 29 %%%%%%%%% Qinghai
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(23,s)+SLB_LFP(26,s)+SLB_LFP(28,s)+SLB_LFP(31,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(23,s)+SLB_NCMH(26,s)+SLB_NCMH(28,s)+SLB_NCMH(31,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(23,s)+SLB_NCMM(26,s)+SLB_NCMM(28,s)+SLB_NCMM(31,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(23,s)+SLB_NCML(26,s)+SLB_NCML(28,s)+SLB_NCML(31,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(23,s)+SLB_NCA(26,s)+SLB_NCA(28,s)+SLB_NCA(31,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(23,s)+SLB_LMO(26,s)+SLB_LMO(28,s)+SLB_LMO(31,s),
                    delI_SLB_LFP(29,s,1) == sum(sum(delI_SLB_LFP_COT(311:318,311:318,s))) + sum(sum(delI_SLB_LFP_COT(234:254,311:318,s))) + sum(sum(delI_SLB_LFP_COT(280:286,311:318,s))) + sum(sum(delI_SLB_LFP_COT(297:310,311:318,s))) + sum(sum(delI_SLB_LFP_COT(324:337,311:318,s))), 
                    delI_SLB_NCMH(29,s,1) == sum(sum(delI_SLB_NCMH_COT(311:318,311:318,s))) + sum(sum(delI_SLB_NCMH_COT(234:254,311:318,s))) + sum(sum(delI_SLB_NCMH_COT(280:286,311:318,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,311:318,s))) + sum(sum(delI_SLB_NCMH_COT(324:337,311:318,s))), 
                    delI_SLB_NCMM(29,s,1) == sum(sum(delI_SLB_NCMM_COT(311:318,311:318,s))) + sum(sum(delI_SLB_NCMM_COT(234:254,311:318,s))) + sum(sum(delI_SLB_NCMM_COT(280:286,311:318,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,311:318,s))) + sum(sum(delI_SLB_NCMM_COT(324:337,311:318,s))), 
                    delI_SLB_NCML(29,s,1) == sum(sum(delI_SLB_NCML_COT(311:318,311:318,s))) + sum(sum(delI_SLB_NCML_COT(234:254,311:318,s))) + sum(sum(delI_SLB_NCML_COT(280:286,311:318,s))) + sum(sum(delI_SLB_NCML_COT(297:310,311:318,s))) + sum(sum(delI_SLB_NCML_COT(324:337,311:318,s))), 
                    delI_SLB_NCA(29,s,1) == sum(sum(delI_SLB_NCA_COT(311:318,311:318,s))) + sum(sum(delI_SLB_NCA_COT(234:254,311:318,s))) + sum(sum(delI_SLB_NCA_COT(280:286,311:318,s))) + sum(sum(delI_SLB_NCA_COT(297:310,311:318,s))) + sum(sum(delI_SLB_NCA_COT(324:337,311:318,s))), 
                    delI_SLB_LMO(29,s,1) == sum(sum(delI_SLB_LMO_COT(311:318,311:318,s))) + sum(sum(delI_SLB_LMO_COT(234:254,311:318,s))) + sum(sum(delI_SLB_LMO_COT(280:286,311:318,s))) + sum(sum(delI_SLB_LMO_COT(297:310,311:318,s))) + sum(sum(delI_SLB_LMO_COT(324:337,311:318,s))), 
                    ];
%             elseif prv == 30 %%%%%%%%% Ningxia
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(5,s)+SLB_LFP(27,s)+SLB_LFP(28,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(5,s)+SLB_NCMH(27,s)+SLB_NCMH(28,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(5,s)+SLB_NCMM(27,s)+SLB_NCMM(28,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(5,s)+SLB_NCML(27,s)+SLB_NCML(28,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(5,s)+SLB_NCA(27,s)+SLB_NCA(28,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(5,s)+SLB_LMO(27,s)+SLB_LMO(28,s),
                    delI_SLB_LFP(30,s,1) == sum(sum(delI_SLB_LFP_COT(319:323,319:323,s))) + sum(sum(delI_SLB_LFP_COT(25:36,319:323,s))) + sum(sum(delI_SLB_LFP_COT(287:296,319:323,s))) + sum(sum(delI_SLB_LFP_COT(297:310,319:323,s))), 
                    delI_SLB_NCMH(30,s,1) == sum(sum(delI_SLB_NCMH_COT(319:323,319:323,s))) + sum(sum(delI_SLB_NCMH_COT(25:36,319:323,s))) + sum(sum(delI_SLB_NCMH_COT(287:296,319:323,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,319:323,s))), 
                    delI_SLB_NCMM(30,s,1) == sum(sum(delI_SLB_NCMM_COT(319:323,319:323,s))) + sum(sum(delI_SLB_NCMM_COT(25:36,319:323,s))) + sum(sum(delI_SLB_NCMM_COT(287:296,319:323,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,319:323,s))), 
                    delI_SLB_NCML(30,s,1) == sum(sum(delI_SLB_NCML_COT(319:323,319:323,s))) + sum(sum(delI_SLB_NCML_COT(25:36,319:323,s))) + sum(sum(delI_SLB_NCML_COT(287:296,319:323,s))) + sum(sum(delI_SLB_NCML_COT(297:310,319:323,s))), 
                    delI_SLB_NCA(30,s,1) == sum(sum(delI_SLB_NCA_COT(319:323,319:323,s))) + sum(sum(delI_SLB_NCA_COT(25:36,319:323,s))) + sum(sum(delI_SLB_NCA_COT(287:296,319:323,s))) + sum(sum(delI_SLB_NCA_COT(297:310,319:323,s))), 
                    delI_SLB_LMO(30,s,1) == sum(sum(delI_SLB_LMO_COT(319:323,319:323,s))) + sum(sum(delI_SLB_LMO_COT(25:36,319:323,s))) + sum(sum(delI_SLB_LMO_COT(287:296,319:323,s))) + sum(sum(delI_SLB_LMO_COT(297:310,319:323,s))), 
                    ];
%             elseif prv == 31 %%%%%%%%% Xinjiang
                C_CAP = [C_CAP,
%                     delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s)+SLB_LFP(26,s)+SLB_LFP(28,s)+SLB_LFP(29,s), 
%                     delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s)+SLB_NCMH(26,s)+SLB_NCMH(28,s)+SLB_NCMH(29,s),
%                     delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s)+SLB_NCMM(26,s)+SLB_NCMM(28,s)+SLB_NCMM(29,s),
%                     delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s)+SLB_NCML(26,s)+SLB_NCML(28,s)+SLB_NCML(29,s),
%                     delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s)+SLB_NCA(26,s)+SLB_NCA(28,s)+SLB_NCA(29,s),
%                     delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s)+SLB_LMO(26,s)+SLB_LMO(28,s)+SLB_LMO(29,s),
                    delI_SLB_LFP(31,s,1) == sum(sum(delI_SLB_LFP_COT(324:337,324:337,s))) + sum(sum(delI_SLB_LFP_COT(280:286,324:337,s))) + sum(sum(delI_SLB_LFP_COT(297:310,324:337,s))) + sum(sum(delI_SLB_LFP_COT(311:318,324:337,s))), 
                    delI_SLB_NCMH(31,s,1) == sum(sum(delI_SLB_NCMH_COT(324:337,324:337,s))) + sum(sum(delI_SLB_NCMH_COT(280:286,324:337,s))) + sum(sum(delI_SLB_NCMH_COT(297:310,324:337,s))) + sum(sum(delI_SLB_NCMH_COT(311:318,324:337,s))), 
                    delI_SLB_NCMM(31,s,1) == sum(sum(delI_SLB_NCMM_COT(324:337,324:337,s))) + sum(sum(delI_SLB_NCMM_COT(280:286,324:337,s))) + sum(sum(delI_SLB_NCMM_COT(297:310,324:337,s))) + sum(sum(delI_SLB_NCMM_COT(311:318,324:337,s))), 
                    delI_SLB_NCML(31,s,1) == sum(sum(delI_SLB_NCML_COT(324:337,324:337,s))) + sum(sum(delI_SLB_NCML_COT(280:286,324:337,s))) + sum(sum(delI_SLB_NCML_COT(297:310,324:337,s))) + sum(sum(delI_SLB_NCML_COT(311:318,324:337,s))), 
                    delI_SLB_NCA(31,s,1) == sum(sum(delI_SLB_NCA_COT(324:337,324:337,s))) + sum(sum(delI_SLB_NCA_COT(280:286,324:337,s))) + sum(sum(delI_SLB_NCA_COT(297:310,324:337,s))) + sum(sum(delI_SLB_NCA_COT(311:318,324:337,s))), 
                    delI_SLB_LMO(31,s,1) == sum(sum(delI_SLB_LMO_COT(324:337,324:337,s))) + sum(sum(delI_SLB_LMO_COT(280:286,324:337,s))) + sum(sum(delI_SLB_LMO_COT(297:310,324:337,s))) + sum(sum(delI_SLB_LMO_COT(311:318,324:337,s))), 
                    ];

%%%%%%%%%%%%%%%%%%%%%%%%% 需要知道省之间的电池流通量

%            end
        end        

%         for prv = 1:province_num
%             C_CAP = [C_CAP,
%                 delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s),
%                 delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s),
%                 delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s),
%                 delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s),
%                 delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s),
%                 delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s),
%                 ];
%         end
