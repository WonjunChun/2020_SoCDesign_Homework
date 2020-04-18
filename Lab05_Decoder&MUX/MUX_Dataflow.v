module MUX_Dataflow(Out, In0, In1, In2, In3, Sel);

//input & output
output Out;
input In0, In1, In2, In3;
input [1:0] Sel; //able to declare 2bit input
wire Out;

//define module
assign Out = 
	(Sel == 2'b00) ? In0 : 
	(Sel == 2'b01) ? In1 : 
	(Sel == 2'b10) ? In2 : 
	(Sel == 2'b11) ? In3 : 1'bx;
	
endmodule 