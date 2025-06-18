
module first_system(
input [0:7] sw,
output [0:7] led
    );
    assign led = ~sw + 8'b00000001;
endmodule
