//8-bit Ripple Carry Adder
//Top module

module RCA(x, y, cin, cout, sum);

//input
input [7:0] x, y; //8-bit input
input cin; //1-bit

//output
output [7:0] sum; //8-bit
output cout; //1-bit


wire [6:0] carry; //carry among the FAs

FA FA0(.x(x[0]), .y(y[0]), .cin(cin), .cout(carry[0]), .sum(sum[0]));
FA FA1(.x(x[1]), .y(y[1]), .cin(carry[0]), .cout(carry[1]), .sum(sum[1]));
FA FA2(.x(x[2]), .y(y[2]), .cin(carry[1]), .cout(carry[2]), .sum(sum[2]));
FA FA3(.x(x[3]), .y(y[3]), .cin(carry[2]), .cout(carry[3]), .sum(sum[3]));
FA FA4(.x(x[4]), .y(y[4]), .cin(carry[3]), .cout(carry[4]), .sum(sum[4]));
FA FA5(.x(x[5]), .y(y[5]), .cin(carry[4]), .cout(carry[5]), .sum(sum[5]));
FA FA6(.x(x[6]), .y(y[6]), .cin(carry[5]), .cout(carry[6]), .sum(sum[6]));
FA FA7(.x(x[7]), .y(y[7]), .cin(carry[6]), .cout(cout), .sum(sum[7]));

endmodule 