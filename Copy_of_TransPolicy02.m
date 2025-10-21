
%%%%% Beijing
%         delIR_SLB_LFP_COT(1,1,s) == delI_SLB_LFP(1,s,1);
for s = 1:stage
for n = 1:city_num
    for m = 1:city_num
        if n == 1 && m == 1
                C_CAP = [C_CAP,
                delI_SLB_LFP(1,s,1) == delI_SLB_LFP(1,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(1,s,1) == delI_SLB_NCMH(1,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(1,s,1) == delI_SLB_NCMM(1,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(1,s,1) == delI_SLB_NCML(1,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(1,s,1) == delI_SLB_NCA(1,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(1,s,1) == delI_SLB_LMO(1,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];

        elseif n == 2 && m == 2
                C_CAP = [C_CAP,
                delI_SLB_LFP(2,s,1) == delI_SLB_LFP(2,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(2,s,1) == delI_SLB_NCMH(2,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(2,s,1) == delI_SLB_NCMM(2,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(2,s,1) == delI_SLB_NCML(2,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(2,s,1) == delI_SLB_NCA(2,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(2,s,1) == delI_SLB_LMO(2,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];
            
% Hebei
        elseif n >= 3 && n <= 13 && m >= 3 && m <= 13
                C_CAP = [C_CAP,
                delI_SLB_LFP(3,s,1) == delI_SLB_LFP(3,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(3,s,1) == delI_SLB_NCMH(3,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(3,s,1) == delI_SLB_NCMM(3,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(3,s,1) == delI_SLB_NCML(3,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(3,s,1) == delI_SLB_NCA(3,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(3,s,1) == delI_SLB_LMO(3,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];
            
% Shanxi
        elseif n >= 14 && n <= 24 && m >= 14 && m <= 24
                C_CAP = [C_CAP,
                delI_SLB_LFP(4,s,1) == delI_SLB_LFP(4,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(4,s,1) == delI_SLB_NCMH(4,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(4,s,1) == delI_SLB_NCMM(4,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(4,s,1) == delI_SLB_NCML(4,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(4,s,1) == delI_SLB_NCA(4,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(4,s,1) == delI_SLB_LMO(4,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];

% Neimenggu
        elseif n >= 25 && n <= 36 && m >= 25 && m <= 36
                C_CAP = [C_CAP,
                delI_SLB_LFP(5,s,1) == delI_SLB_LFP(5,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(5,s,1) == delI_SLB_NCMH(5,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(5,s,1) == delI_SLB_NCMM(5,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(5,s,1) == delI_SLB_NCML(5,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(5,s,1) == delI_SLB_NCA(5,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(5,s,1) == delI_SLB_LMO(5,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];

% Liaoning
        elseif n >= 37 && n <= 50 && m >= 37 && m <= 50
                C_CAP = [C_CAP,
                delI_SLB_LFP(6,s,1) == delI_SLB_LFP(6,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(6,s,1) == delI_SLB_NCMH(6,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(6,s,1) == delI_SLB_NCMM(6,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(6,s,1) == delI_SLB_NCML(6,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(6,s,1) == delI_SLB_NCA(6,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(6,s,1) == delI_SLB_LMO(6,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Jilin
        elseif n >= 51 && n <= 59 && m >= 51 && m <= 59
                C_CAP = [C_CAP,
                delI_SLB_LFP(7,s,1) == delI_SLB_LFP(7,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(7,s,1) == delI_SLB_NCMH(7,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(7,s,1) == delI_SLB_NCMM(7,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(7,s,1) == delI_SLB_NCML(7,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(7,s,1) == delI_SLB_NCA(7,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(7,s,1) == delI_SLB_LMO(7,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Heilongjiang
        elseif n >= 60 && n <= 72 && m >= 60 && m <= 72
                C_CAP = [C_CAP,
                delI_SLB_LFP(8,s,1) == delI_SLB_LFP(8,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(8,s,1) == delI_SLB_NCMH(8,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(8,s,1) == delI_SLB_NCMM(8,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(8,s,1) == delI_SLB_NCML(8,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(8,s,1) == delI_SLB_NCA(8,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(8,s,1) == delI_SLB_LMO(8,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Shanghai
        elseif n == 73 && m == 73
                C_CAP = [C_CAP,
                delI_SLB_LFP(9,s,1) == delI_SLB_LFP(9,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(9,s,1) == delI_SLB_NCMH(9,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(9,s,1) == delI_SLB_NCMM(9,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(9,s,1) == delI_SLB_NCML(9,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(9,s,1) == delI_SLB_NCA(9,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(9,s,1) == delI_SLB_LMO(9,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Jiangsu
        elseif n >= 74 && n <= 86 && m >= 74 && m <= 86
                C_CAP = [C_CAP,
                delI_SLB_LFP(10,s,1) == delI_SLB_LFP(10,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(10,s,1) == delI_SLB_NCMH(10,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(10,s,1) == delI_SLB_NCMM(10,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(10,s,1) == delI_SLB_NCML(10,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(10,s,1) == delI_SLB_NCA(10,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(10,s,1) == delI_SLB_LMO(10,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Zhejiang
        elseif n >= 87 && n <= 97 && m >= 87 && m <= 97
                C_CAP = [C_CAP,
                delI_SLB_LFP(11,s,1) == delI_SLB_LFP(11,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(11,s,1) == delI_SLB_NCMH(11,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(11,s,1) == delI_SLB_NCMM(11,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(11,s,1) == delI_SLB_NCML(11,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(11,s,1) == delI_SLB_NCA(11,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(11,s,1) == delI_SLB_LMO(11,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Anhui
        elseif n >= 98 && n <= 113 && m >= 98 && m <= 113
                C_CAP = [C_CAP,
                delI_SLB_LFP(12,s,1) == delI_SLB_LFP(12,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(12,s,1) == delI_SLB_NCMH(12,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(12,s,1) == delI_SLB_NCMM(12,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(12,s,1) == delI_SLB_NCML(12,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(12,s,1) == delI_SLB_NCA(12,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(12,s,1) == delI_SLB_LMO(12,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Fujian
        elseif n >= 114 && n <= 122 && m >= 114 && m <= 122
                C_CAP = [C_CAP,
                delI_SLB_LFP(13,s,1) == delI_SLB_LFP(13,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(13,s,1) == delI_SLB_NCMH(13,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(13,s,1) == delI_SLB_NCMM(13,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(13,s,1) == delI_SLB_NCML(13,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(13,s,1) == delI_SLB_NCA(13,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(13,s,1) == delI_SLB_LMO(13,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Jiangxi
        elseif n >= 123 && n <= 133 && m >= 123 && m <= 133
                C_CAP = [C_CAP,
                delI_SLB_LFP(14,s,1) == delI_SLB_LFP(14,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(14,s,1) == delI_SLB_NCMH(14,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(14,s,1) == delI_SLB_NCMM(14,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(14,s,1) == delI_SLB_NCML(14,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(14,s,1) == delI_SLB_NCA(14,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(14,s,1) == delI_SLB_LMO(14,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Shandong
        elseif n >= 134 && n <= 149 && m >= 134 && m <= 149
                C_CAP = [C_CAP,
                delI_SLB_LFP(15,s,1) == delI_SLB_LFP(15,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(15,s,1) == delI_SLB_NCMH(15,s,1)+delI_SLB_NCMH_COT(n,m,s),
                delI_SLB_NCMM(15,s,1) == delI_SLB_NCMM(15,s,1)+delI_SLB_NCMM_COT(n,m,s),
                delI_SLB_NCML(15,s,1) == delI_SLB_NCML(15,s,1)+delI_SLB_NCML_COT(n,m,s),
                delI_SLB_NCA(15,s,1) == delI_SLB_NCA(15,s,1)+delI_SLB_NCA_COT(n,m,s),
                delI_SLB_LMO(15,s,1) == delI_SLB_LMO(15,s,1)+delI_SLB_LMO_COT(n,m,s),
                ];               

% Henan
        elseif n >= 150 && n <= 166 && m >= 150 && m <= 166
                C_CAP = [C_CAP,
                delI_SLB_LFP(16,s,1) == delI_SLB_LFP(16,s,1)+delI_SLB_LFP_COT(n,m,s),
                delI_SLB_NCMH(16,s,1) == delI_SLB_NCMH(16,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(16,s,1) == delI_SLB_NCMM(16,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(16,s,1) == delI_SLB_NCML(16,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(16,s,1) == delI_SLB_NCA(16,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(16,s,1) == delI_SLB_LMO(16,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Hubei
        elseif n >= 167 && n <= 179 && m >= 167 && m <= 179
                C_CAP = [C_CAP,
                delI_SLB_LFP(17,s,1) == delI_SLB_LFP(17,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(17,s,1) == delI_SLB_NCMH(17,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(17,s,1) == delI_SLB_NCMM(17,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(17,s,1) == delI_SLB_NCML(17,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(17,s,1) == delI_SLB_NCA(17,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(17,s,1) == delI_SLB_LMO(17,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Hunan
        elseif n >= 180 && n <= 193 && m >= 180 && m <= 193
                C_CAP = [C_CAP,
                delI_SLB_LFP(18,s,1) == delI_SLB_LFP(18,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(18,s,1) == delI_SLB_NCMH(18,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(18,s,1) == delI_SLB_NCMM(18,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(18,s,1) == delI_SLB_NCML(18,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(18,s,1) == delI_SLB_NCA(18,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(18,s,1) == delI_SLB_LMO(18,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Guangdong
        elseif n >= 194 && n <= 214 && m >= 194 && m <= 214
                C_CAP = [C_CAP,
                delI_SLB_LFP(19,s,1) == delI_SLB_LFP(19,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(19,s,1) == delI_SLB_NCMH(19,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(19,s,1) == delI_SLB_NCMM(19,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(19,s,1) == delI_SLB_NCML(19,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(19,s,1) == delI_SLB_NCA(19,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(19,s,1) == delI_SLB_LMO(19,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];      

% Guangxi
        elseif n >= 215 && n <= 228 && m >= 215 && m <= 228
                C_CAP = [C_CAP,
                delI_SLB_LFP(20,s,1) == delI_SLB_LFP(20,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(20,s,1) == delI_SLB_NCMH(20,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(20,s,1) == delI_SLB_NCMM(20,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(20,s,1) == delI_SLB_NCML(20,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(20,s,1) == delI_SLB_NCA(20,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(20,s,1) == delI_SLB_LMO(20,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Hainan
        elseif n >= 229 && n <= 232 && m >= 229 && m <= 232
                C_CAP = [C_CAP,
                delI_SLB_LFP(21,s,1) == delI_SLB_LFP(21,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(21,s,1) == delI_SLB_NCMH(21,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(21,s,1) == delI_SLB_NCMM(21,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(21,s,1) == delI_SLB_NCML(21,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(21,s,1) == delI_SLB_NCA(21,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(21,s,1) == delI_SLB_LMO(21,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Chongqing
        elseif n == 233 && m == 233
                C_CAP = [C_CAP,
                delI_SLB_LFP(22,s,1) == delI_SLB_LFP(22,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(22,s,1) == delI_SLB_NCMH(22,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(22,s,1) == delI_SLB_NCMM(22,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(22,s,1) == delI_SLB_NCML(22,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(22,s,1) == delI_SLB_NCA(22,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(22,s,1) == delI_SLB_LMO(22,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

  % Sichuan
        elseif n >= 234 && n <= 254 && m >= 234 && m <= 254
                C_CAP = [C_CAP,
                delI_SLB_LFP(23,s,1) == delI_SLB_LFP(23,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(23,s,1) == delI_SLB_NCMH(23,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(23,s,1) == delI_SLB_NCMM(23,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(23,s,1) == delI_SLB_NCML(23,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(23,s,1) == delI_SLB_NCA(23,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(23,s,1) == delI_SLB_LMO(23,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Guizhou
        elseif n >= 255 && n <= 263 && m >= 255 && m <= 263
                C_CAP = [C_CAP,
                delI_SLB_LFP(24,s,1) == delI_SLB_LFP(24,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(24,s,1) == delI_SLB_NCMH(24,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(24,s,1) == delI_SLB_NCMM(24,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(24,s,1) == delI_SLB_NCML(24,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(24,s,1) == delI_SLB_NCA(24,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(24,s,1) == delI_SLB_LMO(24,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Yunnan
        elseif n >= 264 && n <= 279 && m >= 264 && m <= 279
                C_CAP = [C_CAP,
                delI_SLB_LFP(25,s,1) == delI_SLB_LFP(25,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(25,s,1) == delI_SLB_NCMH(25,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(25,s,1) == delI_SLB_NCMM(25,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(25,s,1) == delI_SLB_NCML(25,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(25,s,1) == delI_SLB_NCA(25,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(25,s,1) == delI_SLB_LMO(25,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Xizang
        elseif n >= 280 && n <= 286 && m >= 280 && m <= 286
                C_CAP = [C_CAP,
                delI_SLB_LFP(26,s,1) == delI_SLB_LFP(26,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(26,s,1) == delI_SLB_NCMH(26,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(26,s,1) == delI_SLB_NCMM(26,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(26,s,1) == delI_SLB_NCML(26,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(26,s,1) == delI_SLB_NCA(26,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(26,s,1) == delI_SLB_LMO(26,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Shaanxi
        elseif n >= 287 && n <= 296 && m >= 287 && m <= 296
                C_CAP = [C_CAP,
                delI_SLB_LFP(27,s,1) == delI_SLB_LFP(27,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(27,s,1) == delI_SLB_NCMH(27,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(27,s,1) == delI_SLB_NCMM(27,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(27,s,1) == delI_SLB_NCML(27,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(27,s,1) == delI_SLB_NCA(27,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(27,s,1) == delI_SLB_LMO(27,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Gansu
        elseif n >= 297 && n<=310 && m >= 297 && m<=310
                C_CAP = [C_CAP,
                delI_SLB_LFP(28,s,1) == delI_SLB_LFP(28,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(28,s,1) == delI_SLB_NCMH(28,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(28,s,1) == delI_SLB_NCMM(28,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(28,s,1) == delI_SLB_NCML(28,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(28,s,1) == delI_SLB_NCA(28,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(28,s,1) == delI_SLB_LMO(28,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Qinghai
        elseif n >= 311 && n <= 319 && m >= 311 && m <= 319
                C_CAP = [C_CAP,
                delI_SLB_LFP(29,s,1) == delI_SLB_LFP(29,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(29,s,1) == delI_SLB_NCMH(29,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(29,s,1) == delI_SLB_NCMM(29,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(29,s,1) == delI_SLB_NCML(29,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(29,s,1) == delI_SLB_NCA(29,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(29,s,1) == delI_SLB_LMO(29,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Ningxia
        elseif n >= 319 && n <= 323 && m >= 319 && m <= 323
                C_CAP = [C_CAP,
                delI_SLB_LFP(30,s,1) == delI_SLB_LFP(30,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(30,s,1) == delI_SLB_NCMH(30,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(30,s,1) == delI_SLB_NCMM(30,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(30,s,1) == delI_SLB_NCML(30,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(30,s,1) == delI_SLB_NCA(30,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(30,s,1) == delI_SLB_LMO(30,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];               

% Xinjiang
        elseif n >= 324 && n <= 337 && m >= 324 && m <= 337
                C_CAP = [C_CAP,
                delI_SLB_LFP(31,s,1) == delI_SLB_LFP(31,s,1)+delI_SLB_LFP_COT(n,m,s);
                delI_SLB_NCMH(31,s,1) == delI_SLB_NCMH(31,s,1)+delI_SLB_NCMH_COT(n,m,s);
                delI_SLB_NCMM(31,s,1) == delI_SLB_NCMM(31,s,1)+delI_SLB_NCMM_COT(n,m,s);
                delI_SLB_NCML(31,s,1) == delI_SLB_NCML(31,s,1)+delI_SLB_NCML_COT(n,m,s);
                delI_SLB_NCA(31,s,1) == delI_SLB_NCA(31,s,1)+delI_SLB_NCA_COT(n,m,s);
                delI_SLB_LMO(31,s,1) == delI_SLB_LMO(31,s,1)+delI_SLB_LMO_COT(n,m,s);
                ];     
        else
            C_CAP = [C_CAP,
                delI_SLB_LFP_COT(n,m,s) == 0;
                delI_SLB_NCMH_COT(n,m,s) == 0;
                delI_SLB_NCMM_COT(n,m,s) == 0;
                delI_SLB_NCML_COT(n,m,s) == 0;
                delI_SLB_NCA_COT(n,m,s) == 0;
                delI_SLB_LMO_COT(n,m,s) == 0;
                ];
        end
    end
end

        for prv = 1:province_num
            C_CAP = [C_CAP,
                delI_SLB_LFP(prv,s,1) <= SLB_LFP(prv,s),
                delI_SLB_NCMH(prv,s,1) <= SLB_NCMH(prv,s),
                delI_SLB_NCMM(prv,s,1) <= SLB_NCMM(prv,s),
                delI_SLB_NCML(prv,s,1) <= SLB_NCML(prv,s),
                delI_SLB_NCA(prv,s,1) <= SLB_NCA(prv,s),
                delI_SLB_LMO(prv,s,1) <= SLB_LMO(prv,s),
                ];
        end
end