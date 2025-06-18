
module labwork2_tb(A,B,op,out);

reg[7:0]A;
reg[7:0]B;
reg[2:0]op;
wire[7:0]out;

labwork2 UUT
( .A(A), .B(B), .op(op) , .out(out));

initial begin

$display ("start");

A = 8'b11110000;

op = 3'b000; #10;
$display(" INVERTER : ~A = %b"; out);


op = 3'b001; #10;
$display(" OR: A |B = %b"; out);

op = 3'b010; #10;
$display(" XOR: A ^ B = %b"; out);


op = 3'b011; #10;
$display(" AND: A & B = %b"; out);


op = 3'b100; #10;
$display(" MUL: A[3:0] * B[3:0]= %b "; out);


op = 3'b101; #10;
$display(" ADD : A + B = %b"; out);


op = 3'b110; #10;
$display(" SUB: A - B = %b"; out);

$stop;
end
endmodule

