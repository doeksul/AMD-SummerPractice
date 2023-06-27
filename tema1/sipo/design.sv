// Code your design here
// Code your design here

//PIPO


module bistabil_D(input a,input clk,output reg O);
 
  always @(posedge clk)
    begin
      O<=a;
    end
endmodule
/*
module registru(input[3:0] a,input clk, output [3:0] out);
  
  bistabil_D b1(a,clk,out);
  bistabil_D b2(a[2],clk,out[2]);
  bistabil_D b3(a[1],clk,out[1]);
  bistabil_D b4(a[0],clk,out[0]);
endmodule
*/
module registru2(input a,input clk, output [3:0] out);
  
  wire out1,out2,out3,out4;
  bistabil_D b1(a,clk,out1);
  bistabil_D b2(out1,clk,out2);
  bistabil_D b3(out2,clk,out3);
  bistabil_D b4(out3,clk,out4);
  assign out={out1,out2,out3,out4};
   
 
endmodule