module ps2_keyboard(	
					input	iCLK_50,
					inout   ps2_dat,
					input   ps2_clk,
					input   sys_clk,
					input   reset,
					input   reset1,
//					output  reg[7:0]scandata,
//					output reg key1_on,
//					output reg key2_on,
//					output reg key3_on,
//					output reg key4_on,
//					output reg [7:0]key1_code,
//					output reg [7:0]key2_code,
//					output reg [7:0]key3_code,
//					output reg [7:0]key4_code,
					output reg [11:0] left_y,
					output reg [11:0] right_y,
					input wire [11:0] left_yin,
					input wire [11:0] right_yin,
					input 		state
					);
reg[7:0]scandata;
reg key1_on;
reg key2_on;
reg [7:0]key1_code;
reg [7:0]key2_code;

////////////Keyboard Initially/////////
	reg [10:0] MCNT;
	always @(negedge reset or posedge sys_clk) 
	begin
		if (!reset) 
			MCNT=0;
		else if(MCNT < 500) 
			MCNT=MCNT+1'b1;
//		else if ( !is_key && (key1_code!=keycode_o))
//			MCNT=0;
	end

///// sequence generator /////
//	reg	[7:0]	revcnt;
	wire rev_tr=(MCNT<12)?1'b1:1'b0;
	
//	always @(posedge rev_tr or posedge ps2_clk)
//	begin
//		if (rev_tr)
//			revcnt=0;
//		else if (revcnt >=10) 
//			revcnt=0;
//		else
//			revcnt=revcnt+1;
//	end
	
//////KeyBoard serial data in /////
//	reg [9:0]keycode_o;
//	always @(posedge ps2_clk) begin
//		case (revcnt[3:0])
//		1:keycode_o[0]=ps2_dat;
//		2:keycode_o[1]=ps2_dat;
//		3:keycode_o[2]=ps2_dat;
//		4:keycode_o[3]=ps2_dat;
//		5:keycode_o[4]=ps2_dat;
//		6:keycode_o[5]=ps2_dat;
//		7:keycode_o[6]=ps2_dat;
//		8:keycode_o[7]=ps2_dat;
//		endcase
//	end
//	wire [7:0]rc=keycode_o;
//	wire HOST_ACK=(revcnt==10)?~(rc[7]^rc[6]^rc[5]^rc[4]^rc[3]^rc[2]^rc[1]^rc[0]) :1;
//////////PS2 InOut/////////
//	assign   ps2_dat =(HOST_ACK)?1'bz:1'b0;


