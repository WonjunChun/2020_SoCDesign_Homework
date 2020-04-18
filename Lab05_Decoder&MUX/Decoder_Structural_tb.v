`timescale 1ns/100ps

module Decoder_Structural_tb;

//input
reg In0, In1;
//In0 is lowest bit

//output
wire Out0, Out1, Out2, Out3;

//Decoder_Structural module
Decoder_Structural Dec(Out0, Out1, Out2, Out3, In0, In1);

//input signal begin
initial begin

	In0 = 1'b0;
	In1 = 1'b0;
	
	#10
	In0 = 1'b1;
	#10
	In0 = 1'b0;
	In1 = 1'b1;
	#10
	In0 = 1'b1;
	#10;
	
end
endmodule
	