set projDir "C:/Users/Carey/Desktop/led_matrix - Copy/work/planAhead"
set projName "led_matrix"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/mojo_top_0.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/reset_conditioner_1.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/avr_interface_2.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/reg_interface_3.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/matrix_writer_4.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/matrix_ram_5.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/gamefsm_6.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/cclk_detector_7.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/spi_slave_8.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/uart_rx_9.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/uart_tx_10.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/edge_detector_11.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/initgame_12.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/genSky_13.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/stateCounterA_14.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/stateCounterB_15.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/counter_16.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/counter_17.v" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/work/verilog/pn_gen_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/constraint/matrix.ucf" "C:/Users/Carey/Desktop/led_matrix\ -\ Copy/constraint/leftRightButtons.ucf" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/mojo.ucf" ]
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
