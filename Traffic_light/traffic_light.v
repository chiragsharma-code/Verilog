
module traffic_light(
    input clk,
    input rst,
    output reg [2:0] highway_light,
    output reg [2:0] side_light
);

    parameter RED = 3'b100;
    parameter YELLOW = 3'b010;
    parameter GREEN = 3'b001;

    reg [1:0] state;
    parameter S0 = 2'b00 ,S1 = 2'b01 ,S2= 2'b10 ,S3=2'b11;


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            highway_light <= GREEN;
            side_light <= RED;
        end else begin
            case (state)
                S0: begin
                    state <= S1;
                    highway_light <= GREEN;
                    side_light <= RED;
                end
                S1: begin
                    state <= S2;
                    highway_light <= YELLOW;
                    side_light <= RED;
                end
                S2: begin
                    state <= S3;
                    highway_light <= RED;
                    side_light <= GREEN;
                end
                S3: begin
                    state <= S0;
                    highway_light <= RED;
                    side_light <= YELLOW;
                end
                default: begin
                    state <= S0;
                    highway_light <= GREEN;
                    side_light <= RED;
                end
            endcase
        end
    end
endmodule