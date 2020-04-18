`timescale 1ns/100ps

module Decoder_Dataflow_tb;

//input
reg [1:0] In;

//output
wire Out0, Out1, Out2, Out3;

//Decoder_Dataflow module
Decoder_Dataflow Dec(Out0, Out1, Out2, Out3, In);

//input signal begin
initial begin
	In = 2'b00;
	
	#10
	In = 2'b01;
	#10
	In = 2'b10;
	#10
	In = 2'b11;
	#10;
end
endmodule
