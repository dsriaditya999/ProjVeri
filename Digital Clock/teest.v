`timescale 1ns / 1ps

module teest;

	// Inputs
	reg reset;
	reg clk;
	reg [1:0] H_in1;
	reg [3:0] H_in2;
	reg [3:0] M_in1;
	reg [3:0] M_in2;
	reg LD_time;
	reg LD_alarm;
	reg LD_timer;
	reg timer_ON;
	reg AL_ON;
	reg STOP_ALtm;
	reg stop_watch;
	reg start_stop;

	// Outputs
	wire indicator;
	wire [1:0] H_out1;
	wire [3:0] H_out2;
	wire [3:0] M_out1;
	wire [3:0] M_out2;
	wire [3:0] S_out1;
	wire [3:0] S_out2;
	wire [6:0] d_6;
	wire [6:0] d_5;
	wire [6:0] d_4;
	wire [6:0] d_3;
	wire [6:0] d_2;
	wire [6:0] d_1;


	// Instantiate the Unit Under Test (UUT)
	digital_clock uut (
		.reset(reset), 
		.clk(clk), 
		.H_in1(H_in1), 
		.H_in2(H_in2), 
		.M_in1(M_in1), 
		.M_in2(M_in2), 
		.LD_time(LD_time), 
		.LD_alarm(LD_alarm), 
		.LD_timer(LD_timer), 
		.timer_ON(timer_ON), 
		.AL_ON(AL_ON), 
		.STOP_ALtm(STOP_ALtm), 
		.stop_watch(stop_watch), 
		.start_stop(start_stop), 
		.indicator(indicator), 
		.H_out1(H_out1), 
		.H_out2(H_out2), 
		.M_out1(M_out1), 
		.M_out2(M_out2), 
		.S_out1(S_out1), 
		.S_out2(S_out2), 
		.d_6(d_6), 
		.d_5(d_5), 
		.d_4(d_4), 
		.d_3(d_3), 
		.d_2(d_2), 
		.d_1(d_1)

	);


	initial begin
	
	clk = 0;
	forever #50 clk = ~clk;
	
	end

	initial begin
		// Initialize Inputs
		reset = 1;
		H_in1 = 1;
		H_in2 = 0;
		M_in1 = 3;
		M_in2 = 0;
		LD_time = 1;
		LD_alarm = 0;
		LD_timer = 0;
		timer_ON = 0;
		AL_ON = 0;
		STOP_ALtm = 0;
		stop_watch = 0;
		start_stop = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#2
		
		reset = 0;
		LD_time = 0;
		
		#100
		
		LD_alarm = 1;
		AL_ON = 1;
		H_in1 = 1;
		H_in2 = 0;
		M_in1 = 4;
		M_in2 = 0;
		
		#1000
		
		LD_alarm = 0;
		
		#1000000
		
		STOP_ALtm = 1;
		
		#10000
		STOP_ALtm = 0;
		AL_ON = 0;
		
		
		#300000
		
		LD_timer = 1;
		timer_ON = 1;
		H_in1 = 0;
		H_in2 = 0;
		M_in1 = 0;
		M_in2 = 1;
		
		
		#10000
		
		LD_timer = 0;
		
		#200000
		
		STOP_ALtm = 1;
		
		#10000
		STOP_ALtm = 0;
		timer_ON = 0;
		
		stop_watch = 1;
		#100000
		
		start_stop = 1;
		
		#200000
		start_stop = 0;
		
		#100000
		stop_watch = 0;

		// Add stimulus here

	end
      
endmodule
