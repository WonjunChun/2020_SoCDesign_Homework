module Decoder_Behavioral(Out0, Out1, Out2, Out3, In0, In1);

//input & output
output Out0, Out1, Out2, Out3;
input In0, In1;
reg Out0, Out1, Out2, Out3;

always @(In0 or In1) //while signal is exist
	begin
		case ({In1, In0}) //concatenate In1, In0
		2'b00 : Out0 = 1'b1;
		default : Out0 = 1'b0;
		endcase
	end

always @(In0 or In1) //while signal is exist
	begin
		case ({In1, In0}) //concatenate In1, In0
		2'b01 : Out1 = 1'b1;
		default : Out1 = 1'b0;
		endcase
	end

always @(In0 or In1) //while signal is exist
	begin
		case ({In1, In0}) //concatenate In1, In0
		2'b10 : Out2 = 1'b1;
		default : Out2 = 1'b0;
		endcase
	end

always @(In0 or In1) //while signal is exist
	begin
		case ({In1, In0}) //concatenate In1, In0
		2'b11 : Out3 = 1'b1;
		default : Out3 = 1'b0;
		endcase
	end
endmodule
