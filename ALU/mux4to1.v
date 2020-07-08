`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:43 05/15/2020 
// Design Name: 
// Module Name:    mux4to1 
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
module mux4to1(in0,in1,in2,in3,sel,out
    );
	 parameter N = 5;
	 input [N-1:0] in3,in2,in1,in0;
	 input [1:0] sel;
	 output [N-1:0] out;
	 wire [N-1:0] t1,t0;
	 
	 mux2to1 M0(in0,in1,sel[0],t0);
	 mux2to1 M1(in2,in3,sel[0],t1);
	 mux2to1 M2(t0,t1,sel[1],out);

endmodule
