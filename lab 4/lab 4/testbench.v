module testbench;
    reg clk = 0;
    always #5 clk = ~clk;

    reg WE3;
    reg [4:0] A1, A2, A3;
    reg [31:0] WD3;
    wire [31:0] RD1, RD2;
    wire [31:0] result;
    reg [1:0] opcode;

    register_file rf (
        .clk(clk), .WE3(WE3), .A1(A1), .A2(A2), .A3(A3), .WD3(WD3),
        .RD1(RD1), .RD2(RD2)
    );

    alu myalu (
        .A(RD1), .B(RD2), .opcode(opcode), .result(result)
    );

    initial begin
        // Write 10 and 15 to reg10 and reg15
        WE3 = 1; WD3 = 10; A3 = 5'd10; #10;
        WD3 = 15; A3 = 5'd15; #10;

        // ADD: 10 + 15 -> reg20
        WE3 = 0; A1 = 5'd10; A2 = 5'd15; opcode = 2'b00; #10;
        WE3 = 1; WD3 = result; A3 = 5'd20; #10;

        // SUB: 20 - 15 -> reg20
        WE3 = 1; WD3 = 20; A3 = 5'd10; #10;
        WD3 = 15; A3 = 5'd15; #10;
        WE3 = 0; A1 = 5'd10; A2 = 5'd15; opcode = 2'b01; #10;
        WE3 = 1; WD3 = result; A3 = 5'd20; #10;

        // SHIFTL: 31 << 2 -> reg20
        WE3 = 1; WD3 = 31; A3 = 5'd10; #10;
        WD3 = 2; A3 = 5'd15; #10;
        WE3 = 0; A1 = 5'd10; A2 = 5'd15; opcode = 2'b10; #10;
        WE3 = 1; WD3 = result; A3 = 5'd20; #10;

        // SHIFTR: 31 >> 2 -> reg20
        WE3 = 0; A1 = 5'd10; A2 = 5'd15; opcode = 2'b11; #10;
        WE3 = 1; WD3 = result; A3 = 5'd20; #10;

        $finish;
    end
endmodule
