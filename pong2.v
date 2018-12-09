// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	DE2_115_Default
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author              :| Mod. Date :| Changes Made:
//   V1.1 :| HdHuang             :| 05/12/10  :| Initial Revision
//   V2.0 :| Eko       				:| 05/23/12  :| version 11.1
// ============================================================================
						 												

module pong2(
	//////// CLOCK //////////
	CLOCK_50,
//	CLOCK2_50,
//	CLOCK3_50,
//	ENETCLK_25,

	//////// KEY //////////
	KEY,

	//////// SW //////////
	SW,
	
	//////// 7Seg /////////
	HEX0,
	HEX7,

	//////// PS2 //////////
	PS2_CLK,
	PS2_DAT,
	PS2_CLK2,
	PS2_DAT2,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK

//////// EXTEND IO //////////
//	EX_IO	
	);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		CLOCK_50;
//input		          		CLOCK2_50;
//input		          		CLOCK3_50;
//input		          		ENETCLK_25;


//////////// KEY //////////
input		     [3:0]		KEY;

//////////// SW //////////
input		     [17:0]		SW;


//////////// PS2 //////////
inout		          		PS2_CLK;
inout		          		PS2_DAT;
inout		          		PS2_CLK2;
inout		          		PS2_DAT2;

//////////// 7Seg ////////
output		[6:0]			HEX0;
output		[6:0]			HEX7;

//////////// VGA //////////
output		  [7:0]		VGA_B;
output		        		VGA_BLANK_N;
output		        		VGA_CLK;
output		  [7:0]		VGA_G;
output	         		VGA_HS;
output	     [7:0]		VGA_R;
output	         		VGA_SYNC_N;
output		        		VGA_VS;

//////////// Audio //////////
input		          		AUD_ADCDAT;
inout		          		AUD_ADCLRCK;
inout		          		AUD_BCLK;
output		        		AUD_DACDAT;
inout		          		AUD_DACLRCK;
output		        		AUD_XCK;


//////// EXTEND IO //////////
//inout		    [6:0]		EX_IO;


//wire			            I2C_END;
//wire					      AUD_CTRL_CLK;
reg			 [31:0]		VGA_CLKo;
wire   						keyboard_sysclk;
//wire   						demo_clock ; 
//wire		    [7:0]		demo_code1;
//wire 			 [7:0]		scan_code;
//wire 			   			get_gate;
//wire 				   		key1_on;
//wire 					   	key2_on;
//wire 				   		key3_on;
//wire 					   	key4_on;
//wire 			 [7:0]		key1_code;
//wire 			 [7:0]		key2_code;
//wire 			 [7:0]		key3_code;
//wire 			 [7:0]		key4_code;
wire   						VGA_R1,VGA_G1,VGA_B1;
wire   						VGA_R2,VGA_G2,VGA_B2;

//=============================================================================
// Structural coding
//=============================================================================
	
assign PS2_DAT2 = 1'b1;	
assign PS2_CLK2 = 1'b1;

// TIME & CLOCK Generater //

	assign keyboard_sysclk = VGA_CLKo[12];
//	assign demo_clock      = VGA_CLKo[18]; 
	assign VGA_CLK         = VGA_CLKo[0];

	always @( posedge CLOCK_50 )
		begin
			VGA_CLKo <= VGA_CLKo + 1;
		end

// Display //
	
	assign VGA_R=( VGA_R1 )? 10'h3f0 : 8'b0 ;
	
	assign VGA_G=( VGA_G1 )? 10'h3f0 : 8'b0 ;
	
	assign VGA_B=( VGA_B1 )? 10'h3f0 : 8'b0 ;

	gridcolor st1(
		.clk  ( CLOCK_50),
		.rst    ( SW[17] ), 		  //system reset		
		.KEY		(KEY),
		.PS2_DAT	( PS2_DAT),
		.PS2_CLK  ( PS2_CLK ),		  //ps2bus clk      	
		.keyboard_sysclk  ( keyboard_sysclk ),  //system clock	
//		.scandata ( scan_code ),		  //scan code   
//		.key1_on  ( key1_on ),		  //key1 triger
//		.key2_on  ( key2_on ),		  //key2 triger
//		.key1_code( key1_code ),		  //key1 code
//		.key2_code( key2_code ),		 //key2 code

		  // VGA output //
	
		 .VGA_CLK   		( VGA_CLK ),   
		 .vga_h_sync		( VGA_HS ), 
		 .vga_v_sync		( VGA_VS ), 
		 .vga_sync  		( VGA_SYNC_N ),	
		 .inDisplayArea	( VGA_BLANK_N ),
		 .vga_R				( VGA_R1 ), 
		 .vga_G				( VGA_G1 ), 
		 .vga_B				( VGA_B1 ),
		 .onescore			( HEX7 ),
		 .twoscore			( HEX0 )
	);


endmodule
