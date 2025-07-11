
module display(
    input clk,
    input rst,
    input [15:0] num,
    output reg [6:0] seg,
    output reg [3:0] an
);

reg [3:0] digit;
reg [1:0] digit_sel;
reg [15:0] clkDiv;

  always @(posedge clk or posedge rst)
   begin
     if (rst)
       clkDiv <= 0;
     else
       clkDiv <= clkDiv + 1;
  end
  always @(*)
   begin
    case (digit_sel)
      2'b00: digit = num[3:0];
      2'b01: digit = num[7:4];
      2'b10: digit = num[11:8];
      2'b11: digit = num[15:12];
 endcase
 end

 always @(*) begin
    case (digit)
       4'h0: seg = 7'b1000000;
       4'h1: seg = 7'b1111001;
       4'h2: seg = 7'b0100100;
       4'h3: seg = 7'b0110000;
       4'h4: seg = 7'b0011001;
            
       4'h5: seg = 7'b0010010;
       4'h6: seg = 7'b0000010;
       4'h7: seg = 7'b1111000;
       4'h8: seg = 7'b0000000;
       4'h9: seg = 7'b0011000;
            
       4'hA: seg = 7'b0001000;
       4'hB: seg = 7'b0000011;
       4'hC: seg = 7'b1000110;
       4'hD: seg = 7'b0100001;
       4'hE: seg = 7'b0000110;
       
       4'hF: seg = 7'b0001110;
       default: seg = 7'b1111111;
       
   endcase
  end

 always @(*) begin
     case (digit_sel)
       2'b00: an = 4'b1110;
       2'b01: an = 4'b1101;
       2'b10: an = 4'b1011;
       2'b11: an = 4'b0111;
 endcase
 end

 always @(posedge clk or posedge rst) begin
        if (rst)
            digit_sel <= 0;
        else
            digit_sel <= digit_sel + 1;
    end

endmodule
