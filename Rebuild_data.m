function Rebuild_data(Nf,N)
% 将lammps输出的v_output.lammpstrj,转换为樊哲勇plot_pdos.m的输入文件
% Nf: 计算总时间步数
% N: 原子总数

try
    dump = fopen('mix_l.lammpstrj','r'); % 读取数据文件
catch
    error('Dumpfile not found!');
end
fid = fopen('mix_l_v_out.txt','w'); % 输出的后处理文件
 
for i = 1 : Nf+1 
    
    % lammps里跑了N步，实际上跑了N+1步，从0开始计算
    % 跳过前9行读取数据，注意：每次读完文件指针都不会
    % 返回初始位置，而是停留在当前位置，所以不能改变9
    
    A = textscan(dump,'%f %f %f %f %f','headerlines',9);
    data = zeros(N,5); % 储存每个时间步下的原子速度,[id type,vx,vy,yz]
    
    for j = 1 : 5
        data(:,j) = A{1,j}; % 将读取的数据（cell）存储为矩阵
    end
    
    % 重新按照升序排列的原子信息，fprintf是按列存储，所以需转置
    data = sortrows(data,1)';  
    fprintf(fid,'%d %d %f %f %f\n',data); % 将原子信息存储到v_out,txt中
end