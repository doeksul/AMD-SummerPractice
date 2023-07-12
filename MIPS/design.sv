`include "PC.v"
`include "LeftShift2.v"
`include "SignExtend.v"
`include "MUX.v"
`include "InstructionMemory.v"
`include "MainDecoder.v"
`include "ALUDecoder.v"
`include "Registers.v"
`include "MUX5.v"
`include "DataMemory.v"
`include "ALU.v"

module initiateMips(input clk);
  MIPS Mips(clk);
endmodule
module MIPS(input clk);
  /*module PC_ALU_2_MUX(input clk,input[31:0] AddrInitial,input[31:0] Instruction, input Jump, input Branch, input Zero, output reg[31:0] NewAddr);*/
  
  reg [31:0] AddrInitial;
  wire [31:0] Instruction;
  wire Jump;
  wire Branch;
  wire Zero;
  wire[31:0] NewAddr;
  wire RegDst;
  wire MemRead;
  wire MemToReg;
  wire[1:0] ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;
  wire[5:0] Funct;
  wire[5:0] Op;
  wire[2:0] ALUControl;
  wire[31:0] WriteData;
  wire[31:0] ReadData1;
  wire[31:0] ReadData2;
  wire[31:0] OutMux;
  wire[31:0] ALUResult;
  wire[31:0] ReadData;
  wire [31:0] CopieInstr=Instruction;
  wire[31:0] NewCopieInstr;
  
 // initial AddrInitial =32'b000000_01001_01010_01000_00000_100000; //add t0 t1 t2 9 10 8
  initial AddrInitial=32'b00000000000000000000000000000000;
  //assign RegWrite=1'bx;
  
  
  
  PC_ALU_2_MUX Pc(clk,AddrInitial,Instruction,Jump,Branch,Zero,NewAddr); //PC
  /*module GetInstructionValue(input clk,input [31:0] Addr, output reg[31:0] Instruction);*/
  GetInstructionValue GIV(clk,NewAddr,Instruction);   //Instruction memory
  /*(input [31:0] instruction,
                   output reg RegDst, //
                   output reg Jump,
                   output reg Branch, //
                   output reg MemRead,
                   output reg MemToReg, //
                   output reg[1:0] ALUOp,
                   output reg MemWrite, //
                   output reg ALUSrc, //
                   output reg RegWrite,

                   output[5:0] Funct,
                   output[5:0] Op); //*/
  MainDecoder MD(Instruction, RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,MemWrite,ALUSrc,RegWrite,Funct,Op);
  /*module ALUDecoder(input[1:0]ALUOp,input [5:0]Funct,  output reg[2:0] ALUControl);*/
  ALUDecoder ALUD(ALUOp,Funct,ALUControl);///ALUControl
  
  /*module Registers(input clk, input[31:0] Instruction, input[31:0] WriteData, input RegWrite, input RegDst, output[31:0] ReadData1, output[31:0] ReadData2);*/
  Registers R(clk,Instruction,WriteData,RegWrite,RegDst,ReadData1,ReadData2);//registers
  //sign extend cu mux
 /* wire [31:0] CopieInstr=NewAddr;
  wire[31:0] NewCopieInstr;
  SignExtend SE(CopieInstr,NewCopieInstr);
  MUX Mux7(ALUSrc,ReadData2,NewCopieInstr,OutMux);*/
  
  SignExtend SE(CopieInstr,NewCopieInstr);
  MUX Mux7(ALUSrc,ReadData2,NewCopieInstr,OutMux);
  
  /*module ALU(input[2:0] ALUControl, input [31:0] in1, input[31:0] in2, output reg[31:0] ALUResult, output reg Zero);
  */
  
  ALU A(ALUControl,ReadData1,OutMux,ALUResult,Zero); //ALU
  
  /*module DataMemory(input clk, input[31:0] Addr, input[31:0] WriteData, input MemRead, input MemWrite, output reg[31:0] ReadData);*/
  
  // DataMemory DM(clk,NewAddr,ReadData2,MemRead,MemWrite,ReadData);
  DataMemory DM(clk,ALUResult,ReadData2,MemRead,MemWrite,ReadData);
  
  MUX Mux8(MemToReg,ALUResult,ReadData,WriteData);
//assign NewAddr=NewAddr+4;
  
endmodule