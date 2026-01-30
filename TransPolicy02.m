
%%%%% Beijing
%         delIR_SLB_LFP_COT(1,1,s) == delI_SLB_LFP(1,s,1);

% for n = 1:city_num
%     for m = 1:city_num
%         if n == 1 && m == 1
                C_CAP = [C_CAP,
                delI_SLB_LFP(1,s,1) == delI_SLB_LFP_COT(1,1,s),
                delI_SLB_NCMH(1,s,1) == delI_SLB_NCMH_COT(1,1,s),
                delI_SLB_NCMM(1,s,1) == delI_SLB_NCMM_COT(1,1,s),
                delI_SLB_NCML(1,s,1) == delI_SLB_NCML_COT(1,1,s),
                delI_SLB_NCA(1,s,1) == delI_SLB_NCA_COT(1,1,s),
                delI_SLB_LMO(1,s,1) == delI_SLB_LMO_COT(1,1,s),
                ];

%         elseif n == 2 && m == 2
                C_CAP = [C_CAP,
                delI_SLB_LFP(2,s,1) == delI_SLB_LFP_COT(2,2,s),
                delI_SLB_NCMH(2,s,1) == delI_SLB_NCMH_COT(2,2,s),
                delI_SLB_NCMM(2,s,1) == delI_SLB_NCMM_COT(2,2,s),
                delI_SLB_NCML(2,s,1) == delI_SLB_NCML_COT(2,2,s),
                delI_SLB_NCA(2,s,1) == delI_SLB_NCA_COT(2,2,s),
                delI_SLB_LMO(2,s,1) == delI_SLB_LMO_COT(2,2,s),
                ];
            
% Hebei
%         elseif n >= 3 && n <= 13 && m >= 3 && m <= 13
                C_CAP = [C_CAP,
                delI_SLB_LFP(3,s,1) == sum(sum(delI_SLB_LFP_COT(3:13,3:13,s))),
                delI_SLB_NCMH(3,s,1) == sum(sum(delI_SLB_NCMH_COT(3:13,3:13,s))),
                delI_SLB_NCMM(3,s,1) == sum(sum(delI_SLB_NCMM_COT(3:13,3:13,s))),
                delI_SLB_NCML(3,s,1) == sum(sum(delI_SLB_NCML_COT(3:13,3:13,s))),
                delI_SLB_NCA(3,s,1) == sum(sum(delI_SLB_NCA_COT(3:13,3:13,s))),
                delI_SLB_LMO(3,s,1) == sum(sum(delI_SLB_LMO_COT(3:13,3:13,s))),
                ];
            
% Shanxi
%         elseif n >= 14 && n <= 24 && m >= 14 && m <= 24
                C_CAP = [C_CAP,
                delI_SLB_LFP(4,s,1) == sum(sum(delI_SLB_LFP_COT(14:24,14:24,s))),
                delI_SLB_NCMH(4,s,1) == sum(sum(delI_SLB_NCMH_COT(14:24,14:24,s))),
                delI_SLB_NCMM(4,s,1) == sum(sum(delI_SLB_NCMM_COT(14:24,14:24,s))),
                delI_SLB_NCML(4,s,1) == sum(sum(delI_SLB_NCML_COT(14:24,14:24,s))),
                delI_SLB_NCA(4,s,1) == sum(sum(delI_SLB_NCA_COT(14:24,14:24,s))),
                delI_SLB_LMO(4,s,1) == sum(sum(delI_SLB_LMO_COT(14:24,14:24,s))),
                ];

