
module fifo(
    input clk ,rst ,wr_en ,rd_en ,
    input [7:0] din,
    output reg [7:0] dout,
    output  full ,empty
);

reg[7:0] mem[7:0];
reg[2:0] rd_pt,wr_pt;
reg [3:0] count;

always @(posedge clk)begin
    if(rst)begin
        
        count<=0;
        rd_pt<=0;
        wr_pt<=0;
    end

    else if(wr_en==1 && rd_en ==0)begin
        if(full==0)begin
            mem[wr_pt]<=din;
            wr_pt<=wr_pt+1;
            count<=count+1;end
        else begin

        end    
    end
    else if(rd_en==1 && wr_en ==0)begin
        if(empty==0)begin
            dout<=mem[rd_pt];
            rd_pt<=rd_pt+1;
            count<=count-1;end
        else begin
        end    
    end
    else if(rd_en==1 && wr_en ==1)begin
        if(empty==0 && full ==0 )begin
            dout<=mem[rd_pt];
            rd_pt<=rd_pt+1;
            mem[wr_pt]<=din;
             wr_pt<=wr_pt+1;
            
            end
        else if(empty==1 && full ==0 )begin
            mem[wr_pt]<=din;
            wr_pt<=wr_pt+1;
            count<=count+1;
        end
        else if(empty==0 && full ==1 ) begin
            dout<=mem[rd_pt];
            rd_pt<=rd_pt+1;
            mem[wr_pt]<=din;
            wr_pt<=wr_pt+1;
        end   
    end



end
assign full =(count==8);
assign empty=(count==0);

endmodule