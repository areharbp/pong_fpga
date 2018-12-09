module gridcolor(
	input clk,
	input rst,
	input VGA_CLK,
	output vga_sync,	
	output vga_h_sync,
	output vga_v_sync,
	output inDisplayArea,	
	output vga_R,
	output vga_G, 
	output vga_B,
	inout   PS2_DAT,
	input   PS2_CLK,
	input   keyboard_sysclk,
	input	[3:0]	KEY,
//	input  wire [7:0] scandata,
//	input wire key1_on,
//	input wire key2_on,
//					output reg key3_on,
//					output reg key4_on,
//	input wire [7:0]key1_code,
//	input wire [7:0]key2_code,
//					output reg [7:0]key3_code,
//					output reg [7:0]key4_code,
	output [6:0] onescore,
	output [6:0] twoscore
	);
		assign  vga_sync=1;	
		
		
		///////640X480 VGA-Timing-generater///////

	wire [11:0] CounterX;
	wire [11:0] CounterY;
	vga_time_generator vga0(
		.pixel_clk(VGA_CLK),
		.h_disp   (640),
		.h_fporch (16),
		.h_sync   (96), 
		.h_bporch (48),
		.v_disp   (480),
		.v_fporch (10),
		.v_sync   (2),
		.v_bporch (33),
		.vga_hs   (vga_h_sync),
		.vga_vs   (vga_v_sync),
		.vga_blank(inDisplayArea),
		.CounterY(CounterY),
		.CounterX(CounterX) 
	);
	
// =========================== KEYBOARD ================================================

	wire [11:0] left_y;
	wire [11:0] right_y;
	
	wire [11:0] left_yin;
	wire [11:0] right_yin;
	
	assign left_yin = left_y;
	assign right_yin = right_y;

	ps2_keyboard keyboard( 						  
	 .iCLK_50  ( clk),  		  //clock source;
	 .ps2_dat  ( PS2_DAT ),		  //ps2bus data  		
	 .ps2_clk  ( PS2_CLK ),		  //ps2bus clk      	
	 .sys_clk  ( keyboard_sysclk ),  //system clock		
	 .reset    ( rst ), 		  //system reset		
	 .reset1   ( KEY[2] ),			  //keyboard reset	
//	 .scandata ( scandata ),		  //scan code   
//	 .key1_on  ( key1_on ),		  //key1 triger
//	 .key2_on  ( key2_on ),		  //key2 triger
//								 .key3_on  ( key3_on ),		  //key1 triger
//								 .key4_on  ( key4_on ),		  //key2 triger
//	 .key1_code( key1_code ),		  //key1 code
//	 .key2_code( key2_code ),		 //key2 code
//								 .key3_code( key3_code ),		  //key1 code
//								 .key4_code( key4_code ),		 //key2 code
	 
	 .left_yin		( left_yin ),
	 .right_yin	( right_yin ),
	 .left_y		( left_y ),
	 .right_y	( right_y ),
	 .state		(s == GAME)
	);
	
	
// =========================== STATE MACHINE ===========================================
	wire [1:0] goal;
	
	reg [2:0] one;
	reg [2:0] two;
	
	parameter 	TRUESTART	= 3'b000,
					ONEADV		= 3'b001,
					TWOADV		= 3'b010,
					GAME			= 3'b011,
					ONEGOAL		= 3'b100,
					TWOGOAL		= 3'b101,
					ONEWIN		= 3'b110,
					TWOWIN		= 3'b111;
	reg [2:0] s;
//	reg [2:0] ns;
	
	reg [31:0] i;
//	reg enable;
	reg [1:0] rando = 0;
	reg [1:0] adv;

	
	always @(posedge clk or negedge rst)
	begin
		if (!rst)
		begin
			i <= 0;
