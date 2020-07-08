`timescale 1ns / 1ps

module segment7_decoder(seg7,bcd);

input [3:0] bcd;

output reg [6:0] seg7;

always @(bcd)

case(bcd)

0 : seg7 <= 7'b1111110;
1 : seg7 <= 7'b0110000;
2 : seg7 <= 7'b1101101;
3 : seg7 <= 7'b1111001;
4 : seg7 <= 7'b0110011;
5 : seg7 <= 7'b1011011;
6 : seg7 <= 7'b1011111;
7 : seg7 <= 7'b1110000;
8 : seg7 <= 7'b1111111;
9 : seg7 <= 7'b1111011;

default : seg7 <= 7'b0000000;

endcase

endmodule
