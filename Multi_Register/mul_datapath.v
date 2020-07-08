`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:05 06/16/2020 
// Design Name: 
// Module Name:    mul_datapath 
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
module mul_datapath(out_A,out_Q,Qm,eqz,Q0,ldA,ldQ,clrA,shiftA,clrQ,shiftQ,ldM,clrFF,addsub,clk,m_in_1,m_in_2,ldcnt,decr);

	output Qm,Q0,eqz;
	parameter N = 8;
	parameter NC = 1'bz;
	output [N-1:0] out_A,out_Q;
	input [N-1:0] m_in_1,m_in_2;
	input ldA,ldQ,ldM,clrA,clrQ,clrFF,shiftA,shiftQ,clk,addsub,ldcnt,decr;
	wire [N-1:0] A,M,Q,Z;
	wire [3:0] count;
	wire s_out_A,s_out_Q,dum;
	
	assign Q0 = Q[0];
	assign eqz = ~|count;
	assign out_A = A;
	assign out_Q = Q;
	// dout,shift_out,din,ld,clk,shift_in,a_shift,shift_l,shift_r,clr
	Multi_register A1(A,s_out_A,Z,ldA,clk,NC,shiftA,NC,NC,clrA);
	Multi_register Q1(Q,s_out_Q,m_in_2,ldQ,clk,s_out_A,NC,NC,shiftQ,clrQ);
	
	D_FF RQ(Qm,s_out_Q,clk,clrFF);
	
	Multi_register M1(M,dum,m_in_1,ldM,clk,NC,NC,NC,NC,NC);
	
	ALU Alu1(Z,A,M,addsub);
	
	Counter C1(count,ldcnt,clk,decr);

endmodule
