module instruc_memo(
    input [31:0] addr,
    output reg [31:0] instruc
);

always @(*) begin
    case (addr)
        32'd0: instruc = {4'b110, 5'd10, 5'd0, 18'd10};
       32'd1: instruc = {4'b110, 5'd15, 5'd0, 18'd15};
        32'd2: instruc = {4'b010, 5'd25, 5'd10, 5'd15, 13'd0};
        
       32'd3: instruc = {4'b111, 5'd20, 5'd25,18'd5};
      32'd4: instruc = {4'b110,5'd5, 5'd0, 18'd2};
      32'd5: instruc = {4'b100, 5'd30, 5'd25, 5'd5, 13'd0};
      default: instruc = 32'd0;
      
  endcase
    
end

endmodule