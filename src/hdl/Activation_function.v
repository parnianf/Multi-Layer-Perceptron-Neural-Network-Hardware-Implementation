`timescale 1ns/1ns

module ActivationFunction(input[20:0] in, output[7:0] out);
  wire [20:0] relu_out;
  assign relu_out = in[20] ? 21'd0 : in;
  assign out = (relu_out > 21'd127) ? {1'b0, 7'd127} : {1'b0, relu_out[6:0]}; //saturation
endmodule