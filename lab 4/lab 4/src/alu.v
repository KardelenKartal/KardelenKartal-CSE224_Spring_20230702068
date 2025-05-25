module alu (
    input wire [31:0] A, B,
    input wire [1:0] opcode,
    output reg [31:0] result
);
    always @(*) begin
        case (opcode)
            2'b00: result = A + B;        // ADD
            2'b01: result = A - B;        // SUB
            2'b10: result = A << B;       // SHIFTL
            2'b11: result = A >> B;       // SHIFTR
            default: result = 0;
        endcase
    end
endmodule
