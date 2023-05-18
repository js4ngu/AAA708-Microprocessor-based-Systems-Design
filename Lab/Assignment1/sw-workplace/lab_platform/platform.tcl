# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment1\sw-workplace\lab_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment1\sw-workplace\lab_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {lab_platform}\
-hw {C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment1\lab0\design_1_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment1/sw-workplace}

platform write
platform generate -domains 
platform active {lab_platform}
platform generate
platform active {lab_platform}
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform write
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_domain}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
domain active {zynqmp_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
domain active {standalone_psu_cortexa53_0}
bsp reload
domain active {zynqmp_pmufw}
bsp reload
platform generate -domains standalone_psu_cortexa53_0 
