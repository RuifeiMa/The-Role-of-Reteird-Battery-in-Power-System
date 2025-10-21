%%%%%%%%%%%%%%%%%%%%%%% 运输分配策略 %%%%%%%%%%%%%%%%%%%%%%
if s == 1
    C_CAP = [C_CAP,
        sum(delI_SLB_LFP(:,s,1)) == 0, % SLB LFP
        sum(delI_SLB_NCMH(:,s,1)) == 0, % SLB NCMH
        sum(delI_SLB_NCMM(:,s,1)) == 0, % SLB NCMM
        sum(delI_SLB_NCML(:,s,1)) == 0, % SLB NCML
        sum(delI_SLB_NCA(:,s,1)) == 0, % SLB NCA
        sum(delI_SLB_LMO(:,s,1)) == 0, % SLB NCA
        ];
else
    C_CAP = [C_CAP,
        sum(delI_SLB_LFP(:,s,1)) <= manucap(7,s), % SLB LFP
        sum(delI_SLB_NCMH(:,s,1)) <= manucap(8,s), % SLB NCMH
        sum(delI_SLB_NCMM(:,s,1)) <= manucap(9,s), % SLB NCMM
        sum(delI_SLB_NCML(:,s,1)) <= manucap(10,s), % SLB NCML
        sum(delI_SLB_NCA(:,s,1)) <= manucap(11,s), % SLB NCA
        sum(delI_SLB_LMO(:,s,1)) <= manucap(12,s), % SLB NCA
        ];
end
C_CAP = [C_CAP,
    sum(sum(delI_SLB_LFP_COT(:,:,s))) == sum(delI_SLB_LFP(:,s,1)),
    sum(sum(delI_SLB_NCMH_COT(:,:,s))) == sum(delI_SLB_NCMH(:,s,1)),
    sum(sum(delI_SLB_NCMM_COT(:,:,s))) == sum(delI_SLB_NCMM(:,s,1)),
    sum(sum(delI_SLB_NCML_COT(:,:,s))) == sum(delI_SLB_NCML(:,s,1)),
    sum(sum(delI_SLB_NCA_COT(:,:,s))) == sum(delI_SLB_NCA(:,s,1)),
    sum(sum(delI_SLB_LMO_COT(:,:,s))) == sum(delI_SLB_LMO(:,s,1)),
    ];

%%% t -> kWh
        %%%%%% 每个省每年的配置量&省间流通量 （市之间流通量）
        %%%%%% 目前交通限制先考虑全国的和不出省的，其他两个scenario后续看情况考虑

%%%%%%%%%%%%%%%%%%%%%%% 01 全国运输
        run TransPolicy01.m;

%%%%%%%%%%%%%%%%%%%%%%% 02 不出省运输限制
%         run TransPolicy02.m;

%%%%%%%%%%%%%%%%%%%%%%% 03 邻省流通限制
%         run TransPolicy03.m;

%%%%%%%%%%%%%%%%%%%%%%% 04 全国7个区域内流通限制
%         run TransPolicy04.m;
for city = 1:city_num
    C_CAP = [C_CAP,
    sum(delI_SLB_LFP_COT(city,:,s)) <= LFP_city(city,s);
    sum(delI_SLB_NCMH_COT(city,:,s)) <= NCMH_city(city,s);
    sum(delI_SLB_NCMM_COT(city,:,s)) <= NCMM_city(city,s);
    sum(delI_SLB_NCML_COT(city,:,s)) <= NCML_city(city,s);
    sum(delI_SLB_NCA_COT(city,:,s)) <= NCA_city(city,s);
    sum(delI_SLB_LMO_COT(city,:,s)) <= LMO_city(city,s);    
    ];
end

%%%%% Beijing
%         delIR_SLB_LFP_COT(1,1,s) == delI_SLB_LFP(1,s,1); = sdpvar(province_num,stage,'full');

