module counter(
    input clk,
    input rst,
    input ctrl,
    output reg [31:0] pc
);

always @(posedge clk or posedge rst)
begin
   if (rst)
      pc <= 32'd0;
   else if (ctrl)
       pc <= pc + 1;
       
end

endmodule