
% city_name = num2str(337:1);
city_name = readlines('city_name.txt');
city_longi_lati = readmatrix('city_longi_lati.txt');
city_COT_num = 337*337;
for i = 1:city_COT_num
    city_ = ceil(i/337);
    city_COT_name2(i,:) = city_name(city_,:);
    city_COT_longi_lati2(i,:) = city_longi_lati(city_,:);
end

city_COT_longi_lati = city_longi_lati;
city_COT_name = city_name;
for i = 1:336
    city_COT_name = [city_COT_name;city_name];
    city_COT_longi_lati = [city_COT_longi_lati;city_longi_lati];
end

City_origin_2030 = 'Origin';
City_destin_2030 = 'Destination';
City_x1_y1_2030 = [1,1];
City_x2_y2_2030 = [2,2];
City_rdel_SLB_COT_2030 = 0;

City_origin_2040 = 'Origin';
City_destin_2040 = 'Destination';
City_x1_y1_2040 = [1,1];
City_x2_y2_2040 = [2,2];
City_rdel_SLB_COT_2040 = 0;

City_origin_2050 = 'Origin';
City_destin_2050 = 'Destination';
City_x1_y1_2050 = [1,1];
City_x2_y2_2050 = [2,2];
City_rdel_SLB_COT_2050 = 0;
for i = 1:city_COT_num
    if rdel_SLB_COT_2030(i,1) > 0
        City_origin_2030 = [City_origin_2030;city_COT_name(i,:)];
        City_destin_2030 = [City_destin_2030;city_COT_name2(i,:)];
        City_x1_y1_2030 = [City_x1_y1_2030;city_COT_longi_lati(i,:)];
        City_x2_y2_2030 = [City_x2_y2_2030;city_COT_longi_lati2(i,:)];
        City_rdel_SLB_COT_2030 = [City_rdel_SLB_COT_2030;rdel_SLB_COT_2030(i,1)];
    end
    if rdel_SLB_COT_2040(i,1) > 0
        City_origin_2040 = [City_origin_2040;city_COT_name(i,:)];
        City_destin_2040 = [City_destin_2040;city_COT_name2(i,:)];
        City_x1_y1_2040 = [City_x1_y1_2040;city_COT_longi_lati(i,:)];
        City_x2_y2_2040 = [City_x2_y2_2040;city_COT_longi_lati2(i,:)];
        City_rdel_SLB_COT_2040 = [City_rdel_SLB_COT_2040;rdel_SLB_COT_2040(i,1)];
    end
    if rdel_SLB_COT_2050(i,1) > 0
        City_origin_2050 = [City_origin_2050;city_COT_name(i,:)];
        City_destin_2050 = [City_destin_2050;city_COT_name2(i,:)];
        City_x1_y1_2050 = [City_x1_y1_2050;city_COT_longi_lati(i,:)];
        City_x2_y2_2050 = [City_x2_y2_2050;city_COT_longi_lati2(i,:)];
        City_rdel_SLB_COT_2050 = [City_rdel_SLB_COT_2050;rdel_SLB_COT_2050(i,1)];

    end
end