% Neimenggu
%         elseif n >= 25 && n <= 36 && m >= 25 && m <= 36
                C_CAP = [C_CAP,
                delI_SLB_LFP(5,s,1) == sum(sum(delI_SLB_LFP_COT(25:36,25:36,s))),
                delI_SLB_NCMH(5,s,1) == sum(sum(delI_SLB_NCMH_COT(25:36,25:36,s))),
                delI_SLB_NCMM(5,s,1) == sum(sum(delI_SLB_NCMM_COT(25:36,25:36,s))),
                delI_SLB_NCML(5,s,1) == sum(sum(delI_SLB_NCML_COT(25:36,25:36,s))),
                delI_SLB_NCA(5,s,1) == sum(sum(delI_SLB_NCA_COT(25:36,25:36,s))),
                delI_SLB_LMO(5,s,1) == sum(sum(delI_SLB_LMO_COT(25:36,25:36,s))),
                ];

                if province_num > 5
% Liaoning
%         elseif n >= 37 && n <= 50 && m >= 37 && m <= 50
                C_CAP = [C_CAP,
                delI_SLB_LFP(6,s,1) == sum(sum(delI_SLB_LFP_COT(37:50,37:50,s))),
                delI_SLB_NCMH(6,s,1) == sum(sum(delI_SLB_NCMH_COT(37:50,37:50,s))),
                delI_SLB_NCMM(6,s,1) == sum(sum(delI_SLB_NCMM_COT(37:50,37:50,s))),
                delI_SLB_NCML(6,s,1) == sum(sum(delI_SLB_NCML_COT(37:50,37:50,s))),
                delI_SLB_NCA(6,s,1) == sum(sum(delI_SLB_NCA_COT(37:50,37:50,s))),
                delI_SLB_LMO(6,s,1) == sum(sum(delI_SLB_LMO_COT(37:50,37:50,s))),
                ];               

% Jilin
%         elseif n >= 51 && n <= 59 && m >= 51 && m <= 59
                C_CAP = [C_CAP,
                delI_SLB_LFP(7,s,1) == sum(sum(delI_SLB_LFP_COT(51:59,51:59,s))),
                delI_SLB_NCMH(7,s,1) == sum(sum(delI_SLB_NCMH_COT(51:59,51:59,s))),
                delI_SLB_NCMM(7,s,1) == sum(sum(delI_SLB_NCMM_COT(51:59,51:59,s))),
                delI_SLB_NCML(7,s,1) == sum(sum(delI_SLB_NCML_COT(51:59,51:59,s))),
                delI_SLB_NCA(7,s,1) == sum(sum(delI_SLB_NCA_COT(51:59,51:59,s))),
                delI_SLB_LMO(7,s,1) == sum(sum(delI_SLB_LMO_COT(51:59,51:59,s))),
                ];               

% Heilongjiang
%         elseif n >= 60 && n <= 72 && m >= 60 && m <= 72
                C_CAP = [C_CAP,
                delI_SLB_LFP(8,s,1) == sum(sum(delI_SLB_LFP_COT(60:72,60:72,s))),
                delI_SLB_NCMH(8,s,1) == sum(sum(delI_SLB_NCMH_COT(60:72,60:72,s))),
                delI_SLB_NCMM(8,s,1) == sum(sum(delI_SLB_NCMM_COT(60:72,60:72,s))),
                delI_SLB_NCML(8,s,1) == sum(sum(delI_SLB_NCML_COT(60:72,60:72,s))),
                delI_SLB_NCA(8,s,1) == sum(sum(delI_SLB_NCA_COT(60:72,60:72,s))),
                delI_SLB_LMO(8,s,1) == sum(sum(delI_SLB_LMO_COT(60:72,60:72,s))),
                ];               

% Shanghai
%         elseif n == 73 && m == 73
                C_CAP = [C_CAP,
                delI_SLB_LFP(9,s,1) == delI_SLB_LFP_COT(73,73,s),
                delI_SLB_NCMH(9,s,1) == delI_SLB_NCMH_COT(73,73,s),
                delI_SLB_NCMM(9,s,1) == delI_SLB_NCMM_COT(73,73,s),
                delI_SLB_NCML(9,s,1) == delI_SLB_NCML_COT(73,73,s),
                delI_SLB_NCA(9,s,1) == delI_SLB_NCA_COT(73,73,s),
                delI_SLB_LMO(9,s,1) == delI_SLB_LMO_COT(73,73,s),
                ];               

