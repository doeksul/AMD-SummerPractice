module MainDecoder(input [31:0] instruction,
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
                   output[5:0] Op); //
  

  assign Op=instruction[31:26];

  assign Funct=instruction[5:0];
  
  		 initial RegWrite=1'bx;
         initial RegDst=1'bx; 
         initial ALUSrc=1'bx;
         initial Branch=1'bx;
         initial MemWrite=1'bx;
         initial MemToReg=1'bx;
         initial ALUOp=2'bx;
         initial Jump=1'bx;
  
  //Rtype
  always @(*)
    begin
 	 casex(Op)
   	 
      //Rtype gol
       6'b000000: begin 
         RegWrite=1'b1;
         RegDst=1'b1; 
         ALUSrc=1'b0;
         Branch=1'b0;
         MemWrite=1'b0;
         MemToReg=1'b0;
         ALUOp=2'b10;
         Jump=1'b0;
       end
       //lw
       6'b100011: begin
         RegWrite=1'b1;
         RegDst=1'b0; 
         ALUSrc=1'b1;
         Branch=1'b0;
         MemWrite=1'b0;
         MemToReg=1'b1;
         ALUOp=2'b00;
         Jump=1'b0;
       end
       //sw
       6'b101011: begin
         RegWrite=1'b0;
         RegDst=1'bx; 
         ALUSrc=1'b1;
         Branch=1'b0;
         MemWrite=1'b1;
         MemToReg=1'bx;
         ALUOp=2'b00;
         Jump=1'b0;
       end
        //addi
       6'b001000: begin
         RegWrite=1'b1;
         RegDst=1'b0; 
         ALUSrc=1'b1;
         Branch=1'b0;
         MemWrite=1'b0;
         MemToReg=1'b0;
         ALUOp=2'b10;
         Jump=1'b0;
       end
       //jump
        6'b000010: begin
         RegWrite=1'b0;
         RegDst=1'bx; 
         ALUSrc=1'bx;
         Branch=1'bx;
         MemWrite=1'b0;
         MemToReg=1'bx;
         ALUOp=2'bxx;
         Jump=1'b1;
       end
       //beq

        6'b000100: begin
         RegWrite=1'b0;
         RegDst=1'bx; 
         ALUSrc=1'b0;
         Branch=1'b1;
         MemWrite=1'b0;
         MemToReg=1'b0;
         ALUOp=2'b00;
         Jump=1'b0;
       end
       
       default: begin
         ALUOp=2'bxx;
       end
       
     endcase
   	end
  	//ALU decoder
 // ALUDecoder alu(ALUOp, Funct, ALUControl);
  	
  
endmodule