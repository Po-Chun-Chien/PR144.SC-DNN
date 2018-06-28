`define n_gtransfer 13
`define n_glast 0
`define n_stransfer 25
module NN_Wrapper(
    input i_clk,
    input i_rst,
    input read,
    input write,
    input [31:0] i_batch,
    output logic [31:0] o_batch
);

    enum {INIT, GET, CAL, IDLE, SEND} state_cur, state_nxt;
    logic last_w, last_r;
    logic out_r, out_w;
    logic [(50+1)*32-1:0] Wx_r, Wx_w;
    logic [16-1:0] cnt_r, cnt_w;
    logic mat_next, mat_rst, mat_rdy;
    logic signed [32-1:0]  mat_xw1, mat_xw2, mat_xw3, mat_xw4, mat_xw5, mat_xw6, mat_xw7, mat_xw8, mat_xw9, mat_xw10, mat_xw11, mat_xw12, mat_xw13, mat_xw14, mat_xw15, mat_xw16, mat_xw17, mat_xw18, mat_xw19, mat_xw20, mat_xw21, mat_xw22, mat_xw23, mat_xw24, mat_xw25, mat_xw26, mat_xw27, mat_xw28, mat_xw29, mat_xw30, mat_xw31, mat_xw32, mat_xw33, mat_xw34, mat_xw35, mat_xw36, mat_xw37, mat_xw38, mat_xw39, mat_xw40, mat_xw41, mat_xw42, mat_xw43, mat_xw44, mat_xw45, mat_xw46, mat_xw47, mat_xw48, mat_xw49, mat_xw50;

    Mat_Mul Mat_Mul(
        .i_clk(i_clk),
        .i_rst(mat_rst|i_rst),
        .i_next(mat_next),
        .i_x1(Wx_w[(50+1)*8-1:50*8]),
        .i_x2(Wx_w[(50-0)*8-1:(50-1)*8]),
        .i_x3(Wx_w[(50-1)*8-1:(50-2)*8]),
        .i_x4(Wx_w[(50-2)*8-1:(50-3)*8]),
        .i_x5(Wx_w[(50-3)*8-1:(50-4)*8]),
        .i_x6(Wx_w[(50-4)*8-1:(50-5)*8]),
        .i_x7(Wx_w[(50-5)*8-1:(50-6)*8]),
        .i_x8(Wx_w[(50-6)*8-1:(50-7)*8]),
        .i_x9(Wx_w[(50-7)*8-1:(50-8)*8]),
        .i_x10(Wx_w[(50-8)*8-1:(50-9)*8]),
        .i_x11(Wx_w[(50-9)*8-1:(50-10)*8]),
        .i_x12(Wx_w[(50-10)*8-1:(50-11)*8]),
        .i_x13(Wx_w[(50-11)*8-1:(50-12)*8]),
        .i_x14(Wx_w[(50-12)*8-1:(50-13)*8]),
        .i_x15(Wx_w[(50-13)*8-1:(50-14)*8]),
        .i_x16(Wx_w[(50-14)*8-1:(50-15)*8]),
        .i_x17(Wx_w[(50-15)*8-1:(50-16)*8]),
        .i_x18(Wx_w[(50-16)*8-1:(50-17)*8]),
        .i_x19(Wx_w[(50-17)*8-1:(50-18)*8]),
        .i_x20(Wx_w[(50-18)*8-1:(50-19)*8]),
        .i_x21(Wx_w[(50-19)*8-1:(50-20)*8]),
        .i_x22(Wx_w[(50-20)*8-1:(50-21)*8]),
        .i_x23(Wx_w[(50-21)*8-1:(50-22)*8]),
        .i_x24(Wx_w[(50-22)*8-1:(50-23)*8]),
        .i_x25(Wx_w[(50-23)*8-1:(50-24)*8]),
        .i_x26(Wx_w[(50-24)*8-1:(50-25)*8]),
        .i_x27(Wx_w[(50-25)*8-1:(50-26)*8]),
        .i_x28(Wx_w[(50-26)*8-1:(50-27)*8]),
        .i_x29(Wx_w[(50-27)*8-1:(50-28)*8]),
        .i_x30(Wx_w[(50-28)*8-1:(50-29)*8]),
        .i_x31(Wx_w[(50-29)*8-1:(50-30)*8]),
        .i_x32(Wx_w[(50-30)*8-1:(50-31)*8]),
        .i_x33(Wx_w[(50-31)*8-1:(50-32)*8]),
        .i_x34(Wx_w[(50-32)*8-1:(50-33)*8]),
        .i_x35(Wx_w[(50-33)*8-1:(50-34)*8]),
        .i_x36(Wx_w[(50-34)*8-1:(50-35)*8]),
        .i_x37(Wx_w[(50-35)*8-1:(50-36)*8]),
        .i_x38(Wx_w[(50-36)*8-1:(50-37)*8]),
        .i_x39(Wx_w[(50-37)*8-1:(50-38)*8]),
        .i_x40(Wx_w[(50-38)*8-1:(50-39)*8]),
        .i_x41(Wx_w[(50-39)*8-1:(50-40)*8]),
        .i_x42(Wx_w[(50-40)*8-1:(50-41)*8]),
        .i_x43(Wx_w[(50-41)*8-1:(50-42)*8]),
        .i_x44(Wx_w[(50-42)*8-1:(50-43)*8]),
        .i_x45(Wx_w[(50-43)*8-1:(50-44)*8]),
        .i_x46(Wx_w[(50-44)*8-1:(50-45)*8]),
        .i_x47(Wx_w[(50-45)*8-1:(50-46)*8]),
        .i_x48(Wx_w[(50-46)*8-1:(50-47)*8]),
        .i_x49(Wx_w[(50-47)*8-1:(50-48)*8]),
        .i_x50(Wx_w[(50-48)*8-1:(50-49)*8]),
        .i_w(Wx_w[(50-49)*8-1:(50-50)*8]),
        .o_wx1(mat_xw1),
        .o_wx2(mat_xw2),
        .o_wx3(mat_xw3),
        .o_wx4(mat_xw4),
        .o_wx5(mat_xw5),
        .o_wx6(mat_xw6),
        .o_wx7(mat_xw7),
        .o_wx8(mat_xw8),
        .o_wx9(mat_xw9),
        .o_wx10(mat_xw10),
        .o_wx11(mat_xw11),
        .o_wx12(mat_xw12),
        .o_wx13(mat_xw13),
        .o_wx14(mat_xw14),
        .o_wx15(mat_xw15),
        .o_wx16(mat_xw16),
        .o_wx17(mat_xw17),
        .o_wx18(mat_xw18),
        .o_wx19(mat_xw19),
        .o_wx20(mat_xw20),
        .o_wx21(mat_xw21),
        .o_wx22(mat_xw22),
        .o_wx23(mat_xw23),
        .o_wx24(mat_xw24),
        .o_wx25(mat_xw25),
        .o_wx26(mat_xw26),
        .o_wx27(mat_xw27),
        .o_wx28(mat_xw28),
        .o_wx29(mat_xw29),
        .o_wx30(mat_xw30),
        .o_wx31(mat_xw31),
        .o_wx32(mat_xw32),
        .o_wx33(mat_xw33),
        .o_wx34(mat_xw34),
        .o_wx35(mat_xw35),
        .o_wx36(mat_xw36),
        .o_wx37(mat_xw37),
        .o_wx38(mat_xw38),
        .o_wx39(mat_xw39),
        .o_wx40(mat_xw40),
        .o_wx41(mat_xw41),
        .o_wx42(mat_xw42),
        .o_wx43(mat_xw43),
        .o_wx44(mat_xw44),
        .o_wx45(mat_xw45),
        .o_wx46(mat_xw46),
        .o_wx47(mat_xw47),
        .o_wx48(mat_xw48),
        .o_wx49(mat_xw49),
        .o_wx50(mat_xw50),
        .o_rdy(mat_rdy)
    );

    always_comb begin
        cnt_w = cnt_r;
        Wx_w = Wx_r;
        last_w = last_r;
        mat_next = 1'b0;
        mat_rst = 1'b0;
        if(state_cur == INIT) begin
            mat_rst = 1'b1;
            if(write) begin
                state_nxt = GET;
                cnt_w = cnt_r + 1;
                Wx_w[8*3-1:0] = i_batch[8*3-1:0];
                last_w = i_batch[31];
            end else begin
                state_nxt = INIT;
            end
        end else if(state_cur == GET) begin
            if(write) begin
                if(cnt_r == 'd12) begin
                    state_nxt = CAL;
                    mat_next = 1'b1;
                    cnt_w = 'd0;
						  Wx_w =  { Wx_r[50*32-1:0], i_batch };
                end else begin
                    state_nxt = GET;
                    cnt_w = cnt_r + 1;
                     Wx_w = { Wx_r[(50)*32-1:0], i_batch };
                end
            end else begin
                state_nxt = GET;
            end
        end else if(state_cur == CAL) begin
            if(mat_rdy) begin
                Wx_w = 'd0;
                if(last_r) begin
                    state_nxt = SEND;
                    Wx_w[(50+1)*32-1:50*32] = mat_xw1;
                    Wx_w[(50-0)*32-1:(50-1)*32] = mat_xw2;
                    Wx_w[(50-1)*32-1:(50-2)*32] = mat_xw3;
                    Wx_w[(50-2)*32-1:(50-3)*32] = mat_xw4;
                    Wx_w[(50-3)*32-1:(50-4)*32] = mat_xw5;
                    Wx_w[(50-4)*32-1:(50-5)*32] = mat_xw6;
                    Wx_w[(50-5)*32-1:(50-6)*32] = mat_xw7;
                    Wx_w[(50-6)*32-1:(50-7)*32] = mat_xw8;
                    Wx_w[(50-7)*32-1:(50-8)*32] = mat_xw9;
                    Wx_w[(50-8)*32-1:(50-9)*32] = mat_xw10;
                    Wx_w[(50-9)*32-1:(50-10)*32] = mat_xw11;
                    Wx_w[(50-10)*32-1:(50-11)*32] = mat_xw12;
                    Wx_w[(50-11)*32-1:(50-12)*32] = mat_xw13;
                    Wx_w[(50-12)*32-1:(50-13)*32] = mat_xw14;
                    Wx_w[(50-13)*32-1:(50-14)*32] = mat_xw15;
                    Wx_w[(50-14)*32-1:(50-15)*32] = mat_xw16;
                    Wx_w[(50-15)*32-1:(50-16)*32] = mat_xw17;
                    Wx_w[(50-16)*32-1:(50-17)*32] = mat_xw18;
                    Wx_w[(50-17)*32-1:(50-18)*32] = mat_xw19;
                    Wx_w[(50-18)*32-1:(50-19)*32] = mat_xw20;
                    Wx_w[(50-19)*32-1:(50-20)*32] = mat_xw21;
                    Wx_w[(50-20)*32-1:(50-21)*32] = mat_xw22;
                    Wx_w[(50-21)*32-1:(50-22)*32] = mat_xw23;
                    Wx_w[(50-22)*32-1:(50-23)*32] = mat_xw24;
                    Wx_w[(50-23)*32-1:(50-24)*32] = mat_xw25;
                    Wx_w[(50-24)*32-1:(50-25)*32] = mat_xw26;
                    Wx_w[(50-25)*32-1:(50-26)*32] = mat_xw27;
                    Wx_w[(50-26)*32-1:(50-27)*32] = mat_xw28;
                    Wx_w[(50-27)*32-1:(50-28)*32] = mat_xw29;
                    Wx_w[(50-28)*32-1:(50-29)*32] = mat_xw30;
                    Wx_w[(50-29)*32-1:(50-30)*32] = mat_xw31;
                    Wx_w[(50-30)*32-1:(50-31)*32] = mat_xw32;
                    Wx_w[(50-31)*32-1:(50-32)*32] = mat_xw33;
                    Wx_w[(50-32)*32-1:(50-33)*32] = mat_xw34;
                    Wx_w[(50-33)*32-1:(50-34)*32] = mat_xw35;
                    Wx_w[(50-34)*32-1:(50-35)*32] = mat_xw36;
                    Wx_w[(50-35)*32-1:(50-36)*32] = mat_xw37;
                    Wx_w[(50-36)*32-1:(50-37)*32] = mat_xw38;
                    Wx_w[(50-37)*32-1:(50-38)*32] = mat_xw39;
                    Wx_w[(50-38)*32-1:(50-39)*32] = mat_xw40;
                    Wx_w[(50-39)*32-1:(50-40)*32] = mat_xw41;
                    Wx_w[(50-40)*32-1:(50-41)*32] = mat_xw42;
                    Wx_w[(50-41)*32-1:(50-42)*32] = mat_xw43;
                    Wx_w[(50-42)*32-1:(50-43)*32] = mat_xw44;
                    Wx_w[(50-43)*32-1:(50-44)*32] = mat_xw45;
                    Wx_w[(50-44)*32-1:(50-45)*32] = mat_xw46;
                    Wx_w[(50-45)*32-1:(50-46)*32] = mat_xw47;
                    Wx_w[(50-46)*32-1:(50-47)*32] = mat_xw48;
                    Wx_w[(50-47)*32-1:(50-48)*32] = mat_xw49;
                    Wx_w[(50-48)*32-1:(50-49)*32] = mat_xw50;
                end else begin
                    state_nxt = IDLE;
                end
            end else begin
                state_nxt = CAL;
            end
        end else if(state_cur == IDLE) begin
            if(write) begin
                state_nxt = GET;
                cnt_w = cnt_r + 1;
                Wx_w[8*3-1:0] = i_batch[8*3-1:0];
                last_w = i_batch[31];
            end else begin
                state_nxt = IDLE;
            end
        end else begin
            if(write) begin
                if(cnt_r == 'd50) begin
                    state_nxt = INIT;
                    cnt_w = 'd0;
                    Wx_w = 'd0;
                end else begin
                    state_nxt = SEND;
                    cnt_w = cnt_r + 1;
                    if(cnt_r == 'd0) begin
                        Wx_w = Wx_r;
                    end else begin
                        Wx_w = { Wx_r[(50)*32-1:0], 32'd0 };
                    end
                end
            end else begin
                state_nxt = SEND;
            end
        end
    end
    always_comb begin
        if(state_cur == INIT) begin
            o_batch = 'd0;
        end else if(state_cur == GET) begin
            //o_batch = 'd0;
            o_batch = { 16'd0, cnt_r };
        end else if(state_cur == CAL) begin
            o_batch = 'd0;
        end else if(state_cur == IDLE) begin
            o_batch = 'd1;
        end else begin  // SEND
            if(cnt_r) begin
                o_batch = Wx_r[(50+1)*32-1:(50)*32];
            end else begin
                o_batch = 'd1;
            end
        end
    end

    always_ff @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_cur <= INIT;
            Wx_r <= 'd0;
            cnt_r <= 'd0;
            last_r <= 'd0;
            out_r <= 'd0;
        end else begin
            state_cur <= state_nxt;
            Wx_r <= Wx_w;
            cnt_r <= cnt_w;
            last_r <= last_w;
            out_r <= out_w;
        end
    end
endmodule
