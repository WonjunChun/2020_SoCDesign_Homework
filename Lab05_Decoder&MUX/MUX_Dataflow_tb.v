`timescale 1ns/100ps

module MUX_Dataflow_tb;

//input
reg In0, In1, In2, In3;
reg [1:0] Sel;

//output
wire Out;

//MUX_Dataflow module
MUX_Dataflow Mux(Out, In0, In1, In2, In3, Sel);

//input signal begin
initial begin
	In0 = 1'b1;
	In1 = 1'b0;
	In2 = 1'b1;
	In3 = 1'b0;
	
	Sel = 2'b00;
	
	#10
	Sel = 2'b01;
	#10
	Sel = 2'b10;
	#10
	Sel = 2'b11;
	#10;
end
endmodule 
	