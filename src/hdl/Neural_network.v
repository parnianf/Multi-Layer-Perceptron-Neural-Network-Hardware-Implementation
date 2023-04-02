`timescale 1ns/1ns

module Neural_network(input clk, rst, start, output[3:0] mnist_class, output single_test_done, done); 
  wire[9:0] test_index;
  wire[62*8-1:0] pixels;
  wire[3:0] ld_hidden_layer;
  wire[1:0] ld_output_layer;
  wire start_pu, ready_8_pu;
  
  Test_data_split test_split(test_index, pixels);
  Datapath nn_dp(clk, rst, start_pu, ld_hidden_layer, ld_output_layer, pixels, mnist_class, ready_8_pu);
  Controller nn_cu(clk, rst, start, ready_8_pu, start_pu, test_index, ld_hidden_layer, ld_output_layer, single_test_done, done);
  
endmodule
