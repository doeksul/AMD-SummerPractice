// Code your design here


module DataMemory(input clk, input[31:0] Addr, input[31:0] WriteData, input MemRead, input MemWrite, output reg[31:0] ReadData);
  
  reg cnt;
  initial cnt=1'b0;
  
  
  
  reg [31:0] memory [0:31];  
  reg[31:0] tempWriteData;
  wire[31:0] verificareDataMemoryValoare;
  wire[31:0] verificareDataMemoryAdresa;
  
  
    always @(posedge clk)
       begin
         
         if(cnt==1'b0)
           begin
             $readmemb("DataMemoryData.txt", memory);  // Read data from text file
             cnt=1'b1;
           end
         
        tempWriteData=WriteData;
         
      if(MemWrite==1'b1)
        begin
          memory[Addr/4]=tempWriteData;
          ReadData=tempWriteData;
        end

      else if(MemRead==1'b1)
        begin
          tempWriteData=memory[Addr/4];
          ReadData=tempWriteData;
        end
      
    end
  
  assign verificareDataMemoryValoare=memory[Addr/4];
  assign verificareDataMemoryAdresa=Addr/4;
  
endmodule

/*module GetRegisterValue(input clk,input [31:0] register, output reg[31:0] out);
 
   initial $readmemh("data.txt", memory);  // Read data from text file
  reg [31:0] memory [0:63];  
  //parameter[4:0] temp1=register;
  always @(posedge clk)
    begin
      out<=memory[register/4+32];
    end
endmodule*/