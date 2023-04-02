`timescale 1ns/1ns

module PU(input clk, rst, start, input[62*8-1:0] inputs, weights, input[7:0] bias, output[7:0] out, output ready);
  wire ld, acc_rst, mult_done, read_data_reg_ld;
  wire[3:0] round;
  PU_Datapath pd_dp(clk, rst, ld, acc_rst, read_data_reg_ld, inputs, weights, bias, round, mult_done, out);
  PU_Controller pu_cu(clk, rst, start, round, ld, acc_rst, ready, mult_done, read_data_reg_ld);
endmodule