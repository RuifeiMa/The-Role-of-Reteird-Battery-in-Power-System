function [result] = huansuan1(x)
%求投资成本的换算，x表示第几阶段，r表示换算后的投资成本
%   此处显示详细说明
result = 0;
for i=1:(35-5*x)
    result = result + 1.06^(-i);   
end
end

