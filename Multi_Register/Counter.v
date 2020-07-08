`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:32 06/16/2020 
// Design Name: 
// Module Name:    Counter 
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
module Counter(out,ldcnt,clk,decr);

	input ldcnt,clk,decr;
	output reg [3:0] out;
	
	always @(posedge clk)
		begin
		
		if(ldcnt == 1'b1) out <= 4'b1001;
		else if(decr == 1'b1) out <= out-1;
		
		end

endmodule
