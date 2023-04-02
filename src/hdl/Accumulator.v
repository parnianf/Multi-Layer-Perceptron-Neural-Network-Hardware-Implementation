`timescale 1ns/1ns

module Accumulator(input clk, rst, en, input[20:0] in, output reg[20:0] out);
  wire[20:0] adder_out;
  Adder adder(in, out, adder_out);
  always @(posedge clk, posedge rst) begin
    if(rst) 
      out <= 21'd0;
    else if(en) 
      out <= adder_out;
    else 
      out <= out;
  end
endmodule