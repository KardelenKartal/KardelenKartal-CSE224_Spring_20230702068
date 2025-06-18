module instruc_decoder(
    input [31:0] instruc,
    output [2:0] Alu_op,
    output [4:0] RD,
    output [4:0] RS1,
    output [4:0] RS2,
    output [31:0] imm_ext,
    output imm_sel
);

assign ALUop = instruc[31:29];
assign RD = instruc[27:23];
assign RS1 = instruc[22:18];
assign RS2 = instruc[17:13];
assign imm_ext = {{14{instruc[17]}}, instruc[17:0]};
assign imm_sel = (Alu_op == 3'b110 || Alu_op == 3'b111);

endmodule