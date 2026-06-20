
module traffic_light_test;

    reg clk;
    reg rst;
    wire [2:0] highway_light;
    wire [2:0] side_light;

    traffic_light uut (.clk(clk), .rst(rst),.highway_light(highway_light),.side_light(side_light)
    );

    initial begin
        clk = 0;
        rst = 1;
        #12 rst = 0; 
    end

    always #5 clk = ~clk;
    initial begin
        
        $dumpfile("traffic_light.vcd");
        
        $dumpvars(0, traffic_light_test);
        $monitor("Time = %0t  ,Highway Light = %b ,Side Light:  =%b",
         $time, highway_light, side_light);
    #100 $finish; // Run the simulation for 100 time units
    end
endmodule