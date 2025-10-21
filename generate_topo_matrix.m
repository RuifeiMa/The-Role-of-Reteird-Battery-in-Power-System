function [AC_result,DC_result,line_cost_AC,line_cost_DC,loss_AC,loss_DC,MAT_AC,MAT_DC,candidate_AC,candidate_DC] = generate_topo_matrix(data,index_province,province_num)
[n,~] = size(data);
AC_result = zeros(province_num);
DC_result = zeros(province_num);
line_cost_AC = zeros(1,province_num,province_num);
line_cost_DC = zeros(1,province_num,province_num);
loss_AC = zeros(province_num);
loss_DC = zeros(province_num);
MAT_AC = zeros(province_num);
MAT_DC = zeros(province_num);
candidate_AC = zeros(province_num);
candidate_DC = zeros(province_num);
% cmf_AC = zeros(province_num,province_num,5);
% cmf_DC = zeros(province_num,province_num,5);
for i=1:n
    try
        if data{i,5}{1} == 'AC'
            if data{i,3} ~= 0
                AC_result(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,3}/1000;
                loss_AC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,9};
            end
            if data{i,4} ~=0
                candidate_AC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,4}/1000;
                line_cost_AC(1,index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,6}*1000;
                loss_AC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,9};
            end
            MAT_AC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,4};
%             for s = 1:6
%                 cmf_AC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1}),s) = data{i,8+s};
%             end
        elseif data{i,5}{1} == 'DC'
            if data{i,3} ~= 0
                DC_result(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,3}/1000;
                loss_DC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,9};
            end
            if data{i,4} ~=0
                candidate_DC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,4}/1000;
                line_cost_DC(1,index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,6}*1000;
                loss_DC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,9};
            end
            MAT_DC(index_province.(data{i,1}{1}),index_province.(data{i,2}{1})) = data{i,4};
        end
    catch
        continue
    end
end

end
