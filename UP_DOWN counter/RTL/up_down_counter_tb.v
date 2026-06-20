`timescale 1ps/1ps
module up_down_counter_tb ;
  reg  clk, rst,up_down;
  wire [3:0] count;

  up_down_counter i1 (.clk(clk),.rst(rst),.up_down(up_down),.count(count));

  initial begin
    $dumpfile("up_down_counter.vcd");
  	$dumpvars(0, up_down_counter_tb);
    $monitor($time, "%b,%b,%b,%b", clk, rst, up_down, count);
    clk = 0; rst = 1; up_down = 1;

    #10 rst = 0;       

    #50 up_down = 0;  

    #50 $finish;
  end

  always #5 clk=~clk;
  endmodule