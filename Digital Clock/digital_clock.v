`timescale 1ns / 1ps

module digital_clock(

// IO Pins

input reset, //Active high reset pulse which sets the real time according to the input and sets the alarm and 
             //timer's time to 0
input clk, // 10 Hz clock input

input [1:0] H_in1, // MSB of Hour - 2 bit input

input [3:0] H_in2, // LSB of Hour - 4 bit input

input [3:0] M_in1, // MSB of Minute - 4 bit input

input [3:0] M_in2, // LSB of Minute - 4 bit input

input LD_time, // Loads time to real-time clock

input LD_alarm, // Loads time to alarm clock

input LD_timer, // Loads required time to timer (max 15 min)

input timer_ON, // Switches on the timer

input AL_ON, // Switches on the alarm

input STOP_ALtm, // Switches off the timer or alarm output

input stop_watch, // Switches the display from real-time from stop-watch display and viceversa

input start_stop, // Starts the stop-watch and stops it and remains in the stopwatch screen until the stop_watch goes low

output reg indicator, // Gives alarm and timer's output


output [1:0] H_out1, // MSB of Hour - 2 bit output

output [3:0] H_out2, // LSB of Hour - 4 bit output

output [3:0] M_out1, // MSB of Minute - 4 bit output

output [3:0] M_out2, // LSB of Minute - 4 bit output 

output [3:0] S_out1, // MSB of Second - 4 bit output

output [3:0] S_out2, // LSB of Second - 4 bit output

output [6:0] d_6,d_5,d_4,d_3,d_2,d_1 // 7 segment display for output

 
);

//Internal 

reg clk_1s; // The working 1 second real_time clock

reg [3:0] temp1; // Loop variable for clock generation

reg [5:0] r_hour,r_min,r_sec; //temporary variables for real-time clock

reg [9:0] t_timer; // Timer counting variable

reg [1:0] c_hour1,a_hour1; // MSB of hour digit

reg [3:0] c_hour0,a_hour0; // LSB of hour digit

reg [3:0] c_min1,a_min1; // MSB of minute digit

reg [3:0] c_min0,a_min0; // LSB of minute digit

reg [3:0] c_sec1,a_sec1; // MSB of second digit

reg [3:0] c_sec0,a_sec0; // LSB of second digit

reg [5:0] h_hour,h_min,h_sec; //temporary variables for real-time clock


//Clock 1s GENERATION
always @(posedge clk or posedge reset)
	begin
	if(reset)
		begin
		temp1 <= 0;
		clk_1s <=0;
		end

	else
		begin
		temp1 <= temp1+1;
		
		if(temp1<=5) clk_1s <= 0;
		
		else if(temp1>=10) 
			begin
			clk_1s <= 1;
			temp1 <= 1;
			end
			
		else clk_1s <= 1;
		
		end
		
	end

//Real-Time clock section
always @(posedge clk_1s or posedge reset)
	begin
	if(reset)
		begin
		r_hour <= H_in1*10 + H_in2;
		r_min <= M_in1*10 + M_in2;
		r_sec <= 0;
		end

	else
		begin
		if(LD_time)
			begin
			r_hour <= H_in1*10 + H_in2;
			r_min <= M_in1*10 + M_in2;
			r_sec <= 0;
			end

		else
			begin
			r_sec <= r_sec + 1;
			if(r_sec >= 59)
				begin
				r_min <= r_min + 1;
				r_sec <= 0;
				if(r_min >= 59)
					begin
					r_hour <= r_hour + 1;
					r_min <= 0;
					if(r_hour >= 24)
						begin
						r_hour <= 0;
						end
					end
				end
			end
		end
	end

// Timer Operation

always @(posedge clk_1s or posedge reset)
	begin
	if(reset) 
		begin
		indicator <= 0;

		end

	else 
		begin
		if(LD_timer) 
			begin
			t_timer <= M_in1*600 + M_in2*60;
			end
		else 
			begin
			if(timer_ON) 
				begin
				t_timer <= t_timer-1;
				
				if(t_timer==0) indicator <= 1;
				
				end
				
				if(STOP_ALtm) indicator <= 0;
			end
		end
	end

// Alarm Operation

always @(posedge clk_1s or posedge reset)
	begin
	if(reset) 
		begin
		indicator <= 0;

		end

	else 
		begin

		if(LD_alarm) 
			begin
			a_hour1 <= H_in1;
			a_hour0 <= H_in2;
			a_min1 <= M_in1;
			a_min0 <= M_in2;
			a_sec1 <= 4'b0000;
			a_sec0 <= 4'b0000;
			end

		else 
			begin
			if({a_hour1,a_hour0,a_min1,a_min0,a_sec1,a_sec0} == {c_hour1,c_hour0,c_min1,c_min0,c_sec1,c_sec0}) 
				begin
				
				if(AL_ON) indicator <= 1;
				
				end
				
			if(STOP_ALtm) indicator <= 0;
			
			end
		end
	end

// STOPWATCH operation

always @(posedge clk_1s or posedge reset)
	begin
	if(reset)
		begin
		h_hour <= 0;
		h_min <= 0;
		h_sec <= 0;
		end

	else 
		begin
		if(stop_watch) 
			begin
			//h_hour <= 0;
			//h_min <= 0;
			//h_sec <= 0;

			if(start_stop) 
				begin
				h_sec <= h_sec + 1;
				if(r_sec >= 59)
					begin
					h_min <= h_min + 1;
					h_sec <= 0;
					if(r_min >= 59)
						begin
						h_hour <= h_hour + 1;
						h_min <= 0;
						if(h_hour >= 24)
							begin
							h_hour <= 0;
							end
						end
					end
				end
			end

		else 
			begin
			h_hour <= 0;
			h_min <= 0;
			h_sec <= 0;
			end
		end
	end

// Helping function for output
function [3:0] mod_10(input [5:0] number);
	begin
	if(number>=50) 
		begin
		mod_10 = 5;
		end
	else if(number>=40) 
		begin
		mod_10 = 4;
		end
	else if(number>=30) 
		begin
		mod_10 = 3;
		end
	else if(number>=20)
		begin
		mod_10 = 2;
		end
	else if(number>=10) 
		begin
		mod_10 = 1;
		end
	else 
		begin
		mod_10 = 0;
		end
	end
endfunction

//Output Control of the Digital Clock
always @(*)
	begin
	if(stop_watch) 
		begin
		 if(h_hour>=20) 
			begin
			c_hour1 = 2;
         end
		else 
			begin
			
			if(h_hour >=10) c_hour1  = 1;
			
			else c_hour1 = 0;
			
			end
			
		c_hour0 = h_hour - 10*c_hour1;
		c_min1 = mod_10(h_min);
		c_min0 = h_min - 10*c_min1;
		c_sec1 = mod_10(h_sec);
		c_sec0 = h_sec - 10*c_sec1;
		end
	else 
		begin
		
		if(r_hour>=20) 
			begin
			c_hour1 = 2;
         end
		else 
			begin
			
			if(r_hour >=10) c_hour1  = 1;
			
			else c_hour1 = 0;
			
			end
		c_hour0 = r_hour - 10*c_hour1;
		c_min1 = mod_10(r_min);
		c_min0 = r_min - 10*c_min1;
		c_sec1 = mod_10(r_sec);
		c_sec0 = r_sec - 10*c_sec1;
		end

	end
	
assign H_out1 = c_hour1;
assign H_out2 = c_hour0;
assign M_out1 = c_min1;
assign M_out2 = c_min0;
assign S_out1 = c_sec1;
assign S_out2 = c_sec0;

// Clock Display 
segment7_decoder s1(d_6,{{1'b0,1'b0},c_hour1});
segment7_decoder s2(d_5,c_hour0);
segment7_decoder s3(d_4,c_min1);
segment7_decoder s4(d_3,c_min0);
segment7_decoder s5(d_2,c_sec1);
segment7_decoder s6(d_1,c_sec0);

endmodule
