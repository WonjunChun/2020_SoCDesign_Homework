module Decoder_Dataflow(Out0, Out1, Out2, Out3, In);

//input & output
output Out0, Out1, Out2, Out3;
input [1:0] In; //2bit
wire Out0, Out1, Out2, Out3;

//define module
assign Out0 = 
	(In == 2'b00) ? 1'b1 : 1'b0;
	
assign Out1 = 
	(In == 2'b01) ? 1'b1 : 1'b0;
	
assign Out2 = 
	(In == 2'b10) ? 1'b1 : 1'b0;
	
assign Out3 = 
	(In == 2'b11) ? 1'b1 : 1'b0;
	
endmodule 