`timescale 1ns/1ns

module get_PU_inputs(input[62 * 8-1:0] inputs_neuron, weights_neuron, input[3:0] round, output[63:0] selected_inputs, selected_weights);
  assign selected_weights = round < 4'd7 ? weights_neuron[(round + 1) * 64 - 1 -: 64] : {16'd0, weights_neuron[62 * 8 - 1 : 64 * 7]};
	assign selected_inputs = round < 4'd7 ? inputs_neuron[(round + 1) * 64 - 1 -: 64] : {16'd0, inputs_neuron[62 * 8 - 1 : 64 * 7]};
endmodule