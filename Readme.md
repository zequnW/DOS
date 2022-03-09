1.Lammps中导出需要计算组的速度文件
`dump 1 all custom 1 ${simname}_voutput.lammpstrj id type vx vy vz`

2.修改输入文件名和输出文件名

3.先后运行`Translate.m` 和`plot_pdos.m`