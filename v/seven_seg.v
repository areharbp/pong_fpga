module seven_seg(disp, seven_disp);
input [3:0]disp;
output [6:0]seven_disp;

wire a, b, c, d;

assign a = disp[3];
assign b = disp[2];
assign c = disp[1];
assign d = disp[0];

assign seven_disp[0]=!((!a&c)||(c&!d)||(!b&!d)||(b&c)||(b&d&!a)||(a&!c&!d)||(a&!b&!c));
assign seven_disp[1]=!((!a&!b)||(!b&!c)||(!b&!d)||(!a&!c&!d)||(!a&c&d)||(a&d&!c));
assign seven_disp[2]=!((!a&!c)||(!a&d)||(!a&b)||(!c&d)||(a&!b));
assign seven_disp[3]=!((a&!c)||(b&d&!c)||(!b&!c&!d)||(!a&!b&c)||(b&c&!d)||(a&d&!b));
assign seven_disp[4]=!((!b&!d)||(c&!d)||(a&c)||(a&b));
assign seven_disp[5]=!((!c&!d)||(a&c)||(a&!b)||(!a&!c&b)||(b&c&!d));
assign seven_disp[6]=!((c&!d)||(a&!b)||(a&d)||(!c&!a&b)||(!a&!b&c));

endmodule
