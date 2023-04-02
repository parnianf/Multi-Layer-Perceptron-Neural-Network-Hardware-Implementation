`timescale 1ns/1ns

module Controller(input clk, rst, start, ready_8_pu, output reg start_pu, output[9:0] test_index, output reg[3:0] ld_hidden_layer, output reg[1:0] ld_output_layer,
  output reg single_test_done, done);
  parameter [2:0] IDLE = 3'd0, READ_DATA = 3'd1, HIDDEN_LAYER_0 = 3'd2, HIDDEN_LAYER_1 = 3'd3,
                  HIDDEN_LAYER_2 = 3'd4, HIDDEN_LAYER_3 = 3'd5, OUTPUT_LAYER_0 = 3'd6, OUTPUT_LAYER_1 = 3'd7;
  reg [2:0] ps, ns;
  reg inc_test;
  
  Counter #10 test_cnt(clk, rst, inc_test, test_index);
  always @(*) begin
    case (ps)
      IDLE: ns = (start == 1) ? READ_DATA : IDLE;
      READ_DATA : ns = (test_index == 10'd750) ? IDLE : HIDDEN_LAYER_0;
      HIDDEN_LAYER_0 : ns = (ready_8_pu == 1'b1) ? HIDDEN_LAYER_1 : HIDDEN_LAYER_0;
      HIDDEN_LAYER_1 : ns = (ready_8_pu == 1'b1) ? HIDDEN_LAYER_2 : HIDDEN_LAYER_1;
      HIDDEN_LAYER_2 : ns = (ready_8_pu == 1'b1) ? HIDDEN_LAYER_3 : HIDDEN_LAYER_2;
      HIDDEN_LAYER_3 : ns = (ready_8_pu == 1'b1) ? OUTPUT_LAYER_0 : HIDDEN_LAYER_3;
      OUTPUT_LAYER_0 : ns = (ready_8_pu == 1'b1) ? OUTPUT_LAYER_1 : OUTPUT_LAYER_0;
      OUTPUT_LAYER_1 : ns = (ready_8_pu == 1'b1) ? READ_DATA : OUTPUT_LAYER_1;
    endcase
  end

  always @(*) begin
    {start_pu, ld_hidden_layer, ld_output_layer, single_test_done, done, inc_test} = 10'd0;    
    case (ps)    
      IDLE: done = 1'b1;
      READ_DATA : {inc_test, single_test_done} = 2'b11;
      HIDDEN_LAYER_0 : {start_pu, ld_hidden_layer[0]} = 2'b11;
      HIDDEN_LAYER_1 : {start_pu, ld_hidden_layer[1]} = 2'b11;
      HIDDEN_LAYER_2 : {start_pu, ld_hidden_layer[2]} = 2'b11;
      HIDDEN_LAYER_3 : {start_pu, ld_hidden_layer[3]} = 2'b11;
      OUTPUT_LAYER_0 : {start_pu, ld_output_layer[0]} = 2'b11;
      OUTPUT_LAYER_1 : {start_pu, ld_output_layer[1]} = 2'b11;
    endcase
  end

  always @(posedge clk, posedge rst) begin
    if(rst)
      ps <= 4'd0;
    else
      ps <= ns;
  end
endmodule
