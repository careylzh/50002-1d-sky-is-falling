set projDir "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/planAhead"
set projName "led_matrix"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/mojo_top_0.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/reset_conditioner_1.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/avr_interface_2.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/reg_interface_3.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/led_matrix_4.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/cclk_detector_5.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/spi_slave_6.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/uart_rx_7.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/uart_tx_8.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/vram_9.v" "C:/Users/Carey/Desktop/led_matrix/led_matrix/work/verilog/simple_dual_ram_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Carey/Desktop/led_matrix/led_matrix/constraint/matrix.ucf" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/mojo.ucf" ]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
