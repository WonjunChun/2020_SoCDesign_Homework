`timescale 1ns/100ps

module MUX_Behavioral_tb;

//input
reg In0, In1, In2, In3;
reg Sel0, Sel1;

//output
wire Out;

//MUX_Behavioral module
MUX_Behavioral Mux(Out, In0, In1, In2, In3, Sel1, Sel0);

//input signal begin
initial begin
	In0 = 1'b0;
	In1 = 1'b1;
	In2 = 1'b0;
	In3 = 1'b1;
	
	Sel1 = 1'b0;
	Sel0 = 1'b0;
	
	#10
	Sel0 = 1'b1;
	#10
	Sel0 = 1'b0;
	Sel1 = 1'b1;
	#10
	Sel0 = 1'b1;
	#10;
	
	end
endmodule
