

%%%%% 从第二阶段起，New battery & PHS 的装置规模设为 0，只有 SLB 作为 energy storage
for s = 2:stage
    C_CAP = [C_CAP,
        sum(delI_es(:,s,1)) == 0, % BESS        
        sum(delI_ps(:,s,1)) == 0, % PS
        ];
end

%%%%% 从第二阶段起，New battery 的装置规模设为 0，只有 SLB & PHS 作为 energy storage
% for s = 2:stage
%     C_CAP = [C_CAP,
%         sum(delI_es(:,s,1)) == 0, % BESS
%         ];
% end

%%%%% 从第二阶段起，PHS 的装置规模设为 0，只有 New battery & SLB 作为 energy storage
% for s = 2:stage
%     C_CAP = [C_CAP,        
%         sum(delI_ps(:,s,1)) == 0, % PS
%         ];
% end