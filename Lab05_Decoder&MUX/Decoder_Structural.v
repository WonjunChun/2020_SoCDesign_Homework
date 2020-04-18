module Decoder_Structural(Out0, Out1, Out2, Out3, In0, In1);

//input & output
output Out0, Out1, Out2, Out3; //4bit
input In0, In1; //2bit

wire NotIn0, NotIn1;

not not0 (NotIn0, In0);
not not1 (NotIn1, In1);

and and0 (Out0, NotIn0, NotIn1);
and and1 (Out1, In0, NotIn1);
and and2 (Out2, NotIn0, In1);
and and3 (Out3, In0, In1);

endmodule
