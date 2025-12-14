## Implementing a synchronous counter using FPGA Design

Building on the previous synchronous counter (see repository ([Synchronous_Counter_J-K_Bistables](https://github.com/ml2182/Synchronous_Counter_J-K_Bistables)) for more detail) - I understood the difficulties of implementing FSM using J-K Bistables. So, after doing some research into FSM design for FPGA, I learnt about a much more logical, simplier and quicker approach. This is where you use one combinational logic always loop and another always loop using sequential logic, shown in FPGA_design.sv. In addition, this design removed the extra clock cycle delay due to one bistable using the result of the other. 
<img width="735" height="108" alt="image" src="https://github.com/user-attachments/assets/8e4e2013-fc63-4358-9be0-a86c91f6cc0b" />

Using this knowledge, I will use this design process for other projects.

## Folder structure
- `src/` — HDL source files
- `scripts/` — TCL automation scripts
