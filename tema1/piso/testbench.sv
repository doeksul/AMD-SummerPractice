// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

module testbench();
  
  reg clk;
  reg [3:0]a;
  reg pl;
  wire O;
 
   initial clk= 1'b0;
  initial a=4'b0000;
  initial pl=1'b1;
  registru2 Ichip1(a,pl,clk,O);
  
  
  
  

  
  initial forever #250 clk = ~clk;
	initial forever #1250 a=a+1'b1;
  	initial forever #625 pl=~pl;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
   
    #9000;
    $finish(1);
  end
  
  
endmodule