///////KeyBoard Scan-Code trigger//////
	reg keyready;
	always @(posedge rev_tr or negedge ps2_clk) begin 
		if (rev_tr)	
			keyready=1'b0;
		else if (revcnt[3:0]==4'd10)
			keyready=1'b1;
		else	
			keyready=1'b0;
    end			
/////////////////////////////////////Key1-Key2 Output///////////////////////////
	wire is_key=(
		(keycode_o==8'h1d)?1'b1:(
		(keycode_o==8'h1b)?1'b1:(	
		(keycode_o==8'h44)?1'b1:(
		(keycode_o==8'h4b)?1'b1:1'b0
		)))
	);
	
//////////////key1 & key2 Assign///////////
	wire keyboard_off=((MCNT==200) || (!reset1))?1'b0:1'b1;

	always @(posedge keyready) scandata = keycode_o;
	
always @(negedge keyboard_off  or posedge keyready) 
begin
	if (!keyboard_off) 
	begin 
		key1_on=1'b0;
		key2_on=1'b0;
//		key3_on=0;
//		key4_on=0;
		key1_code=8'hf0;
		key2_code=8'hf0;
//		key3_code=8'hf0;
//		key4_code=8'hf0;
	end 
	else if (scandata==8'hf0) 	
	begin
		if (keycode_o==key1_code) 
		begin 
			key1_code=8'hf0; 
			key1_on=1'b0; 
		end
		else if (keycode_o==key2_code) 
		begin 
			key2_code=8'hf0;
			key2_on=1'b0; 
		end	
//		else if (keycode_o==key3_code) 
//		begin 
//			key3_code=8'hf0;
//			key3_on=0; 
//		end
//		else if (keycode_o==key4_code) 
//		begin 
//			key4_code=8'hf0;
//			key4_on=0; 
//		end
	end		
	else if (is_key) 		
	begin
		if ((!key1_on) && (key2_code!=keycode_o) && (((keycode_o == 8'h1d) && (key2_code!=8'h1b)) || ((keycode_o == 8'h1b) && (key2_code!=8'h1d)) || ((keycode_o == 8'h44) && (key2_code!=8'h4b)) || ((keycode_o == 8'h4b) && (key2_code!=8'h44)))) // 
		begin
			key1_on=1'b1;
			key1_code=keycode_o;
		end
		else if ( (!key2_on) && (key1_code!=keycode_o)  && (((keycode_o == 8'h1d) && (key1_code!=8'h1b)) || ((keycode_o == 8'h1b) && (key1_code!=8'h1d)) || ((keycode_o == 8'h44) && (key1_code!=8'h4b)) || ((keycode_o == 8'h4b) && (key1_code!=8'h44))) ) // 
		begin  
			key2_on=1'b1;
			key2_code=keycode_o;
		end
//		else if ( (!key3_on) &&(key1_code!=keycode_o && key2_code!=keycode_o && key4_code!=keycode_o) ) // 
//		begin  
//			key3_on=1;
//			key3_code=keycode_o;
//		end
//		else if ( (!key4_on) &&(key1_code!=keycode_o && key2_code!=keycode_o && key3_code!=keycode_o) ) // 
//		begin  
//			key4_on=1;
//			key4_code=keycode_o;
//		end
	end
end

reg [31:0] i = 0;
reg milliclk = 1'b0;

always @(posedge milliclk or negedge reset) //posedge keyready 
begin
//	if (keyready)
//	begin
	if (!reset)
	begin
		left_y <= 12'd190;
		right_y <= 12'd190;
	end
	else
	begin
		if (!state)
		begin
			left_y <= 12'd190;
			right_y <= 12'd190;
		end
		else if (key1_on || key2_on) 
		begin	
			if (key1_on)
			begin
				if (key1_code == 8'h44 && right_yin > 12'd31)
					right_y = right_yin - 1'd1;
				else if (key1_code == 8'h4b && right_yin < 12'd349)
					right_y = right_yin + 1'd1;
				if (key1_code == 8'h1d && left_yin > 12'd31)
					left_y = left_yin - 1'd1;
				else if (key1_code == 8'h1b && left_yin < 12'd349)
					left_y = left_yin + 1'd1;
			end
			
			if (key2_on)
			begin
				if (key2_code == 8'h44 && right_yin > 12'd31)
					right_y = right_yin - 1'd1;
				else if (key2_code == 8'h4b && right_yin < 12'd349)
					right_y = right_yin + 1'd1;
					
				if (key2_code == 8'h1d && left_yin > 12'd31)
					left_y = left_yin - 1'd1;
				else if (key2_code == 8'h1b && left_yin < 12'd349)
					left_y = left_yin + 1'd1;
			end
			
//			if (key3_on)
//			begin
//				if (key3_code == 8'h44 && right_yin > 31)
//					right_y = right_yin - 1;
//				else if (key3_code == 8'h4b && right_yin < 349)
//					right_y = right_yin + 1;
//				else if (key3_code == 8'h1d && left_yin > 31)
//					left_y = left_yin - 1;
//				else if (key3_code == 8'h1b && left_yin < 349)
//					left_y = left_yin + 1;
//			end
//			
//			if (key4_on)
//			begin
//				if (key4_code == 8'h44 && right_yin > 31)
//					right_y = right_yin - 1;
//				else if (key4_code == 8'h4b && right_yin < 349)
//					right_y = right_yin + 1;
//				else if (key4_code == 8'h1d && left_yin > 31)
//					left_y = left_yin - 1;
//				else if (key4_code == 8'h1b && left_yin < 349)
//					left_y = left_yin + 1;
//			end
			
	
		end
	end
//	end
//	else
//	begin
//		
//	end
end


reg       ps2_clk_in,ps2_clk_syn1,ps2_dat_in,ps2_dat_syn1;
wire      clk,ps2_dat_syn0,ps2_clk_syn0;
//tristate output control for PS2_DAT and PS2_CLK;
assign ps2_clk_syn0 = ps2_clk;
assign ps2_dat_syn0 = ps2_dat;

//clk division, derive a 97.65625KHz clock from the 50MHz source;
reg [8:0] clk_div;
always@(posedge iCLK_50)
	begin
		clk_div <= clk_div+1'd1;
		if (i < 100000)
		begin
			i <= i + 1;
			milliclk <= 1'b0;
		end
		else
		begin
			i <= 0;
			milliclk <= 1'b1;
		end
			
	end
	
assign clk = clk_div[8];
//multi-clock region simple synchronization
always@(posedge clk)
begin
	ps2_clk_syn1 <= ps2_clk_syn0;
	ps2_clk_in   <= ps2_clk_syn1;
	ps2_dat_syn1 <= ps2_dat_syn0;
	ps2_dat_in   <= ps2_dat_syn1;
end
reg [7:0]	keycode_o;
reg	[7:0]	revcnt;
	
always @( posedge ps2_clk_in or negedge keyboard_off)
	begin
		if (!keyboard_off)
			revcnt=1'b0;
		else if (revcnt >=10) 
			revcnt=1'b0;
		else
			revcnt=revcnt+8'b1;
	end
	
always @(posedge ps2_clk_in) 
begin
	case (revcnt[3:0])
		1:keycode_o[0]=ps2_dat_in;
		2:keycode_o[1]=ps2_dat_in;
		3:keycode_o[2]=ps2_dat_in;
		4:keycode_o[3]=ps2_dat_in;
		5:keycode_o[4]=ps2_dat_in;
		6:keycode_o[5]=ps2_dat_in;
		7:keycode_o[6]=ps2_dat_in;
		8:keycode_o[7]=ps2_dat_in;
	endcase
end
endmodule
