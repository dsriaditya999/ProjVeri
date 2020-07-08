`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:14 05/15/2020
// Design Name:   ALU
// Module Name:   C:/Users/Sri Aditya/Desktop/IIST FILES/VLSI_Lab/Q2_structural/TEST.v
// Project Name:  Q2_structural
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST;

	// Inputs  
	reg [3:0] A;
	reg [3:0] B; 
	reg C0;
	reg S1;
	reg S0;
	reg M;

	// Outputs 
	wire C_out;
	wire [3:0] data_out; 

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.C0(C0), 
		.S1(S1), 
		.S0(S0), 
		.M(M), 
		.C_out(C_out), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C0 = 0;
		S1 = 0;
		S0 = 0;
		M = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 4'b1100;
		B = 4'b1010;
		C0 = 0;
		S1 = 0;
		S0 = 0;
		M = 0;
		#100
		A = 4'b1100;
		B = 4'b1100;
		C0 = 0;
		S1 = 0;
		S0 = 1;
		M = 1;
		#100;
		A = 4'b1100;
		B = 4'b1010;
		C0 = 0;
		S1 = 1;
		S0 = 0;
		M = 0;
		#100
		A = 4'b1001;
		B = 4'b1000;
		C0 = 1;
		S1 = 1;
		S0 = 0;
		M = 1;
		#100
		A = 4'b0100;
		B = 4'b0110;
		C0 = 1;
		S1 = 1;
		S0 = 1;
		M = 1;
		#100
		A = 4'b0100;
		B = 4'b0110;
		C0 = 1;
		S1 = 1;
		S0 = 0;
		M = 1;
        
		// Add stimulus here

	end
      
endmodule

