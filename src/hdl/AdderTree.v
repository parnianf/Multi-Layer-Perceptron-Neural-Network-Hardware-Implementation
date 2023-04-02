`timescale 1ns/1ns
module AdderTree(input[14:0] in1, in2, in3, in4, in5, in6, in7, in8, output[20:0] res);
  wire [20:0] temp_res1, temp_res2, temp_res3, temp_res4, temp_res5, temp_res6;
  Adder layer0_1({in1[14], 6'd0, in1[13:0]}, {in2[14], 6'd0, in2[13:0]}, temp_res1);
  Adder layer0_2({in3[14], 6'd0, in3[13:0]}, {in4[14], 6'd0, in4[13:0]}, temp_res2);
  Adder layer0_3({in5[14], 6'd0, in5[13:0]}, {in6[14], 6'd0, in6[13:0]}, temp_res3);
  Adder layer0_4({in7[14], 6'd0, in7[13:0]}, {in8[14], 6'd0, in8[13:0]}, temp_res4);
  Adder layer1_1(temp_res1, temp_res2, temp_res5);
  Adder layer1_2(temp_res3, temp_res4, temp_res6);
  Adder layer2_1(temp_res5, temp_res6, res);
endmodule