
%%%%%%%%%% 02 电池在规划时考虑40%SOH回收，但在实际使用时考虑到安全问题提前回收，如60%，80%等
%      C_CAP = [C_CAP,
%         I_es == rI_es, 
%         I_SLB_LFP == rI_SLB_LFP, 
%         I_SLB_NCMH == rI_SLB_NCMH,
%         I_SLB_NCMM == rI_SLB_NCMM,
%         I_SLB_NCML == rI_SLB_NCML,
%         I_SLB_NCA == rI_SLB_NCA,
%         I_SLB_LMO == rI_SLB_LMO,
%         ];

% for prv = 1:province_num
%     for s = 1:stage
%         C_CAP = [C_CAP,
%             delI_es(prv,s,1) == rdelI_es(prv,s,1),
%             delI_SLB_LFP(prv,s,1) == rdelI_SLB_LFP(prv,s,1),
%             delI_SLB_NCMH(prv,s,1) == rdelI_SLB_NCMH(prv,s,1),
%             delI_SLB_NCMM(prv,s,1) == rdelI_SLB_NCMM(prv,s,1),
%             delI_SLB_NCML(prv,s,1) == rdelI_SLB_NCML(prv,s,1),
%             delI_SLB_NCA(prv,s,1) == rdelI_SLB_NCA(prv,s,1),
%             delI_SLB_LMO(prv,s,1) == rdelI_SLB_LMO(prv,s,1),
%             
%             ];
%     end
% end
C_CAP = [C_CAP,
    delI_es == rdelI_es,
    delI_SLB_LFP == rdelI_SLB_LFP,
    delI_SLB_NCMH == rdelI_SLB_NCMH,
    delI_SLB_NCMM == rdelI_SLB_NCMM,
    delI_SLB_NCML == rdelI_SLB_NCML,
    delI_SLB_NCA == rdelI_SLB_NCA,
    delI_SLB_LMO == rdelI_SLB_LMO,
    ];

C_CAP = [C_CAP,
    delI_SLB_LFP_COT == rdelI_SLB_LFP_COT,
    delI_SLB_NCMH_COT == rdelI_SLB_NCMH_COT,
    delI_SLB_NCMM_COT == rdelI_SLB_NCMM_COT,
    delI_SLB_NCML_COT == rdelI_SLB_NCML_COT,
    delI_SLB_NCA_COT == rdelI_SLB_NCA_COT,
    delI_SLB_LMO_COT == rdelI_SLB_LMO_COT,
    ];

%         I_es = rI_es, 
%         I_SLB_LFP = rI_SLB_LFP, 
%         I_SLB_NCMH = rI_SLB_NCMH,
%         I_SLB_NCMM = rI_SLB_NCMM,
%         I_SLB_NCML = rI_SLB_NCML,
%         I_SLB_NCA = rI_SLB_NCA,
%         I_SLB_LMO = rI_SLB_LMO,
%         


