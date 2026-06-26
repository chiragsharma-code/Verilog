
module d_clock_test ;

reg clk,rst;
wire [4:0] hour ;
wire [5:0] minute ,second;

clock i1(.clk(clk),.rst(rst),.hour(hour),.minute(minute),.second(second));

initial begin
    clk=0;rst=1;
    #12 rst=0;
    i1.i1.ht = 23;   
    i1.i2.mt = 59;  
    i1.i3.st = 58;
    #50 $finish;

end
always #5 clk=~clk;

initial begin
    $dumpfile("digital_clock.vcd");
    $dumpvars(0,d_clock_test);
    $monitor(
        "Time =%0t , CLK =%d, Rst=%d,Hour=%d,Min=%d,Sec=%d",
        $time,clk,rst,hour,minute,second);
end
endmodule    

