
module sequence(
    input in,rst,clk,
    output reg out
);
parameter s0=3'b000 ,s1=3'b001 ,s2=3'b010,s3=3'b011 ,s4=3'b100;
reg [2:0] state ,n_state;
always @(posedge clk or posedge rst)begin
    
    if(rst)begin
        state<=s0;
        
    end
    else begin
        state<=n_state;
    end
end

always @(*)begin
    case(state)
        s0:begin
            out=1'b0;
             n_state=(in)?s1:s0;   
            end
        s1:begin
            out=1'b0;
            n_state=(in)?s1:s2;
            end
        s2:begin
            out=1'b0;
            n_state=(in)?s3:s0;
            end
        s3:begin
            out=1'b0;
            n_state=(in)?s4:s2;    
            end
        s4:begin
            out=1'b1;
            n_state=(in)?s1:s0;
            end
        default:begin
            out=1'b0;
            n_state=s0;
            end    
    endcase
end
endmodule

