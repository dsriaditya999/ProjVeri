`timescale 1ns / 1ps

module D_FF_EN(Q,D,clk,en);
	
	input D,clk,en;
	output reg Q;
	
	always @(posedge clk)
		begin
		
		if(en == 1'b1) Q <= D;
		else Q <= Q;
		
		end
		


endmodule
