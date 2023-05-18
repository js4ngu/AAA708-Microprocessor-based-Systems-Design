# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment3\sw\app_system\_ide\scripts\systemdebugger_app_system_(1)_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment3\sw\app_system\_ide\scripts\systemdebugger_app_system_(1)_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
source C:/Xilinx/Vitis/2022.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -nocase -filter {name =~"RPU*"}
enable_split_mode
targets -set -filter {jtag_cable_name =~ "Avnet USB-to-JTAG/UART Pod V1 1234-oj1A" && level==0 && jtag_device_ctx=="jsn-USB-to-JTAG/UART Pod V1-1234-oj1A-14710093-0"}
fpga -file C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment3/sw/app_2/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment2/sw/lab_platform/export/lab_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*R5*#0"}
rst -processor
dow C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment2/sw/lab_platform/export/lab_platform/sw/lab_platform/boot/fsbl.elf
set bp_9_41_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_9_41_fsbl_bp
targets -set -nocase -filter {name =~ "*R5*#0"}
rst -processor
dow C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment3/sw/app_2/Debug/app_2.elf
configparams force-mem-access 0
bpadd -addr &main