% Jiangsu
%         elseif n >= 74 && n <= 86 && m >= 74 && m <= 86
                C_CAP = [C_CAP,
                delI_SLB_LFP(10,s,1) == sum(sum(delI_SLB_LFP_COT(74:86,74:86,s))),
                delI_SLB_NCMH(10,s,1) == sum(sum(delI_SLB_NCMH_COT(74:86,74:86,s))),
                delI_SLB_NCMM(10,s,1) == sum(sum(delI_SLB_NCMM_COT(74:86,74:86,s))),
                delI_SLB_NCML(10,s,1) == sum(sum(delI_SLB_NCML_COT(74:86,74:86,s))),
                delI_SLB_NCA(10,s,1) == sum(sum(delI_SLB_NCA_COT(74:86,74:86,s))),
                delI_SLB_LMO(10,s,1) == sum(sum(delI_SLB_LMO_COT(74:86,74:86,s))),
                ];               

% Zhejiang
%         elseif n >= 87 && n <= 97 && m >= 87 && m <= 97
                C_CAP = [C_CAP,
                delI_SLB_LFP(11,s,1) == sum(sum(delI_SLB_LFP_COT(87:97,87:97,s))),
                delI_SLB_NCMH(11,s,1) == sum(sum(delI_SLB_NCMH_COT(87:97,87:97,s))),
                delI_SLB_NCMM(11,s,1) == sum(sum(delI_SLB_NCMM_COT(87:97,87:97,s))),
                delI_SLB_NCML(11,s,1) == sum(sum(delI_SLB_NCML_COT(87:97,87:97,s))),
                delI_SLB_NCA(11,s,1) == sum(sum(delI_SLB_NCA_COT(87:97,87:97,s))),
                delI_SLB_LMO(11,s,1) == sum(sum(delI_SLB_LMO_COT(87:97,87:97,s))),
                ];               

% Anhui
%         elseif n >= 98 && n <= 113 && m >= 98 && m <= 113
                C_CAP = [C_CAP,
                delI_SLB_LFP(12,s,1) == sum(sum(delI_SLB_LFP_COT(98:113,98:113,s))),
                delI_SLB_NCMH(12,s,1) == sum(sum(delI_SLB_NCMH_COT(98:113,98:113,s))),
                delI_SLB_NCMM(12,s,1) == sum(sum(delI_SLB_NCMM_COT(98:113,98:113,s))),
                delI_SLB_NCML(12,s,1) == sum(sum(delI_SLB_NCML_COT(98:113,98:113,s))),
                delI_SLB_NCA(12,s,1) == sum(sum(delI_SLB_NCA_COT(98:113,98:113,s))),
                delI_SLB_LMO(12,s,1) == sum(sum(delI_SLB_LMO_COT(98:113,98:113,s))),
                ];               

% Fujian
%         elseif n >= 114 && n <= 122 && m >= 114 && m <= 122
                C_CAP = [C_CAP,
                delI_SLB_LFP(13,s,1) == sum(sum(delI_SLB_LFP_COT(114:122,114:122,s))),
                delI_SLB_NCMH(13,s,1) == sum(sum(delI_SLB_NCMH_COT(114:122,114:122,s))),
                delI_SLB_NCMM(13,s,1) == sum(sum(delI_SLB_NCMM_COT(114:122,114:122,s))),
                delI_SLB_NCML(13,s,1) == sum(sum(delI_SLB_NCML_COT(114:122,114:122,s))),
                delI_SLB_NCA(13,s,1) == sum(sum(delI_SLB_NCA_COT(114:122,114:122,s))),
                delI_SLB_LMO(13,s,1) == sum(sum(delI_SLB_LMO_COT(114:122,114:122,s))),
                ];               

