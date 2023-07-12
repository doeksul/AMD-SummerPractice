module MUX(input sel,input[31:0] in1, input[31:0] in2, output reg [31:0] out);
  
  always @(*)
    begin
    casex(sel)
      1'b0:begin  out=in1; end
      1'b1:begin  out=in2; end
    endcase
    end
endmodule