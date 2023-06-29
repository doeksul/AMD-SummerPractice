// Code your design here
/*module afisare(input[31:0] in, output reg[31:0] out);
  out=in;
endmodule*/
module afisare(input clk,input[31:0] in, output reg[31:0] out);
  
  initial $readmemh("text.txt", memory);  // Read data from text file
  reg[4:0] temp=5'b0000;
   reg [31:0] memory [0:9];  
 
      
  always @(posedge clk)
    begin
      out=memory[temp];
      temp=temp+1;
    end
  
  
  
endmodule