% Jiangxi
%         elseif n >= 123 && n <= 133 && m >= 123 && m <= 133
                C_CAP = [C_CAP,
                delI_SLB_LFP(14,s,1) == sum(sum(delI_SLB_LFP_COT(123:133,123:133,s))),
                delI_SLB_NCMH(14,s,1) == sum(sum(delI_SLB_NCMH_COT(123:133,123:133,s))),
                delI_SLB_NCMM(14,s,1) == sum(sum(delI_SLB_NCMM_COT(123:133,123:133,s))),
                delI_SLB_NCML(14,s,1) == sum(sum(delI_SLB_NCML_COT(123:133,123:133,s))),
                delI_SLB_NCA(14,s,1) == sum(sum(delI_SLB_NCA_COT(123:133,123:133,s))),
                delI_SLB_LMO(14,s,1) == sum(sum(delI_SLB_LMO_COT(123:133,123:133,s))),
                ];               

% Shandong
%         elseif n >= 134 && n <= 149 && m >= 134 && m <= 149
                C_CAP = [C_CAP,
                delI_SLB_LFP(15,s,1) == sum(sum(delI_SLB_LFP_COT(134:149,134:149,s))),
                delI_SLB_NCMH(15,s,1) == sum(sum(delI_SLB_NCMH_COT(134:149,134:149,s))),
                delI_SLB_NCMM(15,s,1) == sum(sum(delI_SLB_NCMM_COT(134:149,134:149,s))),
                delI_SLB_NCML(15,s,1) == sum(sum(delI_SLB_NCML_COT(134:149,134:149,s))),
                delI_SLB_NCA(15,s,1) == sum(sum(delI_SLB_NCA_COT(134:149,134:149,s))),
                delI_SLB_LMO(15,s,1) == sum(sum(delI_SLB_LMO_COT(134:149,134:149,s))),
                ];               

% Henan
%         elseif n >= 150 && n <= 166 && m >= 150 && m <= 166
                C_CAP = [C_CAP,
                delI_SLB_LFP(16,s,1) == sum(sum(delI_SLB_LFP_COT(150:166,150:166,s))),
                delI_SLB_NCMH(16,s,1) == sum(sum(delI_SLB_NCMH_COT(150:166,150:166,s))),
                delI_SLB_NCMM(16,s,1) == sum(sum(delI_SLB_NCMM_COT(150:166,150:166,s))),
                delI_SLB_NCML(16,s,1) == sum(sum(delI_SLB_NCML_COT(150:166,150:166,s))),
                delI_SLB_NCA(16,s,1) == sum(sum(delI_SLB_NCA_COT(150:166,150:166,s))),
                delI_SLB_LMO(16,s,1) == sum(sum(delI_SLB_LMO_COT(150:166,150:166,s))),
                ];               

% Hubei
%         elseif n >= 167 && n <= 179 && m >= 167 && m <= 179
                C_CAP = [C_CAP,
                delI_SLB_LFP(17,s,1) == sum(sum(delI_SLB_LFP_COT(167:179,167:179,s))),
                delI_SLB_NCMH(17,s,1) == sum(sum(delI_SLB_NCMH_COT(167:179,167:179,s))),
                delI_SLB_NCMM(17,s,1) == sum(sum(delI_SLB_NCMM_COT(167:179,167:179,s))),
                delI_SLB_NCML(17,s,1) == sum(sum(delI_SLB_NCML_COT(167:179,167:179,s))),
                delI_SLB_NCA(17,s,1) == sum(sum(delI_SLB_NCA_COT(167:179,167:179,s))),
                delI_SLB_LMO(17,s,1) == sum(sum(delI_SLB_LMO_COT(167:179,167:179,s))),
                ];               

% Hunan
%         elseif n >= 180 && n <= 193 && m >= 180 && m <= 193
                C_CAP = [C_CAP,
                delI_SLB_LFP(18,s,1) == sum(sum(delI_SLB_LFP_COT(180:193,180:193,s))),
                delI_SLB_NCMH(18,s,1) == sum(sum(delI_SLB_NCMH_COT(180:193,180:193,s))),
                delI_SLB_NCMM(18,s,1) == sum(sum(delI_SLB_NCMM_COT(180:193,180:193,s))),
                delI_SLB_NCML(18,s,1) == sum(sum(delI_SLB_NCML_COT(180:193,180:193,s))),
                delI_SLB_NCA(18,s,1) == sum(sum(delI_SLB_NCA_COT(180:193,180:193,s))),
                delI_SLB_LMO(18,s,1) == sum(sum(delI_SLB_LMO_COT(180:193,180:193,s))),
                ];               

