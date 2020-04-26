//state
`define Init 4'b0000
`define S1 4'b0001
`define S2 4'b0010
`define S3 4'b0011
`define S4 4'b0100
`define S5 4'b0101
`define S6 4'b0110
`define S7 4'b0111
`define S8 4'b1000

module MooreMachine(nReset, clk, in, out);
	//input & output
	input in, nReset, clk;
	output out;
	
	//in case of FSM, output is reg type
	//reg CurState, NextState, out;
	reg [3:0] CurState, NextState;
	reg out;
	
	
	always @(posedge clk or negedge nReset)	
		//Reset
		if(!nReset) CurState <= `Init;
		//Transition
		else CurState <= NextState;
		
	
	always @(CurState or in)
		//casex includes don't care and High-Z
		casex(CurState)
			//if CurState == `Init
			`Init: begin
				if(in==0) NextState = `S1;
				else NextState = `S5;
				out = 1'b0;
			end
				
			`S1: begin
				if(in==0) NextState = `S2;
				else NextState = `S5;
				out = 1'b0;
			end
			
			`S2: begin
				if(in==0) NextState = `S3;
				else NextState = `S5;
				out = 1'b0;
			end
			
			`S3: begin
				if(in==0) NextState = `S4;
				else NextState = `S5;
				out = 1'b0;
			end
				
			`S4: begin
				if(in==0) NextState = `S4;
				else NextState = `S5;
				out = 1'b1;
			end
				
			`S5: begin
				if(in==0) NextState = `S1;
				else NextState = `S6;
				out = 1'b0;
			end
				
			`S6: begin
				if(in==0) NextState = `S1;
				else NextState = `S7;
				out = 1'b0;
			end
				
			`S7: begin
				if(in==0) NextState = `S1;
				else NextState = `S8;
				out = 1'b0;
			end
				
			`S8: begin
				if(in==0) NextState = `S1;
				else NextState = `S8;
				out = 1'b1;
			end
				
			default: begin
				NextState = `Init;
				out = 1'b0;
			end
			
		endcase
endmodule
		
					