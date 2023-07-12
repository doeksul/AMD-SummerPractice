// Code your design here
// Code your design here

//`include "LeftShift2.v"
//`include "SignExtend.v"
//`include "MUX.v"
//input Instruction[25:0],input Jump, input[31:0] ExtendedInstruction, input Branch, input Zero, output reg[31:0] NewAddr
module PC_ALU_2_MUX(input clk,input[31:0] AddrInitial,input[31:0] Instruction, input Jump, input Branch, input Zero, output reg[31:0] NewAddr);
  
  
  wire[31:0] Addr;
  wire[27:0] instruction28;
  wire[31:0] JumpAddr;
  wire [31:0] CopieAddr;
  wire BranchZero;
  wire[31:0] OutputSignExtend;
  wire[31:0] OutputLeftShift2;
  wire[31:0] OutputMux1;
  wire[31:0] OUT;
  
    //alu care adauga 4';
  
  
  assign Addr=AddrInitial+4;
  
  /*wire[25:0] Instruction26;
  assign instruction26=Instruction[25:0];
  wire[27:0] instruction28;
  assign instruction28[25:0]=instruction26;*/
  
    //abis shiftare
  assign instruction28[27:2]=Instruction[25:0];
  assign instruction28[1:0]=2'b00;
  //shiftare 2
  //assign instruction28=instruction28<<2;
  
  assign JumpAddr[31:28]=Addr[31:28];
  assign JumpAddr[27:0]=instruction28;
  
  //alu add
 
  //assign CopieAddr=AddrInitial+4; //

  SignExtend SE(Instruction, OutputSignExtend);
 
  LeftShiftBy2 LS2(OutputSignExtend, OutputLeftShift2);
  //alu efectiv
  assign CopieAddr=Addr+OutputLeftShift2; //ALU Result multe probleme aici vericul meu
  
  //AND branch zero
  
  assign BranchZero=Branch&Zero;
  
    //mux 1
  
  MUX Mux1(BranchZero, Addr,CopieAddr,OutputMux1);
  
  //mux2
  
  MUX Mux2(Jump,OutputMux1,JumpAddr,OUT);
  
  always @(posedge clk)
    begin
	 assign NewAddr=OUT;
    
  
    end
endmodule


