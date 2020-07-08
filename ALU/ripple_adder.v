`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:41 05/15/2020 
// Design Name: 
// Module Name:    ripple_adder 
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
module ripple_adder(A,B,Cin,Cout,S
    );
	 parameter N = 4;
	 input [N-1:0] A,B;
	 input Cin;
	 output [N-1:0] S;
	 output Cout;
	 wire [N:0] carry;
	 assign carry[0] = Cin; 
	 assign Cout = carry[N];
	 initial begin
	 
	 end
	 genvar p;
	 generate
	 for(p=0;p<N;p=p+1)
	 begin : fa_loop
	 full_adder FA(A[p],B[p],carry[p],carry[p+1],S[p]);
	 end
	 endgenerate


endmodule
