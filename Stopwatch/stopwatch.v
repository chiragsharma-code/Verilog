
module stopwatch(
    input clk ,rst,stop
    output reg [5:0] sec

);
always @(posedge clk or posedge rst or posedge stop) begin
    if(rst) begin
        sec <= 6'b0;
    end else if(stop) begin
        sec <= sec;
    end else begin
        if(sec == 6'd59) begin
            sec <= 6'b0;
        end else begin
            sec <= sec + 1'b1;
        end
    end
end
endmodule