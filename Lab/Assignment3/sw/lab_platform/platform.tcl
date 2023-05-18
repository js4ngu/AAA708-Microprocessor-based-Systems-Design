# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment2\sw\lab_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment2\sw\lab_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {lab_platform}\
-hw {C:\File\Lec\graduate\AAA708-Microprocessor-based-Systems-Design\Lab\Assignment2\lab0\design_1_wrapper.xsa}\
-proc {psu_cortexr5_0} -os {standalone} -fsbl-target {psu_cortexr5_0} -out {C:/File/Lec/graduate/AAA708-Microprocessor-based-Systems-Design/Lab/Assignment2/sw}

platform write
platform generate -domains 
platform active {lab_platform}
platform generate
platform generate
platform generate
platform active {lab_platform}
platform generate -domains 
platform generate
platform active {lab_platform}
platform generate -domains 
platform clean
platform generate
platform active {lab_platform}
platform generate -domains 
