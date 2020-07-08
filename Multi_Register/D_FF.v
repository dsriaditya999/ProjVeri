`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:52 06/16/2020 
// Design Name: 
// Module Name:    D_FF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D_FF(Q,D,clk,clr);

	input D,clk,clr;
	output reg Q;
	
	always @(posedge clk)
		begin
		
		if(clr == 1'b1) Q <= 1'b0;
		
		else Q <= D;
		
		end
	
endmodule
