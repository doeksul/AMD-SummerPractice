module LeftShiftBy2(
  input [31:0] input_data,
  output [31:0] output_data
);

  assign output_data = input_data << 2;

endmodule