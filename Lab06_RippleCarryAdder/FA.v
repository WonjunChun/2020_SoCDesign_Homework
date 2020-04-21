//Full Adder
module FA(x, y, cin, cout, sum);

//input & output
input x, y, cin;
output cout, sum;

//assign {cout, sum} = a + b + c; //using concate, cout : higher bit, sum : lower bit
assign {cout, sum} = x + y + cin;

endmodule 