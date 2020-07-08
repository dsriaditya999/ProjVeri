`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:35 05/15/2020 
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
module ALU(A,B,C0,S1,S0,M,C_out,data_out
    );
	 parameter N = 4;
	 parameter ZERO = 4'b0000;
	 input [N-1:0] A,B;
	 input S1,S0,M,C0;
	 output [N-1:0] data_out;
	 output C_out;
	 
	 wire [N-1:0] AND,OR,XOR,XNOR,PASS,SUM,DIFF1,DIFF2;
	 wire cand,cor,cxor,cxnor,cpass,csum,cdiff1,cdiff2;
	 wire [N-1:0] comp_A,comp_B;
	 
	 andop M0(A,B,AND);
	 assign cand = 1'bz; 
	 orop M1(A,B,OR);
	 assign cor = 1'bz;
	 xorop M2(A,B,XOR);
	 assign cxor = 1'bz;
	 xnorop M3(A,B,XNOR);
	 assign cxnor = 1'bz;
	 ripple_adder A0(A,ZERO,C0,cpass,PASS);
	 ripple_adder A1(A,B,C0,csum,SUM);
	 compop CB(B,comp_B);
	 ripple_adder A3(A,comp_B,C0,cdiff1,DIFF1);
	 compop CA(A,comp_A);
	 ripple_adder A4(comp_A,B,C0,cdiff2,DIFF2);
	 
	 mux8to1 M81({cand,AND},{cor,OR},{cxor,XOR},{cxnor,XNOR},{cpass,PASS},{csum,SUM},{cdiff1,DIFF1},{cdiff2,DIFF2},M,S1,S0,{C_out,data_out});
	 
endmodule
