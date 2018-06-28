module X_Mux_8(
    input i_clk,
    input i_rst,
    input [8-1:0] i_x,
    output logic o_x
);

    logic [8-1:0] state_r, state_w;
    logic x_r, x_w;


    always_comb begin
        case(state_r)
            'd0, 'd2, 'd4, 'd6, 'd8, 'd10, 'd12, 'd14, 'd16, 'd18, 'd20, 'd22, 'd24, 'd26, 'd28, 'd30, 'd32, 'd34, 'd36, 'd38, 'd40, 'd42, 'd44, 'd46, 'd48, 'd50, 'd52, 'd54, 'd56, 'd58, 'd60, 'd62, 'd64, 'd66, 'd68, 'd70, 'd72, 'd74, 'd76, 'd78, 'd80, 'd82, 'd84, 'd86, 'd88, 'd90, 'd92, 'd94, 'd96, 'd98, 'd100, 'd102, 'd104, 'd106, 'd108, 'd110, 'd112, 'd114, 'd116, 'd118, 'd120, 'd122, 'd124, 'd126: x_w = i_x[7];
            'd1, 'd5, 'd9, 'd13, 'd17, 'd21, 'd25, 'd29, 'd33, 'd37, 'd41, 'd45, 'd49, 'd53, 'd57, 'd61, 'd65, 'd69, 'd73, 'd77, 'd81, 'd85, 'd89, 'd93, 'd97, 'd101, 'd105, 'd109, 'd113, 'd117, 'd121, 'd125: x_w = i_x[6];
            'd3, 'd11, 'd19, 'd27, 'd35, 'd43, 'd51, 'd59, 'd67, 'd75, 'd83, 'd91, 'd99, 'd107, 'd115, 'd123: x_w = i_x[5];
            'd7, 'd23, 'd39, 'd55, 'd71, 'd87, 'd103, 'd119: x_w = i_x[4];
            'd15, 'd47, 'd79, 'd111: x_w = i_x[3];
            'd31, 'd95: x_w = i_x[2];
            'd63: x_w = i_x[1];
            'd127: x_w = i_x[0];
            default: x_w = 1'b0;
        endcase
        state_w = state_r + 1;
        o_x = x_w;
    end

    always_ff @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_r <= 'd0;
            x_r <= 1'b0;
        end else begin
            x_r <= x_w;
            state_r <= state_w;
        end
    end

endmodule