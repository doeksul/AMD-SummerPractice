// Code your design here
module GetInstructionValue(input clk,input [31:0] Addr, output reg[31:0] Instruction);
 
  initial $readmemb("InstructionMemoryData.txt", memory);  // Read data from text file
  reg [31:0] memory [0:63];  
  //parameter[4:0] temp1=register;
  always @(posedge clk)
    begin
      Instruction<=memory[Addr/4-1];
    end
endmodule