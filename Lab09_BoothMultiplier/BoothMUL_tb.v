`timescale 1ns/100ps

module BoothMUL_tb;
	reg [15:0] A, B;
	
	wire ov;
	wire [31:0] Mul_result;
	
	reg [31:0] check;
	integer i, j;
	integer num_correct, num_wrong;
	
	BoothMUL booth0(.A(A), .B(B), .m(Mul_result), .ov(ov));
	
	initial begin
		num_correct = 0;
		num_wrong = 0;
		
		$display("Done");
		for(i=1; i<256; i=i+1) begin
			A=i;
			for(j=1; j<256; j=j+1) begin
				B=j;
				check = $signed(A)*$signed(B);
				
				#10
				if({ov, Mul_result} == check)
					num_correct = num_correct+1;
				else
					num_wrong = num_wrong+1;
			end
		end
		
		$display("num_correct=%d, num_wrong=%d", num_correct, num_wrong);
	end
endmodule
	

