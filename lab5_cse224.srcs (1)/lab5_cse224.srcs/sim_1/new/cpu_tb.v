`timescale 1ns / 1ps

module cpu_testbench;
reg clk;
reg rst;
reg ctrl;
wire [31:0] Output;

top_module uut (
   .clk(clk),
   .rst(rst),
    .ctrl(ctrl),
    .Output(Output)
);

initial begin
 clk = 0;
forever #5 clk = ~clk;

end

initial begin
   $dumpfile("cpu_tb.vcd");
   $dumpvars(0, cpu_tb);

  rst = 1; ctrl = 0;
  #10;
  rst = 0;
    
  repeat(7) begin
      ctrl = 1;
      #10;
      ctrl = 0;
      #10;
      
      
 end

 $finish;
 
end

endmodule