% Guangdong
%         elseif n >= 194 && n <= 214 && m >= 194 && m <= 214
                C_CAP = [C_CAP,
                delI_SLB_LFP(19,s,1) == sum(sum(delI_SLB_LFP_COT(194:214,194:214,s))),
                delI_SLB_NCMH(19,s,1) == sum(sum(delI_SLB_NCMH_COT(194:214,194:214,s))),
                delI_SLB_NCMM(19,s,1) == sum(sum(delI_SLB_NCMM_COT(194:214,194:214,s))),
                delI_SLB_NCML(19,s,1) == sum(sum(delI_SLB_NCML_COT(194:214,194:214,s))),
                delI_SLB_NCA(19,s,1) == sum(sum(delI_SLB_NCA_COT(194:214,194:214,s))),
                delI_SLB_LMO(19,s,1) == sum(sum(delI_SLB_LMO_COT(194:214,194:214,s))),
                ];      

% Guangxi
%         elseif n >= 215 && n <= 228 && m >= 215 && m <= 228
                C_CAP = [C_CAP,
                delI_SLB_LFP(20,s,1) == sum(sum(delI_SLB_LFP_COT(215:228,215:228,s))),
                delI_SLB_NCMH(20,s,1) == sum(sum(delI_SLB_NCMH_COT(215:228,215:228,s))),
                delI_SLB_NCMM(20,s,1) == sum(sum(delI_SLB_NCMM_COT(215:228,215:228,s))),
                delI_SLB_NCML(20,s,1) == sum(sum(delI_SLB_NCML_COT(215:228,215:228,s))),
                delI_SLB_NCA(20,s,1) == sum(sum(delI_SLB_NCA_COT(215:228,215:228,s))),
                delI_SLB_LMO(20,s,1) == sum(sum(delI_SLB_LMO_COT(215:228,215:228,s))),
                ];               

% Hainan
%         elseif n >= 229 && n <= 232 && m >= 229 && m <= 232
                C_CAP = [C_CAP,
                delI_SLB_LFP(21,s,1) == sum(sum(delI_SLB_LFP_COT(229:232,229:232,s))),
                delI_SLB_NCMH(21,s,1) == sum(sum(delI_SLB_NCMH_COT(229:232,229:232,s))),
                delI_SLB_NCMM(21,s,1) == sum(sum(delI_SLB_NCMM_COT(229:232,229:232,s))),
                delI_SLB_NCML(21,s,1) == sum(sum(delI_SLB_NCML_COT(229:232,229:232,s))),
                delI_SLB_NCA(21,s,1) == sum(sum(delI_SLB_NCA_COT(229:232,229:232,s))),
                delI_SLB_LMO(21,s,1) == sum(sum(delI_SLB_LMO_COT(229:232,229:232,s))),
                ];               

% Chongqing
%         elseif n == 233 && m == 233
                C_CAP = [C_CAP,
                delI_SLB_LFP(22,s,1) == delI_SLB_LFP_COT(233,233,s),
                delI_SLB_NCMH(22,s,1) == delI_SLB_NCMH_COT(233,233,s),
                delI_SLB_NCMM(22,s,1) == delI_SLB_NCMM_COT(233,233,s),
                delI_SLB_NCML(22,s,1) == delI_SLB_NCML_COT(233,233,s),
                delI_SLB_NCA(22,s,1) == delI_SLB_NCA_COT(233,233,s),
                delI_SLB_LMO(22,s,1) == delI_SLB_LMO_COT(233,233,s),
                ];               

  % Sichuan
