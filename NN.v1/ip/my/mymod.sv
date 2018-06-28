module mymod(
    input clk,
    input rst_n,
    input read,
    input write,
    input [31:0] data_in,
    output logic [31:0] data_out
);

    logic [31:0] tmp_w,tmp_r;
    
    
    always_comb begin
        if(write) begin
            tmp_w = tmp_r + 'd1;
        end else begin
            tmp_w = tmp_r;
        end
		  data_out = tmp_r;
    end
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (rst_n==1'b0) begin
            tmp_r <= 'd0;
        end else begin
            tmp_r <= tmp_w;
        end
    end

endmodule