% Beijing
                C_CAP = [C_CAP, 
                    prov_SLB_LFP_COT(1,s,1) == sum(delI_SLB_LFP_COT(:,1,s).*COT_city(:,1)),
                    prov_SLB_NCMH_COT(1,s,1) == sum(delI_SLB_NCMH_COT(:,1,s).*COT_city(:,1)),
                    prov_SLB_NCMM_COT(1,s,1) == sum(delI_SLB_NCMM_COT(:,1,s).*COT_city(:,1)),
                    prov_SLB_NCML_COT(1,s,1) == sum(delI_SLB_NCML_COT(:,1,s).*COT_city(:,1)),
                    prov_SLB_NCA_COT(1,s,1) == sum(delI_SLB_NCA_COT(:,1,s).*COT_city(:,1)),
                    prov_SLB_LMO_COT(1,s,1) == sum(delI_SLB_LMO_COT(:,1,s).*COT_city(:,1)),
                    ];

 % Tianjin
                C_CAP = [C_CAP, 
                    prov_SLB_LFP_COT(2,s,1) == sum(delI_SLB_LFP_COT(:,2,s).*COT_city(:,2)),
                    prov_SLB_NCMH_COT(2,s,1) == sum(delI_SLB_NCMH_COT(:,2,s).*COT_city(:,2)),
                    prov_SLB_NCMM_COT(2,s,1) == sum(delI_SLB_NCMM_COT(:,2,s).*COT_city(:,2)),
                    prov_SLB_NCML_COT(2,s,1) == sum(delI_SLB_NCML_COT(:,2,s).*COT_city(:,2)),
                    prov_SLB_NCA_COT(2,s,1) == sum(delI_SLB_NCA_COT(:,2,s).*COT_city(:,2)),
                    prov_SLB_LMO_COT(2,s,1) == sum(delI_SLB_LMO_COT(:,2,s).*COT_city(:,2)),
                    ];

% Hebei
%             for m = 3:13
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(3,s,1) == sum(sum(delI_SLB_LFP_COT(:,3:13,s).*COT_city(:,3:13))),
                prov_SLB_NCMH_COT(3,s,1) == sum(sum(delI_SLB_NCMH_COT(:,3:13,s).*COT_city(:,3:13))),
                prov_SLB_NCMM_COT(3,s,1) == sum(sum(delI_SLB_NCMM_COT(:,3:13,s).*COT_city(:,3:13))),
                prov_SLB_NCML_COT(3,s,1) == sum(sum(delI_SLB_NCML_COT(:,3:13,s).*COT_city(:,3:13))),
                prov_SLB_NCA_COT(3,s,1) == sum(sum(delI_SLB_NCA_COT(:,3:13,s).*COT_city(:,3:13))),
                prov_SLB_LMO_COT(3,s,1) == sum(sum(delI_SLB_LMO_COT(:,3:13,s).*COT_city(:,3:13))),
                ];
%             end

% Shanxi
%             for m = 14:24
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(4,s,1) == sum(sum(delI_SLB_LFP_COT(:,14:24,s).*COT_city(:,14:24))),
                prov_SLB_NCMH_COT(4,s,1) == sum(sum(delI_SLB_NCMH_COT(:,14:24,s).*COT_city(:,14:24))),
                prov_SLB_NCMM_COT(4,s,1) == sum(sum(delI_SLB_NCMM_COT(:,14:24,s).*COT_city(:,14:24))),
                prov_SLB_NCML_COT(4,s,1) == sum(sum(delI_SLB_NCML_COT(:,14:24,s).*COT_city(:,14:24))),
                prov_SLB_NCA_COT(4,s,1) == sum(sum(delI_SLB_NCA_COT(:,14:24,s).*COT_city(:,14:24))),
                prov_SLB_LMO_COT(4,s,1) == sum(sum(delI_SLB_LMO_COT(:,14:24,s).*COT_city(:,14:24))),
                ];
%             end
%         end

% Neimenggu
%             for m = 25:36
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(5,s,1) == sum(sum(delI_SLB_LFP_COT(:,25:36,s).*COT_city(:,25:36))),
                prov_SLB_NCMH_COT(5,s,1) == sum(sum(delI_SLB_NCMH_COT(:,25:36,s).*COT_city(:,25:36))),
                prov_SLB_NCMM_COT(5,s,1) == sum(sum(delI_SLB_NCMM_COT(:,25:36,s).*COT_city(:,25:36))),
                prov_SLB_NCML_COT(5,s,1) == sum(sum(delI_SLB_NCML_COT(:,25:36,s).*COT_city(:,25:36))),
                prov_SLB_NCA_COT(5,s,1) == sum(sum(delI_SLB_NCA_COT(:,25:36,s).*COT_city(:,25:36))),
                prov_SLB_LMO_COT(5,s,1) == sum(sum(delI_SLB_LMO_COT(:,25:36,s).*COT_city(:,25:36))),
                ];
%             end

        if province_num > 5
