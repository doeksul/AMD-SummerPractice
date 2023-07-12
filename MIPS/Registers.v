// Code your design here
//`include "MUX.v"
module Registers(input clk, input[31:0] Instruction, input[31:0] WriteData, input RegWrite, input RegDst, output[31:0] ReadData1, output[31:0] ReadData2);
    
  reg [31:0] memory [0:31];  
  reg cnt=1'b0;
  
  
  
  reg[4:0] tempReadData1;
  reg[4:0] tempReadData2;
  reg[4:0] Instruction3;
  wire[4:0] WriteRegister;
  MUX5 Mux4(RegDst,Instruction[20:16], Instruction[15:11],WriteRegister);
  reg [4:0] tempWriteRegister;
  
  
  
  always @(posedge clk)
    begin
      if(cnt==1'b0)
        begin
          $readmemb("RegistersData.txt", memory);  // Read data from text file
          cnt=1'b1;
          
        end
      tempReadData1=memory[Instruction[25:21]-1];
      tempReadData2=memory[Instruction[20:16]-1];
      
      /*tempReadData1=Instruction[25:21];
      tempReadData2=Instruction[20:16];*/
      
      tempWriteRegister=WriteRegister;
      //scriere data in writeRegister
      if(RegWrite==1'b1)
        begin
          memory[tempWriteRegister-1]=WriteData;
      
        end
    end
  	/*assign ReadData1=tempReadData1;
    assign ReadData2=tempReadData2;*/
  
  assign ReadData1=memory[Instruction[25:21]-1];
  assign ReadData2=memory[Instruction[20:16]-1];
  

  //verificare valoare registrii vericu
  
  wire[31:0] t0=memory[7];
  wire[31:0] t1=memory[8];
  wire[31:0] t2=memory[9];
  wire[4:0] verificareWriteRegister=tempWriteRegister-1;

endmodule