%         elseif n >= 234 && n <= 254 && m >= 234 && m <= 254
                C_CAP = [C_CAP,
                delI_SLB_LFP(23,s,1) == sum(sum(delI_SLB_LFP_COT(234:254,234:254,s))),
                delI_SLB_NCMH(23,s,1) == sum(sum(delI_SLB_NCMH_COT(234:254,234:254,s))),
                delI_SLB_NCMM(23,s,1) == sum(sum(delI_SLB_NCMM_COT(234:254,234:254,s))),
                delI_SLB_NCML(23,s,1) == sum(sum(delI_SLB_NCML_COT(234:254,234:254,s))),
                delI_SLB_NCA(23,s,1) == sum(sum(delI_SLB_NCA_COT(234:254,234:254,s))),
                delI_SLB_LMO(23,s,1) == sum(sum(delI_SLB_LMO_COT(234:254,234:254,s))),
                ];               

% Guizhou
%         elseif n >= 255 && n <= 263 && m >= 255 && m <= 263
                C_CAP = [C_CAP,
                delI_SLB_LFP(24,s,1) == sum(sum(delI_SLB_LFP_COT(255:263,255:263,s))),
                delI_SLB_NCMH(24,s,1) == sum(sum(delI_SLB_NCMH_COT(255:263,255:263,s))),
                delI_SLB_NCMM(24,s,1) == sum(sum(delI_SLB_NCMM_COT(255:263,255:263,s))),
                delI_SLB_NCML(24,s,1) == sum(sum(delI_SLB_NCML_COT(255:263,255:263,s))),
                delI_SLB_NCA(24,s,1) == sum(sum(delI_SLB_NCA_COT(255:263,255:263,s))),
                delI_SLB_LMO(24,s,1) == sum(sum(delI_SLB_LMO_COT(255:263,255:263,s))),
                ];               

% Yunnan
%         elseif n >= 264 && n <= 279 && m >= 264 && m <= 279
                C_CAP = [C_CAP,
                delI_SLB_LFP(25,s,1) == sum(sum(delI_SLB_LFP_COT(264:279,264:279,s))),
                delI_SLB_NCMH(25,s,1) == sum(sum(delI_SLB_NCMH_COT(264:279,264:279,s))),
                delI_SLB_NCMM(25,s,1) == sum(sum(delI_SLB_NCMM_COT(264:279,264:279,s))),
                delI_SLB_NCML(25,s,1) == sum(sum(delI_SLB_NCML_COT(264:279,264:279,s))),
                delI_SLB_NCA(25,s,1) == sum(sum(delI_SLB_NCA_COT(264:279,264:279,s))),
                delI_SLB_LMO(25,s,1) == sum(sum(delI_SLB_LMO_COT(264:279,264:279,s))),
                ];               

% Xizang
%         elseif n >= 280 && n <= 286 && m >= 280 && m <= 286
                C_CAP = [C_CAP,
                delI_SLB_LFP(26,s,1) == sum(sum(delI_SLB_LFP_COT(280:286,280:286,s))),
                delI_SLB_NCMH(26,s,1) == sum(sum(delI_SLB_NCMH_COT(280:286,280:286,s))),
                delI_SLB_NCMM(26,s,1) == sum(sum(delI_SLB_NCMM_COT(280:286,280:286,s))),
                delI_SLB_NCML(26,s,1) == sum(sum(delI_SLB_NCML_COT(280:286,280:286,s))),
                delI_SLB_NCA(26,s,1) == sum(sum(delI_SLB_NCA_COT(280:286,280:286,s))),
                delI_SLB_LMO(26,s,1) == sum(sum(delI_SLB_LMO_COT(280:286,280:286,s))),
                ];               