% Liaoning
%         for n = 37:50
%             for m = 37:50
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(6,s,1) == sum(sum(delI_SLB_LFP_COT(:,37:50,s).*COT_city(:,37:50))),
                prov_SLB_NCMH_COT(6,s,1) == sum(sum(delI_SLB_NCMH_COT(:,37:50,s).*COT_city(:,37:50))),
                prov_SLB_NCMM_COT(6,s,1) == sum(sum(delI_SLB_NCMM_COT(:,37:50,s).*COT_city(:,37:50))),
                prov_SLB_NCML_COT(6,s,1) == sum(sum(delI_SLB_NCML_COT(:,37:50,s).*COT_city(:,37:50))),
                prov_SLB_NCA_COT(6,s,1) == sum(sum(delI_SLB_NCA_COT(:,37:50,s).*COT_city(:,37:50))),
                prov_SLB_LMO_COT(6,s,1) == sum(sum(delI_SLB_LMO_COT(:,37:50,s).*COT_city(:,37:50))),
               ];
%             end
%         end


% Jilin
%         for n = 51:59
%             for m = 51:59
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(7,s,1) == sum(sum(delI_SLB_LFP_COT(:,51:59,s).*COT_city(:,51:59))),
                prov_SLB_NCMH_COT(7,s,1) == sum(sum(delI_SLB_NCMH_COT(:,51:59,s).*COT_city(:,51:59))),
                prov_SLB_NCMM_COT(7,s,1) == sum(sum(delI_SLB_NCMM_COT(:,51:59,s).*COT_city(:,51:59))),
                prov_SLB_NCML_COT(7,s,1) == sum(sum(delI_SLB_NCML_COT(:,51:59,s).*COT_city(:,51:59))),
                prov_SLB_NCA_COT(7,s,1) == sum(sum(delI_SLB_NCA_COT(:,51:59,s).*COT_city(:,51:59))),
                prov_SLB_LMO_COT(7,s,1) == sum(sum(delI_SLB_LMO_COT(:,51:59,s).*COT_city(:,51:59))),
               ];                
%             end
%         end

% Heilongjiang
%         for n = 60:72
%             for m = 60:72
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(8,s,1) == sum(sum(delI_SLB_LFP_COT(:,60:72,s).*COT_city(:,60:72))),
                prov_SLB_NCMH_COT(8,s,1) == sum(sum(delI_SLB_NCMH_COT(:,60:72,s).*COT_city(:,60:72))),
                prov_SLB_NCMM_COT(8,s,1) == sum(sum(delI_SLB_NCMM_COT(:,60:72,s).*COT_city(:,60:72))),
                prov_SLB_NCML_COT(8,s,1) == sum(sum(delI_SLB_NCML_COT(:,60:72,s).*COT_city(:,60:72))),
                prov_SLB_NCA_COT(8,s,1) == sum(sum(delI_SLB_NCA_COT(:,60:72,s).*COT_city(:,60:72))),
                prov_SLB_LMO_COT(8,s,1) == sum(sum(delI_SLB_LMO_COT(:,60:72,s).*COT_city(:,60:72))),
               ];
%             end
%         end

% Shanghai
%         for n = 73:73
%             for m = 73:73
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(9,s,1) == sum(delI_SLB_LFP_COT(:,73,s).*COT_city(:,73)),
                prov_SLB_NCMH_COT(9,s,1) == sum(delI_SLB_NCMH_COT(:,73,s).*COT_city(:,73)),
                prov_SLB_NCMM_COT(9,s,1) == sum(delI_SLB_NCMM_COT(:,73,s).*COT_city(:,73)),
                prov_SLB_NCML_COT(9,s,1) == sum(delI_SLB_NCML_COT(:,73,s).*COT_city(:,73)),
                prov_SLB_NCA_COT(9,s,1) == sum(delI_SLB_NCA_COT(:,73,s).*COT_city(:,73)),
                prov_SLB_LMO_COT(9,s,1) == sum(delI_SLB_LMO_COT(:,73,s).*COT_city(:,73)),
               ];
%             end
%         end

% Jiangsu
%         for n = 74:86
%             for m = 74:86
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(10,s,1) == sum(sum(delI_SLB_LFP_COT(:,74:86,s).*COT_city(:,74:86))),
                prov_SLB_NCMH_COT(10,s,1) == sum(sum(delI_SLB_NCMH_COT(:,74:86,s).*COT_city(:,74:86))),
                prov_SLB_NCMM_COT(10,s,1) == sum(sum(delI_SLB_NCMM_COT(:,74:86,s).*COT_city(:,74:86))),
                prov_SLB_NCML_COT(10,s,1) == sum(sum(delI_SLB_NCML_COT(:,74:86,s).*COT_city(:,74:86))),
                prov_SLB_NCA_COT(10,s,1) == sum(sum(delI_SLB_NCA_COT(:,74:86,s).*COT_city(:,74:86))),
                prov_SLB_LMO_COT(10,s,1) == sum(sum(delI_SLB_LMO_COT(:,74:86,s).*COT_city(:,74:86))),
               ];
