function [Sparse_AC_matrix] = sparse_method(AC_matrix,province_num)
    if sum(sum(AC_matrix)) ~=0       %这个判别有什么用呢？如果为0其实没有意义
        Sparse_AC_o = sparse(AC_matrix);  %这个其实并不是实际拿来用的，下面的那个find用find（AC_matrix）应该也是一样的效果，不过这个的好处是可以用来作对照，看看后面的计算结果对不对
        ls_AC = [find(Sparse_AC_o ~=0)];
        [len_AC,~] = size(ls_AC);
        
        % existing lines sparse
        for num_AC = 1:len_AC
            % 第一列存行数,第二列存列数
            if mod(ls_AC(num_AC,1),province_num) ~= 0
                Sparse_AC_matrix(num_AC,1) = mod(ls_AC(num_AC,1),province_num);
                Sparse_AC_matrix(num_AC,2) = floor(ls_AC(num_AC,1)/province_num) +1;
            elseif mod(ls_AC(num_AC,1),province_num) == 0
                Sparse_AC_matrix(num_AC,1) = province_num;
                Sparse_AC_matrix(num_AC,2) = floor(ls_AC(num_AC,1)/province_num);
            end
                % 第三列存capacity
            Sparse_AC_matrix(num_AC,3) = AC_matrix(Sparse_AC_matrix(num_AC,1),Sparse_AC_matrix(num_AC,2));
        end
    else
      Sparse_AC_matrix =  0;
    end
end