% Shaanxi
%         elseif n >= 287 && n <= 296 && m >= 287 && m <= 296
                C_CAP = [C_CAP,
                delI_SLB_LFP(27,s,1) == sum(sum(delI_SLB_LFP_COT(287:296,287:296,s))),
                delI_SLB_NCMH(27,s,1) == sum(sum(delI_SLB_NCMH_COT(287:296,287:296,s))),
                delI_SLB_NCMM(27,s,1) == sum(sum(delI_SLB_NCMM_COT(287:296,287:296,s))),
                delI_SLB_NCML(27,s,1) == sum(sum(delI_SLB_NCML_COT(287:296,287:296,s))),
                delI_SLB_NCA(27,s,1) == sum(sum(delI_SLB_NCA_COT(287:296,287:296,s))),
                delI_SLB_LMO(27,s,1) == sum(sum(delI_SLB_LMO_COT(287:296,287:296,s))),
                ];               

% Gansu
%         elseif n >= 297 && n<=310 && m >= 297 && m<=310
                C_CAP = [C_CAP,
                delI_SLB_LFP(28,s,1) == sum(sum(delI_SLB_LFP_COT(297:310,297:310,s))),
                delI_SLB_NCMH(28,s,1) == sum(sum(delI_SLB_NCMH_COT(297:310,297:310,s))),
                delI_SLB_NCMM(28,s,1) == sum(sum(delI_SLB_NCMM_COT(297:310,297:310,s))),
                delI_SLB_NCML(28,s,1) == sum(sum(delI_SLB_NCML_COT(297:310,297:310,s))),
                delI_SLB_NCA(28,s,1) == sum(sum(delI_SLB_NCA_COT(297:310,297:310,s))),
                delI_SLB_LMO(28,s,1) == sum(sum(delI_SLB_LMO_COT(297:310,297:310,s))),
                ];               

% Qinghai
%         elseif n >= 311 && n <= 318 && m >= 311 && m <= 318
                C_CAP = [C_CAP,
                delI_SLB_LFP(29,s,1) == sum(sum(delI_SLB_LFP_COT(311:318,311:318,s))),
                delI_SLB_NCMH(29,s,1) == sum(sum(delI_SLB_NCMH_COT(311:318,311:318,s))),
                delI_SLB_NCMM(29,s,1) == sum(sum(delI_SLB_NCMM_COT(311:318,311:318,s))),
                delI_SLB_NCML(29,s,1) == sum(sum(delI_SLB_NCML_COT(311:318,311:318,s))),
                delI_SLB_NCA(29,s,1) == sum(sum(delI_SLB_NCA_COT(311:318,311:318,s))),
                delI_SLB_LMO(29,s,1) == sum(sum(delI_SLB_LMO_COT(311:318,311:318,s))),
                ];               

% Ningxia
%         elseif n >= 319 && n <= 323 && m >= 319 && m <= 323
                C_CAP = [C_CAP,
                delI_SLB_LFP(30,s,1) == sum(sum(delI_SLB_LFP_COT(319:323,319:323,s))),
                delI_SLB_NCMH(30,s,1) == sum(sum(delI_SLB_NCMH_COT(319:323,319:323,s))),
                delI_SLB_NCMM(30,s,1) == sum(sum(delI_SLB_NCMM_COT(319:323,319:323,s))),
                delI_SLB_NCML(30,s,1) == sum(sum(delI_SLB_NCML_COT(319:323,319:323,s))),
                delI_SLB_NCA(30,s,1) == sum(sum(delI_SLB_NCA_COT(319:323,319:323,s))),
                delI_SLB_LMO(30,s,1) == sum(sum(delI_SLB_LMO_COT(319:323,319:323,s))),
                ];               

% Xinjiang
%         elseif n >= 324 && n <= 337 && m >= 324 && m <= 337
                C_CAP = [C_CAP,
                delI_SLB_LFP(31,s,1) == sum(sum(delI_SLB_LFP_COT(324:337,324:337,s))),
                delI_SLB_NCMH(31,s,1) == sum(sum(delI_SLB_NCMH_COT(324:337,324:337,s))),
                delI_SLB_NCMM(31,s,1) == sum(sum(delI_SLB_NCMM_COT(324:337,324:337,s))),
                delI_SLB_NCML(31,s,1) == sum(sum(delI_SLB_NCML_COT(324:337,324:337,s))),
                delI_SLB_NCA(31,s,1) == sum(sum(delI_SLB_NCA_COT(324:337,324:337,s))),
                delI_SLB_LMO(31,s,1) == sum(sum(delI_SLB_LMO_COT(324:337,324:337,s))),
                ];     
