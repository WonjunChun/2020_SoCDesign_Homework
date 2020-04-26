//state
`define Init 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100
`define S5 3'b101
`define S6 3'b110

module MealyMachine(nReset, clk, in, out);
	//input & output
	input in, nReset, clk;
	output out;
	
	//in case of FSM, output is reg type
	reg [2:0] CurState, NextState;
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
				if(in==0) begin //input == 0
					NextState = `S1;
					out = 1'b0;
				end
				else begin //input == 1
					NextState = `S4;
					out = 1'b0;
				end
			end
				
			`S1: begin
				if(in==0) begin
					NextState = `S2;
					out = 1'b0;
				end
				else begin
					NextState = `S4;
					out = 1'b0;
				end
			end
				
			`S2: begin
				if(in==0) begin
					NextState = `S3;
					out = 1'b0;
				end
				else begin
					NextState = `S4;
					out = 1'b0;
				end
			end
				
			`S3: begin
				if(in==0) begin
					NextState = `S3;
					out = 1'b1;
				end
				else begin
					NextState = `S4;
					out = 1'b0;
				end
			end
				
			`S4: begin
				if(in==0) begin
					NextState = `S1;
					out = 1'b0;
				end
				else begin
					NextState = `S5;
					out = 1'b0;
				end
			end
			
			`S5: begin
				if(in==0) begin
					NextState = `S1;
					out = 1'b0;
				end
				else begin
					NextState = `S6;
					out = 1'b0;
				end
			end
				
			`S6: begin
				if(in==0) begin
					NextState = `S1;
					out = 1'b0;
				end
				else begin
					NextState = `S6;
					out = 1'b1;
				end
			end
				
			default: begin
				NextState = `Init;
				out = 1'b0;
			end
			
		endcase
endmodule
		
					