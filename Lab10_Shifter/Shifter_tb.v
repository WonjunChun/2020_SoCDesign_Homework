`timescale 1ns/100ps

module Shifter_tb;
//Shifter, Rotator testbench

	wire [15:0] Sout, Rout;
	reg [15:0] in;
	reg [3:0] shift;
	reg lr;
	
	Shifter sh(.shift(shift), .lr(lr), .in(in), .out(Sout));
	Rotator ro(.shift(shift), .lr(lr), .in(in), .out(Rout));
	
	initial begin
		#10;
		in = 16'b0100101001100011;
		lr = 1'b0;
		shift = 4'b0100;
		#10;
		shift = 4'b1000;
		#10
		lr = 1'b1;
		shift = 4'b0100;
		#10
		shift = 4'b1000;
	end
endmodule
