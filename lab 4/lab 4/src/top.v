module top (
    input wire clk,
    input wire WE3,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD3,
    input wire [1:0] opcode,
    output wire [31:0] result_out
);
    wire [31:0] RD1, RD2;
    wire [31:0] alu_result;

    register_file rf (
        .clk(clk),
        .WE3(WE3),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2)
    );

    alu myalu (
        .A(RD1),
        .B(RD2),
        .opcode(opcode),
        .result(alu_result)
    );

    assign result_out = alu_result;
endmodule
