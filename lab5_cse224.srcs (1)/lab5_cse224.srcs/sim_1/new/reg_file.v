module register_file(
    input clk,
   input [4:0] RS1,
  input [4:0] RS2,
    input [4:0] RD,
    input [31:0] writeData,
    
    input regWrite,
    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] registers [0:31];

assign read_data1 = registers[RS1];
assign read_data2 = registers[RS2];

always @(posedge clk)
 begin
 
    if (regWrite && RD != 5'd0)
        registers[RD] <= writeData;
        
end

endmodule