//			ns <= TRUESTART;
			s <= TRUESTART;
			one <= 0;
			two <= 0;
			adv <= 2'b00;
		end
		else if ((s == ONEADV || s == TWOADV) && i < 150000000)
		begin
			i <= i + 1;
			if (rando == 3)
				rando <= 0;
			else
				rando <= rando + 1'b1;
		end
		else // if (((s == ONEADV || s == TWOADV) & i == 150000000) || (s != ONEADV && s != TWOADV))
		begin
			i <= 0;
			if (rando == 3)
				rando <= 0;
			else
				rando <= rando + 1'b1;
			case (s)
				TRUESTART:	s <= (rando == 0 || rando == 3) ? ONEADV : TWOADV;
				ONEADV:		s <= GAME;
				TWOADV:		s <= GAME;
				GAME:			s <= (!goal[1]) ? GAME : ((goal[0]) ? ONEGOAL : TWOGOAL);
				ONEGOAL:
					begin
						two <= two + 1'b1;
						adv <= 2'b11;
						s <= (two == 3'd6) ? TWOWIN : ONEADV;
					end
				TWOGOAL:
					begin
						one <= one + 1'b1;
						adv <= 2'b10;
						s <= (one == 3'd6) ? ONEWIN : TWOADV;
					end
				ONEWIN:		s <= ONEWIN;
				TWOWIN:		s <= TWOWIN;
			endcase
			
//			s <= ns;
		end		
	end
		
	// goal is 1* if there is a goal
	// goal is 10 if there is a goal on 2's side, 11 if on 1's
	
	
	
	
// space...?
	wire [11:0] spacex;
	wire [11:0] spacey;
	
	wire [11:0] spacexin;
	wire [11:0] spaceyin;
	
	assign spacexin = spacex;
	assign spaceyin = spacey;
	
	space starry (
			.clk		(clk),
			.rst		(rst),
			.inx		(spacexin),
			.iny		(spaceyin),
			.outx		(spacex),
			.outy		(spacey)
	);

	wire [11:0] ballx;
	wire [11:0] bally;
	
	wire [11:0] ballxin;
	wire [11:0] ballyin;
	
	assign ballxin = ballx;
	assign ballyin = bally;
	
	ball_location bloc (
			.clk		(clk),
			.rst		(rst),
			.inx		(ballxin),
			.iny		(ballyin),
			.lefty	(left_y),
			.righty	(right_y),
			.outx		(ballx),
			.outy		(bally),
			.state	(s == GAME),
			.goal		(goal),
			.adv		(adv)
	);
	

// top and bottom boundaries		
	wire topbottom;
	
	assign topbottom = (CounterY <= 30 | CounterY >= 450) ? 1'b1: 1'b0;

			
// left and right boundaries

	wire leftright;
	assign leftright = (CounterX <= 30 | CounterX >= 610) && (CounterY <= 160 | CounterY >= 320) ? 1'b1 : 1'b0;
	
// paddle left

	wire leftpaddle;
	assign leftpaddle = (CounterX >= 100 && CounterX <= 110) && (CounterY >= left_y && CounterY <= left_y + 100) ? 1'b1 : 1'b0;
	
// paddle right
	wire rightpaddle;
	assign rightpaddle = (CounterX >= 530 && CounterX <= 540) && (CounterY >= right_y && CounterY <= right_y + 100) ? 1'b1 : 1'b0;
	
// space ...?
	wire star;
	assign star = (CounterX >= spacex && CounterX <= spacex + 20) && (CounterY >= spacey && CounterY <= spacey + 20) ? 1'b1 : 1'b0;

// ball
	wire ball;
	assign ball = (CounterX >= ballx && CounterX <= ballx + 20) && (CounterY >= bally && CounterY <= bally + 20) ? 1'b1 : 1'b0;

	

/////////VGA data out///////
	wire boundary = (leftright |  topbottom | ball | star) & (! leftpaddle & ! rightpaddle);
	wire playerone = leftpaddle;
	wire playertwo = rightpaddle;
	assign	vga_R = (playerone ^ (boundary & two != 3'd7)) & inDisplayArea;
	assign	vga_G = (boundary & inDisplayArea) & (one != 3'd7 & two != 3'd7);
	assign	vga_B = (playertwo ^ (boundary & one != 3'd7)) & inDisplayArea;
	
	seven_seg onescr (
		.disp				({1'b0, one}),
		.seven_disp		(onescore)
	);
	
	seven_seg twoscr (
		.disp				({1'b0, two}),
		.seven_disp		(twoscore)
	);
		
endmodule
