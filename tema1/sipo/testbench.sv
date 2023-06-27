// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples


module testbench();
  
  reg clk;
  reg a;
  wire [3:0]O;
 
  registru2 Ichip1(a,clk,O);
  
  
  
  
  initial clk= 1'b0;
  initial a=1'b1;
  
  initial forever #250 clk = ~clk;
	initial forever #1000 a=~a;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
   
    #9000;
    $finish(1);
  end
  
  
endmodule