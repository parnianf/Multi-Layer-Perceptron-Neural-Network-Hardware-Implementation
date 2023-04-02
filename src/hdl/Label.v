`timescale 1ns/1ns

module Label(input[79:0] output_layer_out, output reg[3:0] mnist_class);
  integer i;
	reg[3:0] max;
	always @(*) begin
    mnist_class = 4'd0;
    max = output_layer_out[7:0];
    for (i = 0; i < 10; i = i + 1) begin
      if (max < output_layer_out[i * 8 +: 8]) begin
        max = output_layer_out[i * 8 +: 8];
        mnist_class = i;
      end
    end
	end
endmodule