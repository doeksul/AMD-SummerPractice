// Code your design here

//PIPO

/*
module bistabil_D(input a,input clk,output reg O);
 
  always @(posedge clk)
    begin
      O<=a;
    end
endmodule

module registru(input[3:0] a,input clk, output [3:0] out);
  
  bistabil_D b1(a,clk,out);
  bistabil_D b2(a[2],clk,out[2]);
  bistabil_D b3(a[1],clk,out[1]);
  bistabil_D b4(a[0],clk,out[0]);
endmodule
*/
module registru2(input[3:0] a,input clk, output reg[3:0] out);
  always @(posedge clk)
    begin
      out<=a;
    end
  
endmodule