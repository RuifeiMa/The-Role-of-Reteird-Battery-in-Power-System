%%% New battery 100%-80%

for s = 1:stage
    for prv = 1:province_num
        if I0(prv,8) > 0
            if prov_year_LFP_100_80(prv,1) > 0 && prov_year_LFP_100_80(prv,1) <= 5
                if s == 1
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/5;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                else
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-1,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/5;
                end
            elseif prov_year_LFP_100_80(prv,1) > 5 && prov_year_LFP_100_80(prv,1) <= 10
                if s == 2
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/10;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 2
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-2,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/10;
                end
            elseif prov_year_LFP_100_80(prv,1) > 10 && prov_year_LFP_100_80(prv,1) <= 15
                if s == 3
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/15;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 3
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-3,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/15;
                end
            end
        else
            if prov_year_LFP_100_80(prv,1) > 0 && prov_year_LFP_100_80(prv,1) <= 5
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-1,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/5;
            elseif prov_year_LFP_100_80(prv,1) > 5 && prov_year_LFP_100_80(prv,1) <= 10 && s > 2
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-2,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/10;
            elseif prov_year_LFP_100_80(prv,1) > 10 && prov_year_LFP_100_80(prv,1) <= 15 && s > 3
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-3,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_80(prv,1)/15;
            end
        end
    end
end
RTE = RTE_LFP_100_80;
SOH_coeff = SOH_coeff_LFP_100_80;
N_es = N_LFP_100_80;
prov_year_es = prov_year_LFP_100_80;
