module FSM(nReset, clk, in, out_mealy, out_moore);
	
	input clk, nReset, in;
	output out_mealy, out_moore;
	
	MealyMachine mealy(.out(out_mealy), .nReset(nReset), .clk(clk), .in(in));
	MooreMachine moore(.out(out_moore), .nReset(nReset), .clk(clk), .in(in));
	


endmodule
