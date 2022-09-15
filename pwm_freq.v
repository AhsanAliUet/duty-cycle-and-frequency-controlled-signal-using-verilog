`timescale 1ns/1ps

//In this module, T will change frequency of the signal pulse, ontime is the on time of the pulse
//offtime is the off time of the pulse which will determine the duty cycle of the wave/pulse signal

module pwm(clk, rst, ontime, offtime, pulse, T);
	input clk, rst;
	output reg pulse;

	input [3:0] ontime, offtime;
	reg [15:0] count = 0;

	//parameter T = 5;
	input [3:0] T;                //Time period of the signal pulse
	//integer max = T * (ontime + offtime);
	

	always @ (posedge clk or posedge rst)
	begin
		count <= count + 1;
		if (count > (T*(ontime + offtime))) count <= 0;
		if (rst) begin
         pulse <= 0;
         count <= 0;
      end
	end
	
	always @ (*)
	begin
		if (count < (T*(ontime))) pulse = 1;
		else pulse = 0;
	end

	
	
endmodule