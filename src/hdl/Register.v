`timescale 1ns/1ns

module Register #(parameter N = 8) (input clk, rst, ld, input[N-1:0] in, output reg[N-1:0] out);
	always @(posedge clk, posedge rst) begin
		if (rst) 
			out <= 0;
		else if (ld) 
			out <= in;
	end
endmodule