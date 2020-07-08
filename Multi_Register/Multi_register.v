`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:15 06/16/2020 
// Design Name: 
// Module Name:    Multi_register 
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
module Multi_register(dout,shift_out,din,ld,clk,shift_in,a_shift,shift_l,shift_r,clr);
	
	parameter N = 8;
	
	input [N-1:0] din;
	input ld,clk,shift_in,shift_l,shift_r,a_shift,clr;
	output reg shift_out;
	output reg [N-1:0] dout;
	
	always @(posedge clk)
		begin
		
		if(clr == 1'b1) dout <= 8'b0;
		
		else if(ld) dout <= din;
		
		else if(a_shift == 1'b1)
			begin
			dout <= {dout[N-1],dout[N-1:1]};
			shift_out <= dout[0];
			end
			
		else if(shift_l == 1'b1)
			begin
			dout <= {dout[N-2:0],shift_in};
			shift_out <= dout[N-1];
			end
			
		else if(shift_r == 1'b1)
			begin
			dout <= {shift_in,dout[N-1:1]};
			shift_out <= dout[0];
			end
			
		else dout <= dout;
			
		end
		
endmodule
