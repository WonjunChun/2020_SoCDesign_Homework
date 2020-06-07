`timescale 1ns/100ps

/*
	ADD & SUB 4'b0000
	arithmetic shift 4'b0001
	logical shift 4'b0010
	rotate 4'b0011
	AND 4'b0100
	OR 4'b0101
	NOT 4'b0110
	XOR 4'b0111
*/

module ALU_tb;

	reg [15:0] valA, valB;
	reg [3:0] aluop;
	reg sub, lr, al;
	
	wire [15:0] result;
	wire [3:0] cc;
	
	ALU alu(.valA(valA), .valB(valB), .aluop(aluop), .sub(sub), .lr(lr), .cc(cc), .result(result));
	
	initial begin
		sub = 1'b0;
		lr = 1'b0;
		al = 1'b0;
		
		//ADD
		aluop = 4'b0000;
		sub = 1'b0;
		valA = 1234;
		valB = 5678;
		
		#50;
		//ADD(carry generation)
		aluop = 4'b0000;
		sub = 1'b0;
		valA = 16'b1111111111111100;
		valB = 16'b0000000000000100;
		
		#50;
		//SUB
		aluop = 4'b0000;
		sub = 1'b1;
		valA = 16'b0111111111111111;
		valB = 16'b0000000011111111;
		
		#50;
		//left shift
		aluop = 4'b0001;
		sub = 1'b0;
		lr = 1'b1;
		valA = 16'b0011001100111111;
		valB = 16'b0000000000000100; //4bit left shift
		
		#50;
		//Arithmetic right shift
		aluop = 4'b0001;
		lr = 1'b0;
		valA = 16'b1111001100111111;
		valB = 16'b0000000000000100; //4bit arithmetic right shift
		
		#50;
		//Logical right shift
		aluop = 4'b0010;
		lr = 1'b0;
		valA = 16'b1111001100111111;
		valB = 16'b0000000000000100; //4bit logical shift
		
		#50;
		//left rotate
		aluop = 4'b0011;
		lr = 1'b1;
		valA = 16'b1111001100111111;
		valB = 16'b0000000000000100;
		
		#50;
		//right rotate
		aluop = 4'b0011;
		lr = 1'b0;
		valA = 16'b1111001100111111;
		valB = 16'b0000000000000100;
		
		#50;
		//AND
		aluop = 4'b0100;
		valA = 16'b1111000011110000;
		valB = 16'b0101010101010101;
		
		#50;
		//OR
		aluop = 4'b0101;
		
		#50;
		//NOT
		aluop = 4'b0110;
		
		#50;
		//XOR
		aluop = 4'b0111;
		
		#50;
		//NOT(Zero generation)
		aluop = 4'b0110;
		valA = 16'b1111111111111111;
		
		#50;
		
		$finish;
	end
endmodule
		
		