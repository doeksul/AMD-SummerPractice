/*module Testbench;
  reg [31:0] memory [0:9];  // Memory to store the read data
  reg [31:0] temp;
  wire[31:0] out1;
  
  afisare A(temp,out1);
  
  initial begin
     $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    $readmemh("text.txt", memory);  // Read data from text file

    // Display memory contents
    for (int i = 0; i < 9; i++) begin
      $display("memory[%0d] = %h", i, memory[i]);
      temp=memory[i];
      
    end

    $finish;  // Terminate the simulation
  end
endmodule*/
module Testbench;
  // Memory to store the read data
  reg [31:0] temp;
  reg clk;
  wire[31:0] out1;
  
  afisare A(clk, temp,out1);
  
  initial clk= 1'b0;
  initial forever #250 clk = ~clk;
  initial begin
     $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    
      
   

    #2500 $finish;  // Terminate the simulation
  end
endmodule