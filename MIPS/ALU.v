// Code your design here
module ALU(input[2:0] ALUControl, input [31:0] in1, input[31:0] in2, output reg[31:0] ALUResult, output reg Zero);
  
  always @(*)
    begin
      casex(ALUControl)
        3'b010: ALUResult=in1+in2; //add
        3'b110: ALUResult=in1-in2; //subtract
       
        3'b000: ALUResult=in1&in2; //and
        3'b001: ALUResult=in1|in2; //or
        3'b111: ALUResult=in1<in2? 1:0; //set less than
      endcase
      if(in1==in2)
        Zero=1'b1;
    end

endmodule