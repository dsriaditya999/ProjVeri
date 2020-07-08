`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:43 06/16/2020 
// Design Name: 
// Module Name:    mul_controlpath 
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
module mul_controlpath(ldA,ldQ,DONE,ldcnt,decr,ldM,clrA,clrQ,clrFF,addsub,shiftA,shiftQ,Q0,Qm,eqz,clk,START);

	input Q0,Qm,clk,eqz,START;
	output reg ldA,ldQ,ldcnt,ldM,decr,addsub,DONE,clrA,clrQ,clrFF,shiftA,shiftQ;

	reg [2:0] state;

	parameter S0 = 3'b000,S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101,S6 = 3'b110,S7 = 3'b111;

	always @(posedge clk)

		begin
		
		case(state)
			
			
			S0 : if(START) state <= S1;
			S1 : state <= S2;
			S2 :  #2 begin
				  case({Q0,Qm})
				  
				  2'b10 : state <= S4;
				  2'b01 : state <= S3;
				  default : state <= S5;
				  endcase
				  
				  end
		   S3 : #2 state <= S5;
		   S4 :  #2 state <= S5;
		   S5 : #2 begin
				 if(({Q0,Qm} == 2'b10) && !eqz) state <= S4;
				 else if(({Q0,Qm} == 2'b01) && !eqz) state <= S3;
				 else if((({Q0,Qm} == 2'b11)||({Q0,Qm} == 2'b00)) && !eqz) state <= S5;
				 else if(eqz) state <= S6;
				 end
				 
		   S6 : state <= S6;
			
		   default : state <= S0;
			
		endcase
		
		end
		
	always @(state)
		
		begin
		
		case(state)
		
			S0 : begin
				  clrA = 0;
				  clrQ = 0;
				  clrFF = 0;
				  ldA = 0;
				  ldQ = 0;
				  ldM = 0;
				  decr = 0;
				  shiftA = 0;
				  shiftQ = 0;
				  end
				  
			S1 : begin
				  clrA = 1;
				  clrFF = 1;
				  ldM = 1;
				  ldcnt = 1;
				  end
				  
			S2 : begin
			     clrA = 0;
				  clrFF = 0;
				  ldM = 0;
				  ldcnt = 0;
				  ldQ = 1;
				  end
				  
			S3 : begin
				  addsub = 1;
				  ldA = 1;
				  ldQ = 0;
				  shiftA = 0;
				  shiftQ = 0;
				  decr = 0;
				  end
				  
			S4 : begin
				  addsub = 0;
				  ldA = 1;
				  ldQ = 0;
				  shiftA = 0;
				  shiftQ = 0;
				  decr = 0;
				  end
				  
			S5 : begin
				  ldA = 0;
				  ldQ = 0;
				  shiftA = 1;
				  shiftQ = 1;
				  decr = 1;
				  end
				  
			S6 : 	begin
					DONE  = 1;
					decr=0;
					shiftA=0;
					shiftQ=0;
					ldA=0;
					end
					
			
			default : begin
			          clrA = 0;
						 shiftA = 0;
						 ldQ = 0;
						 shiftQ = 0;
						 end
		endcase
		
		end
		
		
endmodule
