`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:13 06/15/2020
// Design Name:   debounce
// Module Name:   C:/Users/Sri Aditya/Desktop/IIST FILES/VLSI_Lab/LAB-5/Q2/Q2/test.v
// Project Name:  Q2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debounce
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg button;
	reg clk;
	reg rst;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	debounce uut (
		.result(result), 
		.button(button), 
		.clk(clk), 
		.rst(rst)
	);
	
	initial begin
		
		clk = 0;
		forever #10 clk = ~clk;
		
	end
	
	initial begin
	
		rst = 1'b0;
		#200
		rst =1'b1;
		button = 1'b0;
	end
	
	always 
	begin
		#40000 button = 1'b1;
		
		#400 button = 1'b0;		
		
		#800 button = 1'b1;	
		
		#800 button = 1'b0;				
		
		#800 button = 1'b1;

		#40000 button = 1'b0;
		
		#4000 button = 1'b1;		
		
		#40000 button = 1'b0;

		#400 button = 1'b1;
		
		#800 button = 1'b0;		
		
		#800 button = 1'b1;

		#800 button = 1'b0;
		
		#40000 button = 1'b1;		
		
		#4000 button = 1'b0;

	end
   
endmodule

