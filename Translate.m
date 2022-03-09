clear; close all;

% set up some parameters related to the MD simulation
N = 73;   % number of atoms
Nc = 1000;   % number of correlation steps (a larger number gives a finer resolution)
dt = 0.001; % time interval in units of ps (its inverse is roughly the maximum frequency attainable)
omega = 1 : 0.5 : 380; % angular frequency in units of THz
nu = omega / 2 / pi; % omega = 2 * pi * nu 计算频率范围
Nf = Nc*10;

% 将lammps 输出的速度文件转换为该程序输入文件所需格式
Rebuild_data(Nf,N);

% load and rearrange the data
data = load('mix_l_v_out.txt');    % get data from your output file 
Nf = size(data, 1) / N;      % number of frames
v_all = zeros(N, 3, Nf);     % all the velocity data
for n = 1 : Nf               % put the data into a good form
   v_all(:, :, n) = data((n - 1) * N + 1 : n * N, 3:5);
end