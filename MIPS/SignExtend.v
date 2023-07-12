module SignExtend (
  input [31:0] instruction,
  output reg [31:0] out
);

always @* begin
  out[31:16] = (instruction[15]) ? 16'b1111111111111111 : 16'b0000000000000000;
  out[15:0] = instruction[15:0];
end

endmodule