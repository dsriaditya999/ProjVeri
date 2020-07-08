`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:55 05/15/2020 
// Design Name: 
// Module Name:    mux8to1 
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
module mux8to1(in0,in1,in2,in3,in4,in5,in6,in7,sel2,sel1,sel0,out
    );
	 
	 parameter N = 5;
	 input [N-1:0] in0,in1,in2,in3,in4,in5,in6,in7;
	 input sel2,sel1,sel0;
	 output [N-1:0] out;
	 wire [N-1:0] t1,t0;
	 
	 mux4to1 M0(in0,in1,in2,in3,{sel1,sel0},t0);
	 mux4to1 M1(in4,in5,in6,in7,{sel1,sel0},t1);
	 mux2to1 M2(t0,t1,sel2,out);

endmodule
