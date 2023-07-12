// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

// Code your testbench here
// or browse Examples
 
  
// or browse Examples

// Code your testbench here
// or browse Examples
module testbench();
 //101011_01001_10000_0000000000000001

  
  reg clk;
  

  //test increment simplu
  initial clk= 1'b0;
 
  MIPS Ichip1(clk);
  
 /* task inst(input reg clk);
    Ichip1(clk);
    
  endtask
  inst(clk);*/
  initial forever #240 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

  
    #3000;
    $finish(1);
  end
  
endmodule

  
 