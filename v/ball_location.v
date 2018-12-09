module ball_location (
	input clk,
	input rst,
	input wire [11:0] inx,
	input wire [11:0] iny,
	input wire [11:0] lefty,
	input wire [11:0] righty,
	output reg [11:0] outx,
	output reg [11:0] outy,
	input 		state,
	output reg [1:0] goal,
	input [1:0] adv
);

reg xmov;
reg ymov;

reg [31:0] i = 0;
reg [3:0] rando = 0;
reg milliclk = 1'b0;

always@(posedge clk)
	begin
		if (i < 220000)
		begin
			i <= i + 1;
			milliclk <= 1'b0;
		end
		else
		begin
			i <= 0;
			milliclk <= 1'b1;
		end
		
		if (rando == 3)
		begin
			rando <= 0;
		end
		else
		begin
			rando <= rando + 4'd1;
		end
	end


// ball is 20px by 20px

always @(posedge milliclk or negedge rst)
begin
	if (!rst)
	begin
		outx <= 310;
		outy <= 230;
		xmov <= 0; //(rando == 3) ? 1 : (rando == 2 ? 1 : 0);
		ymov <= 0; // rando == 3 ? 1 : (rando == 1 ? 1 : 0);
		goal <= 2'b00;
	end
	else
	begin
		if (!state)
		begin
			outx <= 310;
			outy <= 230;
			xmov <= (adv[1]) ? (adv[0] ? 1'b1 : 1'b0) : ((rando == 3) ? 1'b1 : (rando == 2 ? 1'b1 : 1'b0));
			ymov <= (rando == 4'd3) ? 1'b1 : (rando == 4'd1 ? 1'b1 : 1'b0);
			goal <= 2'b00;
		end
		else
		begin
			if (inx < 32 && !(iny >= 160 && iny <= 300))
			begin
				xmov <= 0;
				goal <= 2'b00;
			end
			else if (inx > 588 && !(iny >= 160 && iny <= 300))
			begin
				xmov <= 1;
				goal <= 2'b00;
			end
			else if (inx < 32)
			begin
				goal <= 2'b11;
				outx <= 310;
				outy <= 230;
			end
			else if (inx > 588)
			begin
				goal <= 2'b10;
				outx <= 310;
				outy <= 230;
			end
			else
			begin
				goal <= 2'b00;
			end
			
			if (iny < 32)
				ymov <= 0;
			else if (iny > 428)
				ymov <= 1;
				
			if ((inx >= 78 && inx <= 80) || (inx >= 508 && inx <= 510))
			begin
				if ((iny >= lefty - 10'd20 && iny <= lefty + 100 && (inx >= 78 && inx <= 80)) || (iny >= righty - 10'd20 && iny <= righty + 100 && (inx >= 509 && inx <= 510)))
				begin
					xmov <= 1;
					outx <= inx - 10'd1;
					
				end
				else
				begin
					if (xmov)
					outx <= inx - 10'd1;
				else
					outx <= inx + 10'd1;
				end
			end
			else if ((inx >= 110 && inx <= 112) || (inx >= 540 && inx <= 542))
			begin
				if ((iny >= lefty - 10'd20 && iny <= lefty + 100 && (inx >= 110 && inx <= 112)) || (iny >= righty - 10'd20 && iny <= righty + 100 && (inx >= 540 && inx <= 542)))
				begin
					xmov <= 0;
					outx <= inx + 10'd1;
					
				end
				else
				begin
					if (xmov)
					outx <= inx - 10'd1;
				else
					outx <= inx + 10'd1;
				end
			end
			else 
			begin
				if (xmov)
					outx <= inx - 10'd1;
				else
					outx <= inx + 10'd1;

			end
			
			if ((inx >= 80 && inx <= 110) || (inx >= 510 && inx <= 540))
			begin
				if ((iny >= lefty - 10'd22 && iny <= lefty - 10'd20 && (inx >= 80 && inx <= 110)) || (iny >= righty - 10'd22 && iny <= righty - 10'd20 && (inx >= 510 && inx <= 540)))
				begin
					ymov <= 1;
					outy <= iny - 10'd1;
				end
				else if ((iny >= lefty + 100 && iny <= lefty + 102 && (inx >= 80 && inx <= 110)) || (iny >= righty + 100 && iny <= righty + 102 && (inx >= 510 && inx <= 540)))
				begin
					ymov <= 0;
					outy <= iny + 10'd1;
				end
				else
				begin
					if (ymov)
						outy <= iny - 10'd1;
					else
						outy <= iny + 10'd1;
				end
			end
			else
			begin
				if (ymov)
					outy <= iny - 10'd1;
				else
					outy <= iny + 10'd1;
			end
			
		end
		
//		if (ymov)
//			outy <= iny - 10'd5;
//		else
//			outy <= iny + 10'd5;
	end


end




endmodule
