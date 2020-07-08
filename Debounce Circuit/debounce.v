`timescale 1ns / 1ps
module debounce(result,button,clk,rst);

	input button,clk,rst;
	output result;
	wire  w0,w1,w2,w3;
	
	D_FF D1(w0,button,clk,rst);
	D_FF D2(w1,w0,clk,rst);
	
	xor XG(w2,w1,w0);
	
	counter C1(w3,w2,~w3,clk,rst);
	
	D_FF_EN DF(result,w1,clk,w3);

endmodule
