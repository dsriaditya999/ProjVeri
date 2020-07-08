`timescale 1ns / 1ps

module D_FF(Q,D,clk,rst);

	input D,clk,rst;
	output reg Q;

	always@(posedge clk)
		begin
		if(rst == 1'b0) Q <= 1'b0;
		else Q <= D;
		end
		
endmodule
