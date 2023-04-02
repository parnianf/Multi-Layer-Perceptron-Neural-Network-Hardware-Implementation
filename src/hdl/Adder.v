`timescale 1ns/1ns

module Adder(input [20:0] in1, in2, output reg [20:0] out);	
	always @(*) begin
		if (in1[20] && in2[20])
			out = {1'b1, in1[19:0] + in2[19:0]};
		else if (!in1[20] && !in2[20])
			out = {1'b0, in1[19:0] + in2[19:0]};
		else if (in1[19:0] > in2[19:0])
			out = {in1[20], in1[19:0] - in2[19:0]};
		else if(in1[19:0] <= in2[19:0])
			out = {in2[20], in2[19:0] - in1[19:0]};
	end
endmodule