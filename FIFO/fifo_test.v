
module fifo_test;
reg clk ;
reg rst ;
reg wr_en ;
reg rd_en ;
reg [7:0] din;
wire [7:0] dout;
wire full,empty;

fifo i1(.clk(clk) , .rst(rst ), .wr_en(wr_en), .rd_en(rd_en),
 .din(din), .dout(dout), .full(full), .empty(empty));

initial begin
    clk=0;
    rst=1;
    din=0;
    rd_pt=0;
    wr_pt=0;
    #12 rst=0;
    #20;
    wr_en = 1;
    din = 8'd11;
    #10;

    
    din = 8'd22;
    #10;

    
    din = 8'd33;
    #10;

    wr_en = 0;

    
    rd_en = 1;
    #10;

    
    #10;

    rd_en = 0;

    
    wr_en = 1;
    rd_en = 1;
    din = 8'd44;
    #10;

    rd_en = 0;

    
    din = 8'd55; #10;
    din = 8'd66; #10;
    din = 8'd77; #10;
    din = 8'd88; #10;
    din = 8'd99; #10;
    din = 8'd111; #10;
    din = 8'd122; #10;

    
    din = 8'd150;
    #10;

    wr_en = 0;

    
    rd_en = 1;
#100;

    rd_en = 0;

    
    wr_en = 1;
    din = 8'd1; #10;
    din = 8'd2; #10;
    din = 8'd3; #10;
    din = 8'd4; #10;

    wr_en = 0;

   
    rd_en = 1;
    #20;
    rd_en = 0;

    
    wr_en = 1;
    din = 8'd5; #10;
    din = 8'd6; #10;
    din = 8'd7; #10;
    din = 8'd8; #10;

    
    rd_en = 1;
    din = 8'd200; #10;
    din = 8'd201; #10;
    din = 8'd202; #10;
    din = 8'd203; #10;

    wr_en = 0;
    rd_en = 0;

    #20;
    $finish;
end    
 

 always #5 clk=~clk;

 initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_test);
    $monitor(
        "Time =%0t , CLK =%d, Rst=%d,wr_en=%d,rd_en=%d,din=%d,dout=%d,full=%b,empty=%b"
        ,$time,clk,rst,wr_en,rd_en,din,dout,full,empty);

 end
endmodule