// Code your design here
module ALUDecoder(input[1:0]ALUOp,input [5:0]Funct,  output reg[2:0] ALUControl);
  always @(*)
    begin
      casex({ALUOp,Funct })
          
        {2'b00,6'bxxxxxx}: begin
           ALUControl=3'b010; //add
          end
          
        {2'bx1,6'bxxxxxx}: begin
            ALUControl=3'b110; //subtract
          end
          //add
        {2'b1x,6'b100000}: begin
            ALUControl=3'b010; //add
          end
        //addi
        {2'b1x,6'b001000}: begin
            ALUControl=3'b010; //addi
          end
          //sub
        {2'b1x,6'b100010}: begin
            ALUControl=3'b110; //sub
          end
        //and
        {2'b1x,6'b100100}: begin
            ALUControl=3'b000; //and
          end
        //or
        {2'b1x,6'b100101}: begin
            ALUControl=3'b001; //or
          end
         //slt
        {2'b1x,6'b101010}: begin
            ALUControl=3'b111; //slt = set less than
          end
        
        /////nu stiu daca e bun l am pus aici pt test
        default: begin
          ALUControl=3'bxxx;
        end
          
          
    	endcase
    end
endmodule