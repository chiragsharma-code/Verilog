
module alut ;
  reg [3:0] A, B;
  reg [2:0] SEL;
  wire [3:0] R;
  wire  C;
  wire ZERO,NEGATIVE;
  
  ALU i(A,B,SEL,R,C,ZERO,NEGATIVE);
  initial begin
 	  $dumpfile("ALU.vcd");
  	$dumpvars(0,alut);
    $monitor($time,"%b,%b,%b,%b,%b,%b,%b",A,B,SEL,R,C,ZERO,NEGATIVE);
  	A = 4'b0101;
    B = 4'b0011;

    SEL = 3'b000; #10;
    SEL = 3'b001; #10;
    SEL = 3'b010; #10;
    SEL = 3'b011; #10;
    SEL = 3'b100; #10;
    SEL = 3'b101; #10;
    SEL = 3'b110; #10;
    SEL = 3'b111; #10;

    $finish;
  end
endmodule  