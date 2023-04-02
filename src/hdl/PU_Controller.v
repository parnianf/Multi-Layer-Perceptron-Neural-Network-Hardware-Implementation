`timescale 1ns/1ns

module PU_Controller(input clk, rst, start, output [3:0] round, output reg ld, rst_acc, ready, mult_done, read_data_reg_ld);
  parameter [1:0] READ_DATA = 2'd0, MULTIPLY = 2'd1, ADD = 2'd2, WRITE_REGISTER = 2'd3;
  reg [1:0] ps, ns;
  reg en, rst_cnt;
  Counter #4 cnt(clk, rst_cnt, en, round);
  
  always @(*) begin
    case (ps)
      READ_DATA: ns = start ? MULTIPLY : READ_DATA;
      MULTIPLY: ns = (round == 6'd7) ? ADD : MULTIPLY;
      ADD: ns = WRITE_REGISTER;
      WRITE_REGISTER: ns = READ_DATA;
    endcase
  end
  
  always @(*) begin
    {en, rst_acc, ld, ready, mult_done, rst_cnt, read_data_reg_ld} = 7'd0;
    case (ps)
      READ_DATA: {rst_acc, rst_cnt, read_data_reg_ld} = 3'b111;
      MULTIPLY: {en, ld} = 2'b11;
      ADD: {mult_done, ld} = 2'b11;
      WRITE_REGISTER: ready = 1'b1;
    endcase
  end

  always @(posedge clk, posedge rst) begin
    if(rst)
      ps <= 2'd0;
    else
      ps <= ns;
  end
endmodule

