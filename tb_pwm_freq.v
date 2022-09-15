`timescale 1ns/1ps

module tb_pwm;
	reg clk, rst;
	reg [3:0] ontime, offtime, T;
	wire pulse;
	pwm my_pwm_DUT(clk, rst, ontime, offtime, pulse, T);
	
	initial begin
		clk = 0;
	end
	
	always #5 clk = ~clk;
	
	initial begin
		rst = 1;
		#5;
		rst = 0;
		ontime = 10;
		offtime = 5;
		T = 5;
		#5000;
		
		ontime = 10;
		offtime = 5;
		T = 10;
		#5000;		

		ontime = 10;
		offtime = 5;
		T = 15;
		#5000;
		
		ontime = 8;
		offtime = 7;
		T = 15;
		#5000;

		ontime = 8;
		offtime = 7;
		T = 15;
		#5000;

		ontime = 5;
		offtime = 10;
		T = 15;
		#5000;

		ontime = 2;
		offtime = 13;
		T = 15;
		#5000;
	end
endmodule
		