%             end
%         end

% Zhejiang
%         for n = 87:97
%             for m = 87:97
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(11,s,1) == sum(sum(delI_SLB_LFP_COT(:,87:97,s).*COT_city(:,87:97))),
                prov_SLB_NCMH_COT(11,s,1) == sum(sum(delI_SLB_NCMH_COT(:,87:97,s).*COT_city(:,87:97))),
                prov_SLB_NCMM_COT(11,s,1) == sum(sum(delI_SLB_NCMM_COT(:,87:97,s).*COT_city(:,87:97))),
                prov_SLB_NCML_COT(11,s,1) == sum(sum(delI_SLB_NCML_COT(:,87:97,s).*COT_city(:,87:97))),
                prov_SLB_NCA_COT(11,s,1) == sum(sum(delI_SLB_NCA_COT(:,87:97,s).*COT_city(:,87:97))),
                prov_SLB_LMO_COT(11,s,1) == sum(sum(delI_SLB_LMO_COT(:,87:97,s).*COT_city(:,87:97))),
               ];
%           end
%         end

% Anhui
%         for n = 98:113
%             for m = 98:113
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(12,s,1) == sum(sum(delI_SLB_LFP_COT(:,98:113,s).*COT_city(:,98:113))),
                prov_SLB_NCMH_COT(12,s,1) == sum(sum(delI_SLB_NCMH_COT(:,98:113,s).*COT_city(:,98:113))),
                prov_SLB_NCMM_COT(12,s,1) == sum(sum(delI_SLB_NCMM_COT(:,98:113,s).*COT_city(:,98:113))),
                prov_SLB_NCML_COT(12,s,1) == sum(sum(delI_SLB_NCML_COT(:,98:113,s).*COT_city(:,98:113))),
                prov_SLB_NCA_COT(12,s,1) == sum(sum(delI_SLB_NCA_COT(:,98:113,s).*COT_city(:,98:113))),
                prov_SLB_LMO_COT(12,s,1) == sum(sum(delI_SLB_LMO_COT(:,98:113,s).*COT_city(:,98:113))),
               ];
%             end
%         end

% Fujian
%         for n = 114:122
%             for m = 114:122
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(13,s,1) == sum(sum(delI_SLB_LFP_COT(:,114:122,s).*COT_city(:,114:122))),
                prov_SLB_NCMH_COT(13,s,1) == sum(sum(delI_SLB_NCMH_COT(:,114:122,s).*COT_city(:,114:122))),
                prov_SLB_NCMM_COT(13,s,1) == sum(sum(delI_SLB_NCMM_COT(:,114:122,s).*COT_city(:,114:122))),
                prov_SLB_NCML_COT(13,s,1) == sum(sum(delI_SLB_NCML_COT(:,114:122,s).*COT_city(:,114:122))),
                prov_SLB_NCA_COT(13,s,1) == sum(sum(delI_SLB_NCA_COT(:,114:122,s).*COT_city(:,114:122))),
                prov_SLB_LMO_COT(13,s,1) == sum(sum(delI_SLB_LMO_COT(:,114:122,s).*COT_city(:,114:122))),
               ];
%             end
%         end

% Jiangxi
%         for n = 123:133
%             for m = 123:133
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(14,s,1) == sum(sum(delI_SLB_LFP_COT(:,123:133,s).*COT_city(:,123:133))),
                prov_SLB_NCMH_COT(14,s,1) == sum(sum(delI_SLB_NCMH_COT(:,123:133,s).*COT_city(:,123:133))),
                prov_SLB_NCMM_COT(14,s,1) == sum(sum(delI_SLB_NCMM_COT(:,123:133,s).*COT_city(:,123:133))),
                prov_SLB_NCML_COT(14,s,1) == sum(sum(delI_SLB_NCML_COT(:,123:133,s).*COT_city(:,123:133))),
                prov_SLB_NCA_COT(14,s,1) == sum(sum(delI_SLB_NCA_COT(:,123:133,s).*COT_city(:,123:133))),
                prov_SLB_LMO_COT(14,s,1) == sum(sum(delI_SLB_LMO_COT(:,123:133,s).*COT_city(:,123:133))),
               ];               
