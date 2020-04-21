`timescale 1ns/100ps

module RCA_tb;

//input(reg)
reg [7:0] x, y;
reg cin;

//output(wire)
wire cout;
wire [7:0] sum;

integer i, j;
integer num_correct, num_wrong;
reg [8:0] check; 

RCA RCA0(.x(x), .y(y), .cin(cin), .cout(cout), .sum(sum));

initial begin
	num_correct = 0; num_wrong = 0;
	for(i=0; i<16; i=i+1)begin
		x=i;
		for(j=0; j<16; j=j+1)begin
			y=j;
			cin = 1'b0;
			check = x + y + cin;
			
			#10
			if({cout, sum} == check)
				num_correct = num_correct+1;
			else
				num_wrong = num_wrong+1;
		end 
	end
	
	$display("num_correct = %d, num_wrong = %d", num_correct, num_wrong); //print
end
endmodule	