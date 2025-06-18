module alu(
    input [2:0] Alu_op,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Output
);

always @(*) begin
    case (Alu_op)
        3'b000, 3'b001: Output = 32'd0;
        3'b010: Output = A + B;
        3'b011: Output = A - B;
        
        3'b100: Output = A << B;
        3'b101: Output = A >> B;
        
        3'b110: Output = A + B;
        3'b111: Output = A - B;
        default: Output = 32'd0;
        
 endcase
 
end

endmodule