% else
                end

% end
% for n = 1:city_num
%     for m = 1:city_num
% % Beijing
%         if n == 1 && m == 1
% % Tianjin
%         elseif n == 2 && m == 2
% % Hebei
%         elseif n >= 3 && n <= 13 && m >= 3 && m <= 13
% % Shanxi
%         elseif n >= 14 && n <= 24 && m >= 14 && m <= 24
% % Neimenggu
%         elseif n >= 25 && n <= 36 && m >= 25 && m <= 36
% % Liaoning
%         elseif n >= 37 && n <= 50 && m >= 37 && m <= 50
% % Jilin
%         elseif n >= 51 && n <= 59 && m >= 51 && m <= 59
% % Heilongjiang
%         elseif n >= 60 && n <= 72 && m >= 60 && m <= 72
% % Shanghai
%         elseif n == 73 && m == 73
% % Jiangsu
%         elseif n >= 74 && n <= 86 && m >= 74 && m <= 86
% % Zhejiang
%         elseif n >= 87 && n <= 97 && m >= 87 && m <= 97
% % Anhui
%         elseif n >= 98 && n <= 113 && m >= 98 && m <= 113
% % Fujian
%         elseif n >= 114 && n <= 122 && m >= 114 && m <= 122
% % Jiangxi
%         elseif n >= 123 && n <= 133 && m >= 123 && m <= 133
% % Shandong
%         elseif n >= 134 && n <= 149 && m >= 134 && m <= 149
% % Henan
%         elseif n >= 150 && n <= 166 && m >= 150 && m <= 166
% % Hubei
%         elseif n >= 167 && n <= 179 && m >= 167 && m <= 179
% % Hunan
%         elseif n >= 180 && n <= 193 && m >= 180 && m <= 193
% % Guangdong
%         elseif n >= 194 && n <= 214 && m >= 194 && m <= 214
% % Guangxi
%         elseif n >= 215 && n <= 228 && m >= 215 && m <= 228
% % Hainan
%         elseif n >= 229 && n <= 232 && m >= 229 && m <= 232
% % Chongqing
%         elseif n == 233 && m == 233
% % Sichuan
%         elseif n >= 234 && n <= 254 && m >= 234 && m <= 254
% % Guizhou
%         elseif n >= 255 && n <= 263 && m >= 255 && m <= 263
% % Yunnan
%         elseif n >= 264 && n <= 279 && m >= 264 && m <= 279
% % Xizang
%         elseif n >= 280 && n <= 286 && m >= 280 && m <= 286
% % Shaanxi
%         elseif n >= 287 && n <= 296 && m >= 287 && m <= 296
% % Gansu
%         elseif n >= 297 && n<=310 && m >= 297 && m<=310
% % Qinghai
%         elseif n >= 311 && n <= 319 && m >= 311 && m <= 319
% % Ningxia
%         elseif n >= 319 && n <= 323 && m >= 319 && m <= 323
% % Xinjiang
%         elseif n >= 324 && n <= 337 && m >= 324 && m <= 337
% 
%         else
%             C_CAP = [C_CAP,
%                 delI_SLB_LFP_COT(n,m,s) == 0;
%                 delI_SLB_NCMH_COT(n,m,s) == 0;
%                 delI_SLB_NCMM_COT(n,m,s) == 0;
%                 delI_SLB_NCML_COT(n,m,s) == 0;
%                 delI_SLB_NCA_COT(n,m,s) == 0;
%                 delI_SLB_LMO_COT(n,m,s) == 0;
%                 ];
%         end
%     end 
% end


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
