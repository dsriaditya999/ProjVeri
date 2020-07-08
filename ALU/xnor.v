`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:36 05/15/2020 
// Design Name: 
// Module Name:    xnor 
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
module xnor(
    );
	 parameter N=4;
	 input [N-1:0] A,B;
	 output [N-1:0] C;
	 genvar p;
	 
	 generate 
	 for(p = 0; p<N; p = p+1)
	 begin : xn1p
	 xnor XNG(C[p],A[p],B[p]);
	 end
	 endgenerate


endmodule
