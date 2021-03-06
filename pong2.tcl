# Copyright (C) 2016  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Intel and sold by Intel or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: pong2.tcl
# Generated on: Sun Dec 09 15:04:51 2018

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "pong2"]} {
		puts "Project pong2 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists pong2]} {
		project_open -revision pong2 pong2
	} else {
		project_new -revision pong2 pong2
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 16.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "12:05:48  NOVEMBER 26, 2018"
	set_global_assignment -name LAST_QUARTUS_VERSION "16.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name VERILOG_FILE v/space.v
	set_global_assignment -name VERILOG_FILE v/vga_time_generator.v
	set_global_assignment -name VERILOG_FILE v/ps2_keyboard.v
	set_global_assignment -name VERILOG_FILE pong2.v
	set_global_assignment -name CDF_FILE Chain1.cdf
	set_global_assignment -name CDF_FILE output_files/Chain1.cdf
	set_global_assignment -name VERILOG_FILE v/gridcolor.v
	set_global_assignment -name VERILOG_FILE v/ball_location.v
	set_global_assignment -name VERILOG_FILE v/seven_seg.v
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE115F29C7
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
#	set_global_assignment -name LL_ROOT_REGION ON -entity DE2_115_GOLDEN_TOP -section_id "Root Region"
#	set_global_assignment -name LL_MEMBER_STATE LOCKED -entity DE2_115_GOLDEN_TOP -section_id "Root Region"
#	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -entity DE2_115_GOLDEN_TOP -section_id Top
#	set_global_assignment -name PARTITION_COLOR 16764057 -entity DE2_115_GOLDEN_TOP -section_id Top
#	set_global_assignment -name LL_ROOT_REGION ON -entity DE2_115_Synthesizer -section_id "Root Region"
#	set_global_assignment -name LL_MEMBER_STATE LOCKED -entity DE2_115_Synthesizer -section_id "Root Region"
#	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -entity DE2_115_Synthesizer -section_id Top
#	set_global_assignment -name PARTITION_COLOR 16764057 -entity DE2_115_Synthesizer -section_id Top
#	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -entity DE2_115_Synthesizer -section_id Top
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_location_assignment PIN_Y2 -to CLOCK_50
	set_location_assignment PIN_M23 -to KEY[0]
	set_location_assignment PIN_M21 -to KEY[1]
	set_location_assignment PIN_N21 -to KEY[2]
	set_location_assignment PIN_R24 -to KEY[3]
	set_location_assignment PIN_AC28 -to SW[1]
	set_location_assignment PIN_AC27 -to SW[2]
	set_location_assignment PIN_AD27 -to SW[3]
	set_location_assignment PIN_AB27 -to SW[4]
	set_location_assignment PIN_AC26 -to SW[5]
	set_location_assignment PIN_AD26 -to SW[6]
	set_location_assignment PIN_AB26 -to SW[7]
	set_location_assignment PIN_AC25 -to SW[8]
	set_location_assignment PIN_AB25 -to SW[9]
	set_location_assignment PIN_AC24 -to SW[10]
	set_location_assignment PIN_AB24 -to SW[11]
	set_location_assignment PIN_AB23 -to SW[12]
	set_location_assignment PIN_AA24 -to SW[13]
	set_location_assignment PIN_AA23 -to SW[14]
	set_location_assignment PIN_AA22 -to SW[15]
	set_location_assignment PIN_Y24 -to SW[16]
	set_location_assignment PIN_Y23 -to SW[17]
	set_location_assignment PIN_D1 -to AUD_DACDAT
	set_location_assignment PIN_E3 -to AUD_DACLRCK
	set_location_assignment PIN_D2 -to AUD_ADCDAT
	set_location_assignment PIN_C2 -to AUD_ADCLRCK
	set_location_assignment PIN_E1 -to AUD_XCK
	set_location_assignment PIN_F2 -to AUD_BCLK
	set_location_assignment PIN_G6 -to PS2_CLK
	set_location_assignment PIN_H5 -to PS2_DAT
	set_location_assignment PIN_G5 -to PS2_CLK2
	set_location_assignment PIN_F5 -to PS2_DAT2
	set_location_assignment PIN_D12 -to VGA_B[7]
	set_location_assignment PIN_D11 -to VGA_B[6]
	set_location_assignment PIN_C12 -to VGA_B[5]
	set_location_assignment PIN_A11 -to VGA_B[4]
	set_location_assignment PIN_B11 -to VGA_B[3]
	set_location_assignment PIN_C11 -to VGA_B[2]
	set_location_assignment PIN_B10 -to VGA_B[0]
	set_location_assignment PIN_C9 -to VGA_G[7]
	set_location_assignment PIN_F10 -to VGA_G[6]
	set_location_assignment PIN_B8 -to VGA_G[5]
	set_location_assignment PIN_C8 -to VGA_G[4]
	set_location_assignment PIN_F8 -to VGA_G[2]
	set_location_assignment PIN_G11 -to VGA_G[1]
	set_location_assignment PIN_G8 -to VGA_G[0]
	set_location_assignment PIN_H10 -to VGA_R[7]
	set_location_assignment PIN_H8 -to VGA_R[6]
	set_location_assignment PIN_J12 -to VGA_R[5]
	set_location_assignment PIN_G10 -to VGA_R[4]
	set_location_assignment PIN_F12 -to VGA_R[3]
	set_location_assignment PIN_D10 -to VGA_R[2]
	set_location_assignment PIN_E11 -to VGA_R[1]
	set_location_assignment PIN_E12 -to VGA_R[0]
	set_location_assignment PIN_A12 -to VGA_CLK
	set_location_assignment PIN_F11 -to VGA_BLANK_N
	set_location_assignment PIN_C10 -to VGA_SYNC_N
	set_location_assignment PIN_G13 -to VGA_HS
	set_location_assignment PIN_C13 -to VGA_VS
	set_location_assignment PIN_AB28 -to SW[0]
	set_location_assignment PIN_A10 -to VGA_B[1]
	set_location_assignment PIN_H12 -to VGA_G[3]
	set_location_assignment PIN_H22 -to HEX0[6]
	set_location_assignment PIN_J22 -to HEX0[5]
	set_location_assignment PIN_L25 -to HEX0[4]
	set_location_assignment PIN_L26 -to HEX0[3]
	set_location_assignment PIN_E17 -to HEX0[2]
	set_location_assignment PIN_F22 -to HEX0[1]
	set_location_assignment PIN_G18 -to HEX0[0]
	set_location_assignment PIN_AA14 -to HEX7[6]
	set_location_assignment PIN_AG18 -to HEX7[5]
	set_location_assignment PIN_AF17 -to HEX7[4]
	set_location_assignment PIN_AH17 -to HEX7[3]
	set_location_assignment PIN_AG17 -to HEX7[2]
	set_location_assignment PIN_AE17 -to HEX7[1]
	set_location_assignment PIN_AD17 -to HEX7[0]
#	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -entity DE2_115_GOLDEN_TOP -section_id Top
#	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -entity DE2_115_Synthesizer -section_id Top
#	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
