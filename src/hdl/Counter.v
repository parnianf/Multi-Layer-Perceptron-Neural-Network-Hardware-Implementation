`timescale 1ns/1ns

module Counter #(parameter N = 10)(input clk, rst, en, output reg [N-1:0] cnt);
  always @(posedge clk, posedge rst) begin
    if (rst)
      cnt <= 0;
    else if (en)
      cnt <= cnt + 1;
  end
endmodule
