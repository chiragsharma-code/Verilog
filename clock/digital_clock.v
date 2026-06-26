// second module
module sec(
    input clk,rst,
    output reg[5:0] st,
    output  m_s
);
assign m_s=(st==6'd59);
always @(posedge clk or posedge rst )begin
    if (rst ) st<=0;
    else if(st==6'd59) begin
        st<=0;
        end
    else begin
        st<=st+1;
        end
end
endmodule

//minute module
module min(
    input clk ,rst,m_s,
    output reg [5:0]mt,
    output  h_s
);
assign h_s =(mt==6'd59) && m_s;
always @(posedge clk or posedge rst) begin
    if (rst)
        mt <= 0;
    else if (m_s) begin
        if (mt == 6'd59)
            mt <= 0;
        else
            mt <= mt + 1;
    end
end

endmodule


// hour module
module hr(
    input clk ,rst,h_s,
    output reg [4:0]ht
);

always @(posedge clk or posedge rst )begin
    if (rst ) ht<=0;
    else if(h_s) begin
        if(ht==5'd23) begin
            ht<=0;end
        else  ht<=ht+1;
    end
end

endmodule


module clock(
    input clk,rst,
    output [4:0] hour,
    output [5:0] minute,
    output [5:0] second
);

wire h_s ,m_s;

hr i1(.clk(clk) ,.rst(rst),.h_s(h_s),.ht(hour));
min i2(.clk(clk) ,.rst(rst),.m_s(m_s),.mt(minute),.h_s(h_s));
sec i3(.clk(clk) ,.rst(rst),.st(second),.m_s(m_s));


endmodule

