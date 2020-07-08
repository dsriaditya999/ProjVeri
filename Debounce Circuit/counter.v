`timescale 1ns / 1ps

module counter(cout,sclr,en,clk,rst);

	input sclr,en,clk,rst;
	output cout;
	parameter N = 11;
	
	reg [N-1:0] q_present,q_next;
	
	assign cout = q_present[N-1];
	
	always @(posedge clk)
		begin
		
		if(rst == 1'b0) q_present <= {N{1'b0}};
		else q_present <= q_next;
		
		end
	
	always @(sclr,q_present,en)
		begin
		
		case({sclr,en})
		
		2'b00 : q_next <= q_present;
		2'b01 : q_next <= q_present + 1;
		default : q_next <= {N{1'b0}};
		
		endcase
		end

endmodule