%             end
%         end

% Shandong
%         for n = 134:149
%             for m = 134:149
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(15,s,1) == sum(sum(delI_SLB_LFP_COT(:,134:149,s).*COT_city(:,134:149))),
                prov_SLB_NCMH_COT(15,s,1) == sum(sum(delI_SLB_NCMH_COT(:,134:149,s).*COT_city(:,134:149))),
                prov_SLB_NCMM_COT(15,s,1) == sum(sum(delI_SLB_NCMM_COT(:,134:149,s).*COT_city(:,134:149))),
                prov_SLB_NCML_COT(15,s,1) == sum(sum(delI_SLB_NCML_COT(:,134:149,s).*COT_city(:,134:149))),
                prov_SLB_NCA_COT(15,s,1) == sum(sum(delI_SLB_NCA_COT(:,134:149,s).*COT_city(:,134:149))),
                prov_SLB_LMO_COT(15,s,1) == sum(sum(delI_SLB_LMO_COT(:,134:149,s).*COT_city(:,134:149))),
               ];
%             end
%         end

% Henan
%         for n = 150:166
%             for m = 150:166
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(16,s,1) == sum(sum(delI_SLB_LFP_COT(:,150:166,s).*COT_city(:,150:166))),
                prov_SLB_NCMH_COT(16,s,1) == sum(sum(delI_SLB_NCMH_COT(:,150:166,s).*COT_city(:,150:166))),
                prov_SLB_NCMM_COT(16,s,1) == sum(sum(delI_SLB_NCMM_COT(:,150:166,s).*COT_city(:,150:166))),
                prov_SLB_NCML_COT(16,s,1) == sum(sum(delI_SLB_NCML_COT(:,150:166,s).*COT_city(:,150:166))),
                prov_SLB_NCA_COT(16,s,1) == sum(sum(delI_SLB_NCA_COT(:,150:166,s).*COT_city(:,150:166))),
                prov_SLB_LMO_COT(16,s,1) == sum(sum(delI_SLB_LMO_COT(:,150:166,s).*COT_city(:,150:166))),
               ];
%             end
%         end

% Hubei
%         for n = 167:179
%             for m = 167:179
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(17,s,1) == sum(sum(delI_SLB_LFP_COT(:,167:179,s).*COT_city(:,167:179))),
                prov_SLB_NCMH_COT(17,s,1) == sum(sum(delI_SLB_NCMH_COT(:,167:179,s).*COT_city(:,167:179))),
                prov_SLB_NCMM_COT(17,s,1) == sum(sum(delI_SLB_NCMM_COT(:,167:179,s).*COT_city(:,167:179))),
                prov_SLB_NCML_COT(17,s,1) == sum(sum(delI_SLB_NCML_COT(:,167:179,s).*COT_city(:,167:179))),
                prov_SLB_NCA_COT(17,s,1) == sum(sum(delI_SLB_NCA_COT(:,167:179,s).*COT_city(:,167:179))),
                prov_SLB_LMO_COT(17,s,1) == sum(sum(delI_SLB_LMO_COT(:,167:179,s).*COT_city(:,167:179))),
               ];
%             end
%         end

% Hunan
%         for n = 180:193
%             for m = 180:193
                C_CAP = [C_CAP,
                prov_SLB_LFP_COT(18,s,1) == sum(sum(delI_SLB_LFP_COT(:,180:193,s).*COT_city(:,180:193))),
                prov_SLB_NCMH_COT(18,s,1) == sum(sum(delI_SLB_NCMH_COT(:,180:193,s).*COT_city(:,180:193))),
                prov_SLB_NCMM_COT(18,s,1) == sum(sum(delI_SLB_NCMM_COT(:,180:193,s).*COT_city(:,180:193))),
                prov_SLB_NCML_COT(18,s,1) == sum(sum(delI_SLB_NCML_COT(:,180:193,s).*COT_city(:,180:193))),
                prov_SLB_NCA_COT(18,s,1) == sum(sum(delI_SLB_NCA_COT(:,180:193,s).*COT_city(:,180:193))),
                prov_SLB_LMO_COT(18,s,1) == sum(sum(delI_SLB_LMO_COT(:,180:193,s).*COT_city(:,180:193))),
               ];
%             end
%         end

