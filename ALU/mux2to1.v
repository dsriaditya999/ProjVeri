`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:53 05/15/2020 
// Design Name: 
// Module Name:    mux2to1 
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
module mux2to1(in0,in1,sel,out
    );
	 parameter N = 5;
	 input [N-1:0] in1,in0;
	 input sel;
	 output [N-1:0] out;
	 
	 assign out = (sel == 1'b0)? in0 : in1;


endmodule
