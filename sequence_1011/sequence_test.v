module sequence_test;

reg clk, rst, in;
wire out;

sequence uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    in  = 0;

    #12 rst = 0;

    
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;

    #20 $finish;
end

initial begin
    $dumpfile("sequence.vcd");
    $dumpvars(0, sequence_test);

    $monitor(
        "Time=%0t clk=%b rst=%b in=%b out=%b",
        $time, clk, rst, in, out
    );
end

endmodule