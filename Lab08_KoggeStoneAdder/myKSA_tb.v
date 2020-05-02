`timescale 1ns/100ps

module myKSA_tb;

//input(reg)
reg [15:0] x, y;
reg cin;

//output(wire)
wire cout;
wire [15:0] sum;

integer i, j;
integer num_correct, num_wrong;
reg [16:0] check; 

myKSA KSA0(.A(x), .B(y), .Cin(cin), .Cout(cout), .Sum(sum));

initial begin
	num_correct = 0; num_wrong = 0;
	for(i=0; i<65536; i=i+1)begin
		x=i;
		for(j=0; j<65536; j=j+1)begin
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
