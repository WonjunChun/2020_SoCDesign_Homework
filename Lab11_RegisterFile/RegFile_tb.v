`timescale 1ns/100ps

module RegFile_tb;
	
	reg clk, nRESET, write_en;
	reg [3:0] write_addr, read_addr_A, read_addr_B;
	reg [15:0] write_data;
	
	wire [15:0] read_data_A, read_data_B;
	
	RegFile regfile(.clk(clk), .nRESET(nRESET),
						.write_en(write_en), .write_addr(write_addr), .write_data(write_data),
						.read_addr_A(read_addr_A), .read_addr_B(read_addr_B),
						.read_data_A(read_data_A), .read_data_B(read_data_B));
	
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
		nRESET = 1;
		#5;
		nRESET = 0;
		#5;
		nRESET = 1;
		
		#5
		write_en = 1;
		write_addr = 4'b0000;
		write_data = 16'b1001011000011100;
		
		#15
		write_addr = 4'b0001;
		write_data = 16'b1111111111111111;
		
		#10
		write_en = 0;
		read_addr_A = 4'b0000;
		read_addr_B = 4'b0001;
		
		#10
		$finish;
		
	end
endmodule
