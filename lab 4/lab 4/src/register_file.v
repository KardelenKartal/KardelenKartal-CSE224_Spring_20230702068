module register_file (
    input wire clk,
    input wire WE3,
    input wire [4:0] A1, A2, A3,
    input wire [31:0] WD3,
    output wire [31:0] RD1, RD2
);
    reg [31:0] registers [0:31];

    assign RD1 = registers[A1];
    assign RD2 = registers[A2];

    always @(posedge clk) begin
        if (WE3)
            registers[A3] <= WD3;
    end
endmodule
