# create_project.tcl

create_project DivideBy4-Improved ./DivideBy4-Improved -part xc7a35tcpg236-1 -force

# Add your HDL source files
add_files ./src/FPGA_Design.sv
add_files ./src/tb_DivideBy4.sv
set_property top tb_DivideBy4 [get_filesets sim_1]
launch_simulation