% Guangdong
%         for n = 194:214
%             for m = 194:214
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(19,s,1) == sum(sum(delI_SLB_LFP_COT(:,194:214,s).*COT_city(:,194:214))),
                    prov_SLB_NCMH_COT(19,s,1) == sum(sum(delI_SLB_NCMH_COT(:,194:214,s).*COT_city(:,194:214))),
                    prov_SLB_NCMM_COT(19,s,1) == sum(sum(delI_SLB_NCMM_COT(:,194:214,s).*COT_city(:,194:214))),
                    prov_SLB_NCML_COT(19,s,1) == sum(sum(delI_SLB_NCML_COT(:,194:214,s).*COT_city(:,194:214))),
                    prov_SLB_NCA_COT(19,s,1) == sum(sum(delI_SLB_NCA_COT(:,194:214,s).*COT_city(:,194:214))),
                    prov_SLB_LMO_COT(19,s,1) == sum(sum(delI_SLB_LMO_COT(:,194:214,s).*COT_city(:,194:214))),
                    ];
%             end
%         end

% Guangxi
%         for n = 215:228
%             for m = 215:228
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(20,s,1) == sum(sum(delI_SLB_LFP_COT(:,215:228,s).*COT_city(:,215:228))),
                    prov_SLB_NCMH_COT(20,s,1) == sum(sum(delI_SLB_NCMH_COT(:,215:228,s).*COT_city(:,215:228))),
                    prov_SLB_NCMM_COT(20,s,1) == sum(sum(delI_SLB_NCMM_COT(:,215:228,s).*COT_city(:,215:228))),
                    prov_SLB_NCML_COT(20,s,1) == sum(sum(delI_SLB_NCML_COT(:,215:228,s).*COT_city(:,215:228))),
                    prov_SLB_NCA_COT(20,s,1) == sum(sum(delI_SLB_NCA_COT(:,215:228,s).*COT_city(:,215:228))),
                    prov_SLB_LMO_COT(20,s,1) == sum(sum(delI_SLB_LMO_COT(:,215:228,s).*COT_city(:,215:228))),
                    ];
%             end
%         end

% Hainan
%         for n = 229:232
%             for m = 229:232
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(21,s,1) == sum(sum(delI_SLB_LFP_COT(:,229:232,s).*COT_city(:,229:232))),
                    prov_SLB_NCMH_COT(21,s,1) == sum(sum(delI_SLB_NCMH_COT(:,229:232,s).*COT_city(:,229:232))),
                    prov_SLB_NCMM_COT(21,s,1) == sum(sum(delI_SLB_NCMM_COT(:,229:232,s).*COT_city(:,229:232))),
                    prov_SLB_NCML_COT(21,s,1) == sum(sum(delI_SLB_NCML_COT(:,229:232,s).*COT_city(:,229:232))),
                    prov_SLB_NCA_COT(21,s,1) == sum(sum(delI_SLB_NCA_COT(:,229:232,s).*COT_city(:,229:232))),
                    prov_SLB_LMO_COT(21,s,1) == sum(sum(delI_SLB_LMO_COT(:,229:232,s).*COT_city(:,229:232))),
                    ];
%             end
%         end

% Chongqing
%         for n = 233:233
%             for m = 233:233
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(22,s,1) == sum(delI_SLB_LFP_COT(:,233,s).*COT_city(:,233)),
                    prov_SLB_NCMH_COT(22,s,1) == sum(delI_SLB_NCMH_COT(:,233,s).*COT_city(:,233)),
                    prov_SLB_NCMM_COT(22,s,1) == sum(delI_SLB_NCMM_COT(:,233,s).*COT_city(:,233)),
                    prov_SLB_NCML_COT(22,s,1) == sum(delI_SLB_NCML_COT(:,233,s).*COT_city(:,233)),
                    prov_SLB_NCA_COT(22,s,1) == sum(delI_SLB_NCA_COT(:,233,s).*COT_city(:,233)),
                    prov_SLB_LMO_COT(22,s,1) == sum(delI_SLB_LMO_COT(:,233,s).*COT_city(:,233)),
                    ];
%             end
%         end

  % Sichuan
%         for n = 234:254
%             for m = 234:254
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(23,s,1) == sum(sum(delI_SLB_LFP_COT(:,234:254,s).*COT_city(:,234:254))),
                    prov_SLB_NCMH_COT(23,s,1) == sum(sum(delI_SLB_NCMH_COT(:,234:254,s).*COT_city(:,234:254))),
                    prov_SLB_NCMM_COT(23,s,1) == sum(sum(delI_SLB_NCMM_COT(:,234:254,s).*COT_city(:,234:254))),
                    prov_SLB_NCML_COT(23,s,1) == sum(sum(delI_SLB_NCML_COT(:,234:254,s).*COT_city(:,234:254))),
                    prov_SLB_NCA_COT(23,s,1) == sum(sum(delI_SLB_NCA_COT(:,234:254,s).*COT_city(:,234:254))),
                    prov_SLB_LMO_COT(23,s,1) == sum(sum(delI_SLB_LMO_COT(:,234:254,s).*COT_city(:,234:254))),
                    ];
