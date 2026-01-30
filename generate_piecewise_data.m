function [capacity_pw_upper, cost_p_u_upper] = generate_piecewise_data(data,potential,province_num,I0)
    capacity_pw = zeros(province_num,8);
    cost_p_u = zeros(province_num,8);
    capacity_pw_upper = zeros(province_num,8);
    cost_p_u_upper = zeros(province_num,8);
    [row,~] = size(data);
    
    for i = 1:province_num
        cost_p_u(i,1) = data(1,2*i);
        capacity_pw(i,1) = data(1,2*i-1)*potential(i)/1000;
        q = 2   ;
        
        for j = 2:row
            if data(j,2*i) ~= data(j-1,2*i)
               capacity_pw(i,q) = data(j,2*i-1)*potential(i)/1000;
               cost_p_u(i,q) = data(j,2*i);
               q = q+1;
            else
                continue
            end
        end
        capacity_pw(i,q) = 1*potential(i)/1000;
    end
    for i = 1:7
            capacity_pw_upper(:,i)=capacity_pw(:,i+1)-capacity_pw(:,i); 
    end
    capacity_pw_upper(capacity_pw_upper<0)=0;
    capacity_pw_upper(capacity_pw_upper==1)=0;
    capacity_pw_upper(:,8)=I0(1:province_num);
    
    for i = 1:province_num
        for s = 1:7
            if capacity_pw_upper(i,s)-capacity_pw_upper(i,8)>0
                capacity_pw_upper(i,s)=capacity_pw_upper(i,s)-capacity_pw_upper(i,8);
                capacity_pw_upper(i,8)=0;
                break
            else
                capacity_pw_upper(i,8)=capacity_pw_upper(i,8)-capacity_pw_upper(i,s);
                capacity_pw_upper(i,s)=0;           
            end
            
        end
    end
    
    cost_p_u_upper = cost_p_u(:,1:7);
    
end

% 