
module cpu(
    input clk,
    input rst,
    output [6:0] seg,
    output [3:0] an );

reg [7:0] reg_file [0:31];

task ADDI(input integer rd, input integer rs, input integer imm);
begin
    reg_file[rd] = reg_file[rs] + imm;
end
endtask

task SUBI(input integer rd, input integer rs, input integer imm);
begin
    reg_file[rd] = reg_file[rs] - imm;
end
endtask

task ADD(input integer rd, input integer rs, input integer rt);
begin
    reg_file[rd] = reg_file[rs] + reg_file[rt];
end
endtask

task SHIFTL(input integer rd, input integer rs, input integer rt);
begin
    reg_file[rd] = reg_file[rs] << reg_file[rt];
end
endtask

initial 
begin
    integer i;
    for (i = 0; i < 32; i = i + 1)
     reg_file[i] = 0;
     
        ADDI(10, 0, 10);       
        ADDI(15, 0, 15);       
        ADD(25, 10, 15);       
        SUBI(20, 25, 5);       
        ADDI(21, 0, 2);     
           
        SHIFTL(30, 7, 21);     
        ADDI(4, 0, 4);         
        ADD(5, 0, 0);         
        ADDI(6, 0, 1);         
        ADDI(7, 0, 1);   
             
        ADD(8, 6, 7);          
        ADD(6, 7, 0);         
        ADD(7, 8, 0);          
        ADDI(5, 5, 1);        
 end

wire [15:0] display_value = {8'b0, reg_file[8]};

display ssd (
    .clk(clk), .rst(rst), .num(display_value), .seg(seg), .an(an) );

endmodule