%             end
%         end

% Guizhou
%         for n = 255:263
%             for m = 255:263
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(24,s,1) == sum(sum(delI_SLB_LFP_COT(:,255:263,s).*COT_city(:,255:263))),
                    prov_SLB_NCMH_COT(24,s,1) == sum(sum(delI_SLB_NCMH_COT(:,255:263,s).*COT_city(:,255:263))),
                    prov_SLB_NCMM_COT(24,s,1) == sum(sum(delI_SLB_NCMM_COT(:,255:263,s).*COT_city(:,255:263))),
                    prov_SLB_NCML_COT(24,s,1) == sum(sum(delI_SLB_NCML_COT(:,255:263,s).*COT_city(:,255:263))),
                    prov_SLB_NCA_COT(24,s,1) == sum(sum(delI_SLB_NCA_COT(:,255:263,s).*COT_city(:,255:263))),
                    prov_SLB_LMO_COT(24,s,1) == sum(sum(delI_SLB_LMO_COT(:,255:263,s).*COT_city(:,255:263))),
                    ];
%             end
%         end

% Yunnan
%         for n = 264:279
%             for m = 264:279
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(25,s,1) == sum(sum(delI_SLB_LFP_COT(:,264:279,s).*COT_city(:,264:279))),
                    prov_SLB_NCMH_COT(25,s,1) == sum(sum(delI_SLB_NCMH_COT(:,264:279,s).*COT_city(:,264:279))),
                    prov_SLB_NCMM_COT(25,s,1) == sum(sum(delI_SLB_NCMM_COT(:,264:279,s).*COT_city(:,264:279))),
                    prov_SLB_NCML_COT(25,s,1) == sum(sum(delI_SLB_NCML_COT(:,264:279,s).*COT_city(:,264:279))),
                    prov_SLB_NCA_COT(25,s,1) == sum(sum(delI_SLB_NCA_COT(:,264:279,s).*COT_city(:,264:279))),
                    prov_SLB_LMO_COT(25,s,1) == sum(sum(delI_SLB_LMO_COT(:,264:279,s).*COT_city(:,264:279))),
                    ];
%             end
%         end

% Xizang
%         for n = 280:286
%             for m = 280:286
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(26,s,1) == sum(sum(delI_SLB_LFP_COT(:,280:286,s).*COT_city(:,280:286))),
                    prov_SLB_NCMH_COT(26,s,1) == sum(sum(delI_SLB_NCMH_COT(:,280:286,s).*COT_city(:,280:286))),
                    prov_SLB_NCMM_COT(26,s,1) == sum(sum(delI_SLB_NCMM_COT(:,280:286,s).*COT_city(:,280:286))),
                    prov_SLB_NCML_COT(26,s,1) == sum(sum(delI_SLB_NCML_COT(:,280:286,s).*COT_city(:,280:286))),
                    prov_SLB_NCA_COT(26,s,1) == sum(sum(delI_SLB_NCA_COT(:,280:286,s).*COT_city(:,280:286))),
                    prov_SLB_LMO_COT(26,s,1) == sum(sum(delI_SLB_LMO_COT(:,280:286,s).*COT_city(:,280:286))),
                    ];
%             end
%         end

% Shaanxi
%         for n = 287:296
%             for m = 287:296
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(27,s,1) == sum(sum(delI_SLB_LFP_COT(:,287:296,s).*COT_city(:,287:296))),
                    prov_SLB_NCMH_COT(27,s,1) == sum(sum(delI_SLB_NCMH_COT(:,287:296,s).*COT_city(:,287:296))),
                    prov_SLB_NCMM_COT(27,s,1) == sum(sum(delI_SLB_NCMM_COT(:,287:296,s).*COT_city(:,287:296))),
                    prov_SLB_NCML_COT(27,s,1) == sum(sum(delI_SLB_NCML_COT(:,287:296,s).*COT_city(:,287:296))),
                    prov_SLB_NCA_COT(27,s,1) == sum(sum(delI_SLB_NCA_COT(:,287:296,s).*COT_city(:,287:296))),
                    prov_SLB_LMO_COT(27,s,1) == sum(sum(delI_SLB_LMO_COT(:,287:296,s).*COT_city(:,287:296))),
                    ];               
