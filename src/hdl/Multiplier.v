`timescale 1ns/1ns

module Multiplier (input [7:0] in1, in2, output reg[14:0] out);
  always @(*) begin
      out[13:0] = in1[6:0] * in2[6:0];
      out[14] = in1[7] ^ in2[7];
  end
endmodule