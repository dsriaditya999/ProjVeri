`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:55 06/16/2020
// Design Name:   Booth_Multiplier
// Module Name:   C:/Users/Sri Aditya/Desktop/IIST FILES/VLSI_Lab/LAB-5/Q3/Q3/test2.v
// Project Name:  Q3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Booth_Multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test2;

	// Inputs
	reg START;
	reg [7:0] M1;
	reg [7:0] M2;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Booth_Multiplier uut (
		.out(out), 
		.START(START), 
		.M1(M1), 
		.M2(M2), 
		.clk(clk)
	);
	
	initial begin
	
	clk = 0;
	forever #50 clk = ~clk;
	
	end

	initial begin
		// Initialize Inputs
		START = 0;
		M1 = 0;
		M2 = 0;


		// Wait 100 ns for global reset to finish
	
		#10
		M1 = 8'b00000100;
		M2 = 8'b00000100;
		#10
		START = 1'b1;
		#100
		START = 1'b0;
		// Add stimulus here

	end
      
endmodule

