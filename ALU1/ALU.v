// ALU 
module ALU(
  input [3:0] A,
  input [3:0] B,
  input[2:0] SEL,
  output reg[3:0] R,
  output reg C,
  output reg ZERO,
  output reg NEGATIVE);
  
  always @(*) begin
    case(SEL)
      3'b000 : begin
        {C,R}=A+B;end
      3'b001 : begin
        {C,R}=A-B;end
      3'b010 : begin
        R=A&B;
      	C=0;end
      3'b011 : begin
        R=A|B;
      	C=0;end
      3'b100 : begin
        R=A^B;
      	C=0;end
      3'b101 : begin
        R=~A;
      	C=0;end
      3'b110 : begin
        {C,R}=A<<1;end
      3'b111 : begin
        {C,R}=A>>1;end
      default begin
        R=4'B0000;
        C=0;end
        
    endcase
    ZERO = (R == 0);
    NEGATIVE = R[3];
  end
        
    
  
endmodule

