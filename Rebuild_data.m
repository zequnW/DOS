function Rebuild_data(Nf,N)
% ��lammps�����v_output.lammpstrj,ת��Ϊ������plot_pdos.m�������ļ�
% Nf: ������ʱ�䲽��
% N: ԭ������

try
    dump = fopen('mix_l.lammpstrj','r'); % ��ȡ�����ļ�
catch
    error('Dumpfile not found!');
end
fid = fopen('mix_l_v_out.txt','w'); % ����ĺ����ļ�
 
for i = 1 : Nf+1 
    
    % lammps������N����ʵ��������N+1������0��ʼ����
    % ����ǰ9�ж�ȡ���ݣ�ע�⣺ÿ�ζ����ļ�ָ�붼����
    % ���س�ʼλ�ã�����ͣ���ڵ�ǰλ�ã����Բ��ܸı�9
    
    A = textscan(dump,'%f %f %f %f %f','headerlines',9);
    data = zeros(N,5); % ����ÿ��ʱ�䲽�µ�ԭ���ٶ�,[id type,vx,vy,yz]
    
    for j = 1 : 5
        data(:,j) = A{1,j}; % ����ȡ�����ݣ�cell���洢Ϊ����
    end
    
    % ���°����������е�ԭ����Ϣ��fprintf�ǰ��д洢��������ת��
    data = sortrows(data,1)';  
    fprintf(fid,'%d %d %f %f %f\n',data); % ��ԭ����Ϣ�洢��v_out,txt��
end