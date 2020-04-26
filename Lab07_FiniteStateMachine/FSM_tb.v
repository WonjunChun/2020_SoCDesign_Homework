`timescale 1ns/100ps

module FSM_tb;
	reg clk, nReset, in;
	wire out_mealy, out_moore;
	
	always
		#2.5 clk = ~clk;
		
	FSM myFSM(.nReset(nReset), .clk(clk), .in(in), .out_mealy(out_mealy), .out_moore(out_moore));
	
	initial begin
		clk = 1'b0;
		nReset = 1'b1;
		#5 nReset = 1'b0;
		#5 nReset = 1'b1;
		
		in = 1'b0;
		#10 in = 1'b1;
		#5 in = 1'b0;
		#20 in = 1'b1;
		#25 in = 1'b0;
		#10
		
		$finish;
	
	end
endmodule
