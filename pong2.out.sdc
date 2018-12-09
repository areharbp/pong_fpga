## Generated SDC file "pong2.out.sdc"

## Copyright (C) 2016  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Intel and sold by Intel or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

## DATE    "Sun Dec 09 15:20:38 2018"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {VGA_CLKo[0]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {VGA_CLKo[0]}]
create_clock -name {CLOCK_50} -period 1.000 -waveform { 0.000 0.500 } [get_ports {CLOCK_50}]
create_clock -name {gridcolor:st1|ps2_keyboard:keyboard|milliclk} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]
create_clock -name {gridcolor:st1|ball_location:bloc|milliclk} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|ball_location:bloc|milliclk}]
create_clock -name {gridcolor:st1|ps2_keyboard:keyboard|keyready} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|ps2_keyboard:keyboard|keyready}]
create_clock -name {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]
create_clock -name {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]
create_clock -name {VGA_CLKo[12]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {VGA_CLKo[12]}]
create_clock -name {PS2_CLK} -period 1.000 -waveform { 0.000 0.500 } [get_ports {PS2_CLK}]
create_clock -name {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o} -period 1.000 -waveform { 0.000 0.500 } [get_registers {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}] -rise_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}] -fall_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}] -rise_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}] -fall_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {PS2_CLK}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {PS2_CLK}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {PS2_CLK}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {PS2_CLK}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[12]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {PS2_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|ps2_clk_in}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|keyready}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {VGA_CLKo[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {VGA_CLKo[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {gridcolor:st1|vga_time_generator:vga0|VGA_HS_o}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {VGA_CLKo[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {VGA_CLKo[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {VGA_CLKo[0]}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -rise_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}] -fall_to [get_clocks {CLOCK_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {VGA_CLKo[12]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {VGA_CLKo[12]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|clk_div[8]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -rise_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -fall_to [get_clocks {gridcolor:st1|ball_location:bloc|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -rise_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}] -fall_to [get_clocks {gridcolor:st1|ps2_keyboard:keyboard|milliclk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

