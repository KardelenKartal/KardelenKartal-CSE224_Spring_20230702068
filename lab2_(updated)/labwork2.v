module labwork2 (A,B,op,out);

input[7:0]A;
input[7:0]B;
input[2:0]op;
output reg[7:0]out;

wire[7:0]inv_out;
wire[7:0]or_out;
wire[7:0]xor_out;
wire[7:0]and_out;
wire[7:0]mul_out;
wire[7:0]add_out;
wire[7:0]sub_out;

assign inv_out = ~A;
assign or_out = A | B;
assign xor_out = A^B;
assign and_out = A & B;
assign mul_out = ( A[3:0]*B[3:0]);
assign add_out = A + B;
assign sub_out = A - B;

always @(*)
begin

case(op)
3'b000 : out = inv_out ;
3'b001 : out = or_out ;
3'b010 : out = xor_out ;
3'b011 : out = and_out ;
3'b100 : out = mul_out ;
3'b101 : out = add_out ;
3'b110 : out = sub_out ;
default : out = 8'b00000000;

endcase
end 
endmodule