%             end
%         end

% Gansu
%         for n = 297:310
%             for m = 297:310
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(28,s,1) == sum(sum(delI_SLB_LFP_COT(:,297:310,s).*COT_city(:,297:310))),
                    prov_SLB_NCMH_COT(28,s,1) == sum(sum(delI_SLB_NCMH_COT(:,297:310,s).*COT_city(:,297:310))),
                    prov_SLB_NCMM_COT(28,s,1) == sum(sum(delI_SLB_NCMM_COT(:,297:310,s).*COT_city(:,297:310))),
                    prov_SLB_NCML_COT(28,s,1) == sum(sum(delI_SLB_NCML_COT(:,297:310,s).*COT_city(:,297:310))),
                    prov_SLB_NCA_COT(28,s,1) == sum(sum(delI_SLB_NCA_COT(:,297:310,s).*COT_city(:,297:310))),
                    prov_SLB_LMO_COT(28,s,1) == sum(sum(delI_SLB_LMO_COT(:,297:310,s).*COT_city(:,297:310))),
                    ];
%             end
%         end

% Qinghai
%         for n = 311:319
%             for m = 311:319
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(29,s,1) == sum(sum(delI_SLB_LFP_COT(:,311:319,s).*COT_city(:,311:319))),
                    prov_SLB_NCMH_COT(29,s,1) == sum(sum(delI_SLB_NCMH_COT(:,311:319,s).*COT_city(:,311:319))),
                    prov_SLB_NCMM_COT(29,s,1) == sum(sum(delI_SLB_NCMM_COT(:,311:319,s).*COT_city(:,311:319))),
                    prov_SLB_NCML_COT(29,s,1) == sum(sum(delI_SLB_NCML_COT(:,311:319,s).*COT_city(:,311:319))),
                    prov_SLB_NCA_COT(29,s,1) == sum(sum(delI_SLB_NCA_COT(:,311:319,s).*COT_city(:,311:319))),
                    prov_SLB_LMO_COT(29,s,1) == sum(sum(delI_SLB_LMO_COT(:,311:319,s).*COT_city(:,311:319))),
                    ];
%             end
%         end

% Ningxia
%         for n = 319:323
%             for m = 319:323
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(30,s,1) == sum(sum(delI_SLB_LFP_COT(:,319:323,s).*COT_city(:,319:323))),
                    prov_SLB_NCMH_COT(30,s,1) == sum(sum(delI_SLB_NCMH_COT(:,319:323,s).*COT_city(:,319:323))),
                    prov_SLB_NCMM_COT(30,s,1) == sum(sum(delI_SLB_NCMM_COT(:,319:323,s).*COT_city(:,319:323))),
                    prov_SLB_NCML_COT(30,s,1) == sum(sum(delI_SLB_NCML_COT(:,319:323,s).*COT_city(:,319:323))),
                    prov_SLB_NCA_COT(30,s,1) == sum(sum(delI_SLB_NCA_COT(:,319:323,s).*COT_city(:,319:323))),
                    prov_SLB_LMO_COT(30,s,1) == sum(sum(delI_SLB_LMO_COT(:,319:323,s).*COT_city(:,319:323))),
                    ];
%             end
%         end

% Xinjiang
%         for n = 324:337
%             for m = 324:337
                C_CAP = [C_CAP,
                    prov_SLB_LFP_COT(31,s,1) == sum(sum(delI_SLB_LFP_COT(:,324:337,s).*COT_city(:,324:337))),
                    prov_SLB_NCMH_COT(31,s,1) == sum(sum(delI_SLB_NCMH_COT(:,324:337,s).*COT_city(:,324:337))),
                    prov_SLB_NCMM_COT(31,s,1) == sum(sum(delI_SLB_NCMM_COT(:,324:337,s).*COT_city(:,324:337))),
                    prov_SLB_NCML_COT(31,s,1) == sum(sum(delI_SLB_NCML_COT(:,324:337,s).*COT_city(:,324:337))),
                    prov_SLB_NCA_COT(31,s,1) == sum(sum(delI_SLB_NCA_COT(:,324:337,s).*COT_city(:,324:337))),
                    prov_SLB_LMO_COT(31,s,1) == sum(sum(delI_SLB_LMO_COT(:,324:337,s).*COT_city(:,324:337))),
                    ];
%             end
%         end

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
