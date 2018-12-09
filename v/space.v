module space (
	input clk,
	input rst,
	input wire [11:0] inx,
	input wire [11:0] iny,
	output reg [11:0] outx,
	output reg [11:0] outy
);

reg [3:0] xmov;
reg [3:0] ymov;



// ball is 20px by 20px

always @(posedge clk or negedge rst)
begin
	if (!rst)
	begin
		outx <= 4'd0;
		outy <= 4'd0;
		xmov <= 4'd0;
		ymov <= 4'd0;
	end
	else
	begin
		if (inx < 12'd35)
			xmov <= 4'd5;
		else if (inx > 12'd585)
			xmov <= -4'd5;
		
		if (iny < 35)
			ymov <= 4'd5;
		else if (iny > 425)
			ymov <= -4'd5;
		
		outx <= inx + xmov;
		outy <= iny + ymov;
		
	end


end


endmodule
