%%% New battery 100%-40%
for s = 1:stage
    for prv = 1:province_num
        if I0(prv,8) > 0
            if prov_year_LFP_100_40(prv,1) > 0 && prov_year_LFP_100_40(prv,1) <= 5
                if s == 1
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/5;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                else
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-1,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/5;
                end
            elseif prov_year_LFP_100_40(prv,1) > 5 && prov_year_LFP_100_40(prv,1) <= 10
                if s == 2
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/10;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 2
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-2,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/10;
                end
            elseif prov_year_LFP_100_40(prv,1) > 10 && prov_year_LFP_100_40(prv,1) <= 15
                if s == 3
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/15;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 3
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-3,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/15;
                end
            elseif prov_year_LFP_100_40(prv,1) > 15 && prov_year_LFP_100_40(prv,1) <= 20
                if s == 4
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/20;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 4
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-4,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/20;
                end
            elseif prov_year_LFP_100_40(prv,1) > 20 && prov_year_LFP_100_40(prv,1) <= 25
                if s == 5
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/25;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 5
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-5,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/25;
                end
            elseif prov_year_LFP_100_40(prv,1) > 25 && prov_year_LFP_100_40(prv,1) <= 30
                if s == 6
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/30;
                    C_var = [C_var,delIR_es(prv,s,1) == I0(prv,8)/delI_es_conv(prv,1)];
                elseif s > 6
                    C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-6,1)];
                    delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/30;
                end
            end
        else
            if prov_year_LFP_100_40(prv,1) > 0 && prov_year_LFP_100_40(prv,1) <= 5
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-1,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/5;
            elseif prov_year_LFP_100_40(prv,1) > 5 && prov_year_LFP_100_40(prv,1) <= 10 && s > 2
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-2,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/10;
            elseif prov_year_LFP_100_40(prv,1) > 10 && prov_year_LFP_100_40(prv,1) <= 15 && s > 3
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-3,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/15;
            elseif prov_year_LFP_100_40(prv,1) > 15 && prov_year_LFP_100_40(prv,1) <= 20 && s > 4
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-4,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/20;
            elseif prov_year_LFP_100_40(prv,1) > 20 && prov_year_LFP_100_40(prv,1) <= 25 && s > 5
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-5,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_60(prv,1)/25;
            elseif prov_year_LFP_100_40(prv,1) > 25 && prov_year_LFP_100_40(prv,1) <= 30 && s > 6
                C_var = [C_var,delIR_es(prv,s,1) == delI_es(prv,s-6,1)];
                delI_es_conv(prv,1) = prov_year_LFP_100_40(prv,1)/30;
            end
        end
    end
end

RTE = RTE_LFP_100_40;
SOH_coeff = SOH_coeff_LFP_100_40;
N_es = N_LFP_100_40;
prov_year_es = prov_year_LFP_100_40;