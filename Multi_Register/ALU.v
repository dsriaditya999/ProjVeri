`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:31 06/16/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(out,in1,in2,addsub);
	
	parameter N =8;
	input [N-1:0] in1,in2;
	input addsub;
	
	output reg [N-1:0] out;
	
	always @(*)
		begin
		
		if(addsub == 1'b0) out <= in1 - in2;
		else out <= in1 + in2;
		
		end
		
		
endmodule
