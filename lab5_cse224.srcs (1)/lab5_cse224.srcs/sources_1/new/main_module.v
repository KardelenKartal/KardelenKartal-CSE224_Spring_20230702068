module top_module(
    input clk,
    input rst,
    input ctrl,
    output [3:0] Output
);

wire [31:0] pc;
reg [31:0] alu_B;  

wire [31:0] instruc;
wire [2:0] Alu_op;

wire [4:0] RD, RS1, RS2;
wire [31:0] imm_ext;
wire imm_sel;
wire [31:0] reg_read1, reg_read2;


counter pc_inst(
    .clk(clk),
    .rst(rst),
    .ctrl(ctrl),
    .pc(pc)
);

instruc_memo imem_inst(
    .addr(pc),
    .instruc(instruc)  );

instruc_decoder idec_inst(
    .instruc(instruc),  
    .Alu_op(Alu_op),
    .RD(RD),
    .RS1(RS1),
   .RS2(RS2),
    .imm_ext(imm_ext),
    .imm_sel(imm_sel)    );

register_file rf_inst(
    .clk(clk),
    .RS1(RS1),
    .RS2(RS2),
      .RD(RD),
    .writeData(Output),
    .regWrite(ctrl),
   .read_data1(reg_read1),
   .read_data2(reg_read2)
   );
   

always @(*) 
begin
    if (imm_sel)
       alu_B = imm_ext;
    else
      alu_B = reg_read2;
      
end

alu alu_inst(
   .Alu_op(Alu_op),
   .A(reg_read1),
   .B(alu_B),
   .Output(Output)
);

endmodule
