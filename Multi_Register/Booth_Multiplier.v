`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:25 06/16/2020 
// Design Name: 
// Module Name:    Booth_Multiplier 
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
module Booth_Multiplier(out,START,M1,M2,clk);

	parameter N = 8;
	output reg [2*N-1:0] out;
	input [N-1:0] M1,M2;
	input clk,START;
	//out_A,out_Q,Qm,eqz,Q0,ldA,ldQ,clrA,shiftA,clrQ,shiftQ,ldM,clrFF,addsub,clk,m_in_1,m_in_2,ldcnt,decr
	
	//control ldA,ldQ,DONE,ldcnt,decr,ldM,clrA,clrQ,clrFF,addsub,shiftA,shiftQ,Q0,Qm,eqz,clk,START
	
	wire ldA,ldQ,ldM,shiftA,shiftQ,ldcnt,decr,clrA,clrQ,clrFF,addsub,DONE,Q0,QM,eqz;
	wire [N-1:0] out1,out2;
	
	mul_controlpath CON(ldA,ldQ,DONE,ldcnt,decr,ldM,clrA,clrQ,clrFF,addsub,shiftA,shiftQ,Q0,Qm,eqz,clk,START);
	mul_datapath DAT(out1,out2,Qm,eqz,Q0,ldA,ldQ,clrA,shiftA,clrQ,shiftQ,ldM,clrFF,addsub,clk,M1,M2,ldcnt,decr);
	
	always @(posedge clk)
		begin
		
		if(DONE == 1'b1) out <= {out1,out2};
		
		end

endmodule
