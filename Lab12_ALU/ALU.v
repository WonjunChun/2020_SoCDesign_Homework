module ALU(valA, valB, aluop, sub, lr, cc, result);

	input [15:0] valA;
	input [15:0] valB;
	input [3:0] aluop; //need 8+ modules(3+ bit aluop)
	input sub; //Subtract or Add
	input lr; //shift Left or Right
	
	output [3:0] cc; //flags
	output [15:0] result;
	
	wire [15:0] and16b, or16b, not16b, xor16b, ashift_out, lshift_out, rotate_out, add_out, svalB, result; //svalB : subtract operand
	wire shift_co, add_co;
	wire [3:0] cc;
	wire N, Z, C, V; //condition flag
	
	assign and16b = valA & valB;
	assign or16b = valA | valB;
	assign not16b = ~valA;
	assign xor16b = valA ^ valB;
	
	Shifter arith_shifter(.shift(valB[3:0]), .lr(lr), .in(valA), .out(ashift_out)); //arithmetic shifter
	LShifter logic_shifter(.shift(valB[3:0]), .lr(lr), .in(valA), .out(lshift_out)); //logical shifter
	Rotator rotator(.shift(valB[3:0]), .lr(lr), .in(valA), .out(rotate_out));
	
	assign svalB = sub ? ~valB : valB;
	
	KSA ksadder(.A(valA), .B(svalB), .Cin(sub), .Sum(add_out), .Cout(add_co));
	
	assign result = 
		(aluop == 4'b0000) ? add_out : //4'b0000 -> ADD, SUB
		(aluop == 4'b0001) ? ashift_out : //4'b0001 -> arithmetic shift
		(aluop == 4'b0010) ? lshift_out : //4'b0010 -> logical shift
		(aluop == 4'b0011) ? rotate_out : //4'b0011 -> rotate
		(aluop == 4'b0100) ? and16b : //4'b0100 -> AND
		(aluop == 4'b0101) ? or16b : //4'b0101 -> OR
		(aluop == 4'b0110) ? not16b : //4'b0110 -> NOT
		(aluop == 4'b0111) ? xor16b : //4'b0111 -> XOR
		16'bx;
		
	assign N = result[15]; //Negative(sign bit)
	assign Z = ~|result; //Zero
	assign C = (aluop == 4'b0000) & add_co; //Carry out
	assign V = ((aluop == 4'b0001) | (aluop == 4'b0010) | (aluop == 4'b0011)) ? 
					lr & (valA > result) : 1'b0;
					
	assign cc = {N, Z, C, V};
endmodule
