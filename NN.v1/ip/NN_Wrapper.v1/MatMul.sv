module ConvertWX(
    input [8-1:0] i_x1,
    input [8-1:0] i_x2,
    input [8-1:0] i_x3,
    input [8-1:0] i_x4,
    input [8-1:0] i_x5,
    input [8-1:0] i_x6,
    input [8-1:0] i_x7,
    input [8-1:0] i_x8,
    input [8-1:0] i_x9,
    input [8-1:0] i_x10,
    input [8-1:0] i_x11,
    input [8-1:0] i_x12,
    input [8-1:0] i_x13,
    input [8-1:0] i_x14,
    input [8-1:0] i_x15,
    input [8-1:0] i_x16,
    input [8-1:0] i_x17,
    input [8-1:0] i_x18,
    input [8-1:0] i_x19,
    input [8-1:0] i_x20,
    input [8-1:0] i_x21,
    input [8-1:0] i_x22,
    input [8-1:0] i_x23,
    input [8-1:0] i_x24,
    input [8-1:0] i_x25,
    input [8-1:0] i_x26,
    input [8-1:0] i_x27,
    input [8-1:0] i_x28,
    input [8-1:0] i_x29,
    input [8-1:0] i_x30,
    input [8-1:0] i_x31,
    input [8-1:0] i_x32,
    input [8-1:0] i_x33,
    input [8-1:0] i_x34,
    input [8-1:0] i_x35,
    input [8-1:0] i_x36,
    input [8-1:0] i_x37,
    input [8-1:0] i_x38,
    input [8-1:0] i_x39,
    input [8-1:0] i_x40,
    input [8-1:0] i_x41,
    input [8-1:0] i_x42,
    input [8-1:0] i_x43,
    input [8-1:0] i_x44,
    input [8-1:0] i_x45,
    input [8-1:0] i_x46,
    input [8-1:0] i_x47,
    input [8-1:0] i_x48,
    input [8-1:0] i_x49,
    input [8-1:0] i_x50,
    input [8-1:0] i_w,
    output [8-1:0] o_x1,
    output [8-1:0] o_x2,
    output [8-1:0] o_x3,
    output [8-1:0] o_x4,
    output [8-1:0] o_x5,
    output [8-1:0] o_x6,
    output [8-1:0] o_x7,
    output [8-1:0] o_x8,
    output [8-1:0] o_x9,
    output [8-1:0] o_x10,
    output [8-1:0] o_x11,
    output [8-1:0] o_x12,
    output [8-1:0] o_x13,
    output [8-1:0] o_x14,
    output [8-1:0] o_x15,
    output [8-1:0] o_x16,
    output [8-1:0] o_x17,
    output [8-1:0] o_x18,
    output [8-1:0] o_x19,
    output [8-1:0] o_x20,
    output [8-1:0] o_x21,
    output [8-1:0] o_x22,
    output [8-1:0] o_x23,
    output [8-1:0] o_x24,
    output [8-1:0] o_x25,
    output [8-1:0] o_x26,
    output [8-1:0] o_x27,
    output [8-1:0] o_x28,
    output [8-1:0] o_x29,
    output [8-1:0] o_x30,
    output [8-1:0] o_x31,
    output [8-1:0] o_x32,
    output [8-1:0] o_x33,
    output [8-1:0] o_x34,
    output [8-1:0] o_x35,
    output [8-1:0] o_x36,
    output [8-1:0] o_x37,
    output [8-1:0] o_x38,
    output [8-1:0] o_x39,
    output [8-1:0] o_x40,
    output [8-1:0] o_x41,
    output [8-1:0] o_x42,
    output [8-1:0] o_x43,
    output [8-1:0] o_x44,
    output [8-1:0] o_x45,
    output [8-1:0] o_x46,
    output [8-1:0] o_x47,
    output [8-1:0] o_x48,
    output [8-1:0] o_x49,
    output [8-1:0] o_x50,
    output [8-1:0] o_w
);
    logic w_sign;
    logic [8-2:0] w_mag;
    always_comb begin
        w_sign = i_w[8-1];
        if(i_w[8-1] == 1'b1) begin
            if(i_w[8-2:0] == 'd0) begin
                w_mag = ~i_w[8-2:0];
            end else begin
                w_mag = ~(i_w[8-2:0]-1);
            end
        end else begin
            w_mag = i_w[8-2:0];
        end
    end
    assign o_w = { w_sign, w_mag };
    assign o_x1 = { ~i_x1[8-1], i_x1[8-2:0] };
    assign o_x2 = { ~i_x2[8-1], i_x2[8-2:0] };
    assign o_x3 = { ~i_x3[8-1], i_x3[8-2:0] };
    assign o_x4 = { ~i_x4[8-1], i_x4[8-2:0] };
    assign o_x5 = { ~i_x5[8-1], i_x5[8-2:0] };
    assign o_x6 = { ~i_x6[8-1], i_x6[8-2:0] };
    assign o_x7 = { ~i_x7[8-1], i_x7[8-2:0] };
    assign o_x8 = { ~i_x8[8-1], i_x8[8-2:0] };
    assign o_x9 = { ~i_x9[8-1], i_x9[8-2:0] };
    assign o_x10 = { ~i_x10[8-1], i_x10[8-2:0] };
    assign o_x11 = { ~i_x11[8-1], i_x11[8-2:0] };
    assign o_x12 = { ~i_x12[8-1], i_x12[8-2:0] };
    assign o_x13 = { ~i_x13[8-1], i_x13[8-2:0] };
    assign o_x14 = { ~i_x14[8-1], i_x14[8-2:0] };
    assign o_x15 = { ~i_x15[8-1], i_x15[8-2:0] };
    assign o_x16 = { ~i_x16[8-1], i_x16[8-2:0] };
    assign o_x17 = { ~i_x17[8-1], i_x17[8-2:0] };
    assign o_x18 = { ~i_x18[8-1], i_x18[8-2:0] };
    assign o_x19 = { ~i_x19[8-1], i_x19[8-2:0] };
    assign o_x20 = { ~i_x20[8-1], i_x20[8-2:0] };
    assign o_x21 = { ~i_x21[8-1], i_x21[8-2:0] };
    assign o_x22 = { ~i_x22[8-1], i_x22[8-2:0] };
    assign o_x23 = { ~i_x23[8-1], i_x23[8-2:0] };
    assign o_x24 = { ~i_x24[8-1], i_x24[8-2:0] };
    assign o_x25 = { ~i_x25[8-1], i_x25[8-2:0] };
    assign o_x26 = { ~i_x26[8-1], i_x26[8-2:0] };
    assign o_x27 = { ~i_x27[8-1], i_x27[8-2:0] };
    assign o_x28 = { ~i_x28[8-1], i_x28[8-2:0] };
    assign o_x29 = { ~i_x29[8-1], i_x29[8-2:0] };
    assign o_x30 = { ~i_x30[8-1], i_x30[8-2:0] };
    assign o_x31 = { ~i_x31[8-1], i_x31[8-2:0] };
    assign o_x32 = { ~i_x32[8-1], i_x32[8-2:0] };
    assign o_x33 = { ~i_x33[8-1], i_x33[8-2:0] };
    assign o_x34 = { ~i_x34[8-1], i_x34[8-2:0] };
    assign o_x35 = { ~i_x35[8-1], i_x35[8-2:0] };
    assign o_x36 = { ~i_x36[8-1], i_x36[8-2:0] };
    assign o_x37 = { ~i_x37[8-1], i_x37[8-2:0] };
    assign o_x38 = { ~i_x38[8-1], i_x38[8-2:0] };
    assign o_x39 = { ~i_x39[8-1], i_x39[8-2:0] };
    assign o_x40 = { ~i_x40[8-1], i_x40[8-2:0] };
    assign o_x41 = { ~i_x41[8-1], i_x41[8-2:0] };
    assign o_x42 = { ~i_x42[8-1], i_x42[8-2:0] };
    assign o_x43 = { ~i_x43[8-1], i_x43[8-2:0] };
    assign o_x44 = { ~i_x44[8-1], i_x44[8-2:0] };
    assign o_x45 = { ~i_x45[8-1], i_x45[8-2:0] };
    assign o_x46 = { ~i_x46[8-1], i_x46[8-2:0] };
    assign o_x47 = { ~i_x47[8-1], i_x47[8-2:0] };
    assign o_x48 = { ~i_x48[8-1], i_x48[8-2:0] };
    assign o_x49 = { ~i_x49[8-1], i_x49[8-2:0] };
    assign o_x50 = { ~i_x50[8-1], i_x50[8-2:0] };
endmodule

module Mat_Mul(
    input i_clk,
    input i_rst,
    input i_next,
    input [8-1:0] i_x1,
    input [8-1:0] i_x2,
    input [8-1:0] i_x3,
    input [8-1:0] i_x4,
    input [8-1:0] i_x5,
    input [8-1:0] i_x6,
    input [8-1:0] i_x7,
    input [8-1:0] i_x8,
    input [8-1:0] i_x9,
    input [8-1:0] i_x10,
    input [8-1:0] i_x11,
    input [8-1:0] i_x12,
    input [8-1:0] i_x13,
    input [8-1:0] i_x14,
    input [8-1:0] i_x15,
    input [8-1:0] i_x16,
    input [8-1:0] i_x17,
    input [8-1:0] i_x18,
    input [8-1:0] i_x19,
    input [8-1:0] i_x20,
    input [8-1:0] i_x21,
    input [8-1:0] i_x22,
    input [8-1:0] i_x23,
    input [8-1:0] i_x24,
    input [8-1:0] i_x25,
    input [8-1:0] i_x26,
    input [8-1:0] i_x27,
    input [8-1:0] i_x28,
    input [8-1:0] i_x29,
    input [8-1:0] i_x30,
    input [8-1:0] i_x31,
    input [8-1:0] i_x32,
    input [8-1:0] i_x33,
    input [8-1:0] i_x34,
    input [8-1:0] i_x35,
    input [8-1:0] i_x36,
    input [8-1:0] i_x37,
    input [8-1:0] i_x38,
    input [8-1:0] i_x39,
    input [8-1:0] i_x40,
    input [8-1:0] i_x41,
    input [8-1:0] i_x42,
    input [8-1:0] i_x43,
    input [8-1:0] i_x44,
    input [8-1:0] i_x45,
    input [8-1:0] i_x46,
    input [8-1:0] i_x47,
    input [8-1:0] i_x48,
    input [8-1:0] i_x49,
    input [8-1:0] i_x50,
    input [8-1:0] i_w,
    output logic signed [32-1:0] o_wx1,
    output logic signed [32-1:0] o_wx2,
    output logic signed [32-1:0] o_wx3,
    output logic signed [32-1:0] o_wx4,
    output logic signed [32-1:0] o_wx5,
    output logic signed [32-1:0] o_wx6,
    output logic signed [32-1:0] o_wx7,
    output logic signed [32-1:0] o_wx8,
    output logic signed [32-1:0] o_wx9,
    output logic signed [32-1:0] o_wx10,
    output logic signed [32-1:0] o_wx11,
    output logic signed [32-1:0] o_wx12,
    output logic signed [32-1:0] o_wx13,
    output logic signed [32-1:0] o_wx14,
    output logic signed [32-1:0] o_wx15,
    output logic signed [32-1:0] o_wx16,
    output logic signed [32-1:0] o_wx17,
    output logic signed [32-1:0] o_wx18,
    output logic signed [32-1:0] o_wx19,
    output logic signed [32-1:0] o_wx20,
    output logic signed [32-1:0] o_wx21,
    output logic signed [32-1:0] o_wx22,
    output logic signed [32-1:0] o_wx23,
    output logic signed [32-1:0] o_wx24,
    output logic signed [32-1:0] o_wx25,
    output logic signed [32-1:0] o_wx26,
    output logic signed [32-1:0] o_wx27,
    output logic signed [32-1:0] o_wx28,
    output logic signed [32-1:0] o_wx29,
    output logic signed [32-1:0] o_wx30,
    output logic signed [32-1:0] o_wx31,
    output logic signed [32-1:0] o_wx32,
    output logic signed [32-1:0] o_wx33,
    output logic signed [32-1:0] o_wx34,
    output logic signed [32-1:0] o_wx35,
    output logic signed [32-1:0] o_wx36,
    output logic signed [32-1:0] o_wx37,
    output logic signed [32-1:0] o_wx38,
    output logic signed [32-1:0] o_wx39,
    output logic signed [32-1:0] o_wx40,
    output logic signed [32-1:0] o_wx41,
    output logic signed [32-1:0] o_wx42,
    output logic signed [32-1:0] o_wx43,
    output logic signed [32-1:0] o_wx44,
    output logic signed [32-1:0] o_wx45,
    output logic signed [32-1:0] o_wx46,
    output logic signed [32-1:0] o_wx47,
    output logic signed [32-1:0] o_wx48,
    output logic signed [32-1:0] o_wx49,
    output logic signed [32-1:0] o_wx50,
    output o_rdy
);
    enum  {IDLE, INIT, CAL, DONE} state_cur, state_nxt;
    logic [8-1:0]  conv_x1,  conv_x2,  conv_x3,  conv_x4,  conv_x5,  conv_x6,  conv_x7,  conv_x8,  conv_x9,  conv_x10,  conv_x11,  conv_x12,  conv_x13,  conv_x14,  conv_x15,  conv_x16,  conv_x17,  conv_x18,  conv_x19,  conv_x20,  conv_x21,  conv_x22,  conv_x23,  conv_x24,  conv_x25,  conv_x26,  conv_x27,  conv_x28,  conv_x29,  conv_x30,  conv_x31,  conv_x32,  conv_x33,  conv_x34,  conv_x35,  conv_x36,  conv_x37,  conv_x38,  conv_x39,  conv_x40,  conv_x41,  conv_x42,  conv_x43,  conv_x44,  conv_x45,  conv_x46,  conv_x47,  conv_x48,  conv_x49,  conv_x50,  conv_w;
    logic [8-1:0]  x1_r, x1_w, x2_r, x2_w, x3_r, x3_w, x4_r, x4_w, x5_r, x5_w, x6_r, x6_w, x7_r, x7_w, x8_r, x8_w, x9_r, x9_w, x10_r, x10_w, x11_r, x11_w, x12_r, x12_w, x13_r, x13_w, x14_r, x14_w, x15_r, x15_w, x16_r, x16_w, x17_r, x17_w, x18_r, x18_w, x19_r, x19_w, x20_r, x20_w, x21_r, x21_w, x22_r, x22_w, x23_r, x23_w, x24_r, x24_w, x25_r, x25_w, x26_r, x26_w, x27_r, x27_w, x28_r, x28_w, x29_r, x29_w, x30_r, x30_w, x31_r, x31_w, x32_r, x32_w, x33_r, x33_w, x34_r, x34_w, x35_r, x35_w, x36_r, x36_w, x37_r, x37_w, x38_r, x38_w, x39_r, x39_w, x40_r, x40_w, x41_r, x41_w, x42_r, x42_w, x43_r, x43_w, x44_r, x44_w, x45_r, x45_w, x46_r, x46_w, x47_r, x47_w, x48_r, x48_w, x49_r, x49_w, x50_r, x50_w;
    logic [8-2:0] w_mag_w, w_mag_r;
    logic w_sign_w, w_sign_r;
    logic signed [31:0] cnt1_w, cnt1_r;
    logic signed [31:0] cnt2_w, cnt2_r;
    logic signed [31:0] cnt3_w, cnt3_r;
    logic signed [31:0] cnt4_w, cnt4_r;
    logic signed [31:0] cnt5_w, cnt5_r;
    logic signed [31:0] cnt6_w, cnt6_r;
    logic signed [31:0] cnt7_w, cnt7_r;
    logic signed [31:0] cnt8_w, cnt8_r;
    logic signed [31:0] cnt9_w, cnt9_r;
    logic signed [31:0] cnt10_w, cnt10_r;
    logic signed [31:0] cnt11_w, cnt11_r;
    logic signed [31:0] cnt12_w, cnt12_r;
    logic signed [31:0] cnt13_w, cnt13_r;
    logic signed [31:0] cnt14_w, cnt14_r;
    logic signed [31:0] cnt15_w, cnt15_r;
    logic signed [31:0] cnt16_w, cnt16_r;
    logic signed [31:0] cnt17_w, cnt17_r;
    logic signed [31:0] cnt18_w, cnt18_r;
    logic signed [31:0] cnt19_w, cnt19_r;
    logic signed [31:0] cnt20_w, cnt20_r;
    logic signed [31:0] cnt21_w, cnt21_r;
    logic signed [31:0] cnt22_w, cnt22_r;
    logic signed [31:0] cnt23_w, cnt23_r;
    logic signed [31:0] cnt24_w, cnt24_r;
    logic signed [31:0] cnt25_w, cnt25_r;
    logic signed [31:0] cnt26_w, cnt26_r;
    logic signed [31:0] cnt27_w, cnt27_r;
    logic signed [31:0] cnt28_w, cnt28_r;
    logic signed [31:0] cnt29_w, cnt29_r;
    logic signed [31:0] cnt30_w, cnt30_r;
    logic signed [31:0] cnt31_w, cnt31_r;
    logic signed [31:0] cnt32_w, cnt32_r;
    logic signed [31:0] cnt33_w, cnt33_r;
    logic signed [31:0] cnt34_w, cnt34_r;
    logic signed [31:0] cnt35_w, cnt35_r;
    logic signed [31:0] cnt36_w, cnt36_r;
    logic signed [31:0] cnt37_w, cnt37_r;
    logic signed [31:0] cnt38_w, cnt38_r;
    logic signed [31:0] cnt39_w, cnt39_r;
    logic signed [31:0] cnt40_w, cnt40_r;
    logic signed [31:0] cnt41_w, cnt41_r;
    logic signed [31:0] cnt42_w, cnt42_r;
    logic signed [31:0] cnt43_w, cnt43_r;
    logic signed [31:0] cnt44_w, cnt44_r;
    logic signed [31:0] cnt45_w, cnt45_r;
    logic signed [31:0] cnt46_w, cnt46_r;
    logic signed [31:0] cnt47_w, cnt47_r;
    logic signed [31:0] cnt48_w, cnt48_r;
    logic signed [31:0] cnt49_w, cnt49_r;
    logic signed [31:0] cnt50_w, cnt50_r;
    logic mux_out1,mux_out2,mux_out3,mux_out4,mux_out5,mux_out6,mux_out7,mux_out8,mux_out9,mux_out10,mux_out11,mux_out12,mux_out13,mux_out14,mux_out15,mux_out16,mux_out17,mux_out18,mux_out19,mux_out20,mux_out21,mux_out22,mux_out23,mux_out24,mux_out25,mux_out26,mux_out27,mux_out28,mux_out29,mux_out30,mux_out31,mux_out32,mux_out33,mux_out34,mux_out35,mux_out36,mux_out37,mux_out38,mux_out39,mux_out40,mux_out41,mux_out42,mux_out43,mux_out44,mux_out45,mux_out46,mux_out47,mux_out48,mux_out49,mux_out50;
    logic mux_rst;

    ConvertWX ConvertWX(
        .i_x1(i_x1),
        .i_x2(i_x2),
        .i_x3(i_x3),
        .i_x4(i_x4),
        .i_x5(i_x5),
        .i_x6(i_x6),
        .i_x7(i_x7),
        .i_x8(i_x8),
        .i_x9(i_x9),
        .i_x10(i_x10),
        .i_x11(i_x11),
        .i_x12(i_x12),
        .i_x13(i_x13),
        .i_x14(i_x14),
        .i_x15(i_x15),
        .i_x16(i_x16),
        .i_x17(i_x17),
        .i_x18(i_x18),
        .i_x19(i_x19),
        .i_x20(i_x20),
        .i_x21(i_x21),
        .i_x22(i_x22),
        .i_x23(i_x23),
        .i_x24(i_x24),
        .i_x25(i_x25),
        .i_x26(i_x26),
        .i_x27(i_x27),
        .i_x28(i_x28),
        .i_x29(i_x29),
        .i_x30(i_x30),
        .i_x31(i_x31),
        .i_x32(i_x32),
        .i_x33(i_x33),
        .i_x34(i_x34),
        .i_x35(i_x35),
        .i_x36(i_x36),
        .i_x37(i_x37),
        .i_x38(i_x38),
        .i_x39(i_x39),
        .i_x40(i_x40),
        .i_x41(i_x41),
        .i_x42(i_x42),
        .i_x43(i_x43),
        .i_x44(i_x44),
        .i_x45(i_x45),
        .i_x46(i_x46),
        .i_x47(i_x47),
        .i_x48(i_x48),
        .i_x49(i_x49),
        .i_x50(i_x50),
        .i_w(i_w),
        .o_x1(conv_x1),
        .o_x2(conv_x2),
        .o_x3(conv_x3),
        .o_x4(conv_x4),
        .o_x5(conv_x5),
        .o_x6(conv_x6),
        .o_x7(conv_x7),
        .o_x8(conv_x8),
        .o_x9(conv_x9),
        .o_x10(conv_x10),
        .o_x11(conv_x11),
        .o_x12(conv_x12),
        .o_x13(conv_x13),
        .o_x14(conv_x14),
        .o_x15(conv_x15),
        .o_x16(conv_x16),
        .o_x17(conv_x17),
        .o_x18(conv_x18),
        .o_x19(conv_x19),
        .o_x20(conv_x20),
        .o_x21(conv_x21),
        .o_x22(conv_x22),
        .o_x23(conv_x23),
        .o_x24(conv_x24),
        .o_x25(conv_x25),
        .o_x26(conv_x26),
        .o_x27(conv_x27),
        .o_x28(conv_x28),
        .o_x29(conv_x29),
        .o_x30(conv_x30),
        .o_x31(conv_x31),
        .o_x32(conv_x32),
        .o_x33(conv_x33),
        .o_x34(conv_x34),
        .o_x35(conv_x35),
        .o_x36(conv_x36),
        .o_x37(conv_x37),
        .o_x38(conv_x38),
        .o_x39(conv_x39),
        .o_x40(conv_x40),
        .o_x41(conv_x41),
        .o_x42(conv_x42),
        .o_x43(conv_x43),
        .o_x44(conv_x44),
        .o_x45(conv_x45),
        .o_x46(conv_x46),
        .o_x47(conv_x47),
        .o_x48(conv_x48),
        .o_x49(conv_x49),
        .o_x50(conv_x50),
        .o_w(conv_w)
     );

    X_Mux_8 x1_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x1_w),
        .o_x(mux_out1)
    );
    X_Mux_8 x2_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x2_w),
        .o_x(mux_out2)
    );
    X_Mux_8 x3_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x3_w),
        .o_x(mux_out3)
    );
    X_Mux_8 x4_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x4_w),
        .o_x(mux_out4)
    );
    X_Mux_8 x5_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x5_w),
        .o_x(mux_out5)
    );
    X_Mux_8 x6_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x6_w),
        .o_x(mux_out6)
    );
    X_Mux_8 x7_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x7_w),
        .o_x(mux_out7)
    );
    X_Mux_8 x8_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x8_w),
        .o_x(mux_out8)
    );
    X_Mux_8 x9_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x9_w),
        .o_x(mux_out9)
    );
    X_Mux_8 x10_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x10_w),
        .o_x(mux_out10)
    );
    X_Mux_8 x11_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x11_w),
        .o_x(mux_out11)
    );
    X_Mux_8 x12_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x12_w),
        .o_x(mux_out12)
    );
    X_Mux_8 x13_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x13_w),
        .o_x(mux_out13)
    );
    X_Mux_8 x14_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x14_w),
        .o_x(mux_out14)
    );
    X_Mux_8 x15_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x15_w),
        .o_x(mux_out15)
    );
    X_Mux_8 x16_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x16_w),
        .o_x(mux_out16)
    );
    X_Mux_8 x17_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x17_w),
        .o_x(mux_out17)
    );
    X_Mux_8 x18_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x18_w),
        .o_x(mux_out18)
    );
    X_Mux_8 x19_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x19_w),
        .o_x(mux_out19)
    );
    X_Mux_8 x20_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x20_w),
        .o_x(mux_out20)
    );
    X_Mux_8 x21_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x21_w),
        .o_x(mux_out21)
    );
    X_Mux_8 x22_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x22_w),
        .o_x(mux_out22)
    );
    X_Mux_8 x23_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x23_w),
        .o_x(mux_out23)
    );
    X_Mux_8 x24_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x24_w),
        .o_x(mux_out24)
    );
    X_Mux_8 x25_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x25_w),
        .o_x(mux_out25)
    );
    X_Mux_8 x26_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x26_w),
        .o_x(mux_out26)
    );
    X_Mux_8 x27_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x27_w),
        .o_x(mux_out27)
    );
    X_Mux_8 x28_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x28_w),
        .o_x(mux_out28)
    );
    X_Mux_8 x29_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x29_w),
        .o_x(mux_out29)
    );
    X_Mux_8 x30_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x30_w),
        .o_x(mux_out30)
    );
    X_Mux_8 x31_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x31_w),
        .o_x(mux_out31)
    );
    X_Mux_8 x32_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x32_w),
        .o_x(mux_out32)
    );
    X_Mux_8 x33_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x33_w),
        .o_x(mux_out33)
    );
    X_Mux_8 x34_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x34_w),
        .o_x(mux_out34)
    );
    X_Mux_8 x35_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x35_w),
        .o_x(mux_out35)
    );
    X_Mux_8 x36_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x36_w),
        .o_x(mux_out36)
    );
    X_Mux_8 x37_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x37_w),
        .o_x(mux_out37)
    );
    X_Mux_8 x38_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x38_w),
        .o_x(mux_out38)
    );
    X_Mux_8 x39_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x39_w),
        .o_x(mux_out39)
    );
    X_Mux_8 x40_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x40_w),
        .o_x(mux_out40)
    );
    X_Mux_8 x41_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x41_w),
        .o_x(mux_out41)
    );
    X_Mux_8 x42_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x42_w),
        .o_x(mux_out42)
    );
    X_Mux_8 x43_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x43_w),
        .o_x(mux_out43)
    );
    X_Mux_8 x44_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x44_w),
        .o_x(mux_out44)
    );
    X_Mux_8 x45_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x45_w),
        .o_x(mux_out45)
    );
    X_Mux_8 x46_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x46_w),
        .o_x(mux_out46)
    );
    X_Mux_8 x47_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x47_w),
        .o_x(mux_out47)
    );
    X_Mux_8 x48_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x48_w),
        .o_x(mux_out48)
    );
    X_Mux_8 x49_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x49_w),
        .o_x(mux_out49)
    );
    X_Mux_8 x50_mux(
        .i_clk(i_clk),
        .i_rst(mux_rst),
        .i_x(x50_w),
        .o_x(mux_out50)
    );
    always_comb begin
        o_rdy = 1'b0;
        o_wx1 = 'd0;
        o_wx2 = 'd0;
        o_wx3 = 'd0;
        o_wx4 = 'd0;
        o_wx5 = 'd0;
        o_wx6 = 'd0;
        o_wx7 = 'd0;
        o_wx8 = 'd0;
        o_wx9 = 'd0;
        o_wx10 = 'd0;
        o_wx11 = 'd0;
        o_wx12 = 'd0;
        o_wx13 = 'd0;
        o_wx14 = 'd0;
        o_wx15 = 'd0;
        o_wx16 = 'd0;
        o_wx17 = 'd0;
        o_wx18 = 'd0;
        o_wx19 = 'd0;
        o_wx20 = 'd0;
        o_wx21 = 'd0;
        o_wx22 = 'd0;
        o_wx23 = 'd0;
        o_wx24 = 'd0;
        o_wx25 = 'd0;
        o_wx26 = 'd0;
        o_wx27 = 'd0;
        o_wx28 = 'd0;
        o_wx29 = 'd0;
        o_wx30 = 'd0;
        o_wx31 = 'd0;
        o_wx32 = 'd0;
        o_wx33 = 'd0;
        o_wx34 = 'd0;
        o_wx35 = 'd0;
        o_wx36 = 'd0;
        o_wx37 = 'd0;
        o_wx38 = 'd0;
        o_wx39 = 'd0;
        o_wx40 = 'd0;
        o_wx41 = 'd0;
        o_wx42 = 'd0;
        o_wx43 = 'd0;
        o_wx44 = 'd0;
        o_wx45 = 'd0;
        o_wx46 = 'd0;
        o_wx47 = 'd0;
        o_wx48 = 'd0;
        o_wx49 = 'd0;
        o_wx50 = 'd0;
        cnt1_w = cnt1_r;
        cnt2_w = cnt2_r;
        cnt3_w = cnt3_r;
        cnt4_w = cnt4_r;
        cnt5_w = cnt5_r;
        cnt6_w = cnt6_r;
        cnt7_w = cnt7_r;
        cnt8_w = cnt8_r;
        cnt9_w = cnt9_r;
        cnt10_w = cnt10_r;
        cnt11_w = cnt11_r;
        cnt12_w = cnt12_r;
        cnt13_w = cnt13_r;
        cnt14_w = cnt14_r;
        cnt15_w = cnt15_r;
        cnt16_w = cnt16_r;
        cnt17_w = cnt17_r;
        cnt18_w = cnt18_r;
        cnt19_w = cnt19_r;
        cnt20_w = cnt20_r;
        cnt21_w = cnt21_r;
        cnt22_w = cnt22_r;
        cnt23_w = cnt23_r;
        cnt24_w = cnt24_r;
        cnt25_w = cnt25_r;
        cnt26_w = cnt26_r;
        cnt27_w = cnt27_r;
        cnt28_w = cnt28_r;
        cnt29_w = cnt29_r;
        cnt30_w = cnt30_r;
        cnt31_w = cnt31_r;
        cnt32_w = cnt32_r;
        cnt33_w = cnt33_r;
        cnt34_w = cnt34_r;
        cnt35_w = cnt35_r;
        cnt36_w = cnt36_r;
        cnt37_w = cnt37_r;
        cnt38_w = cnt38_r;
        cnt39_w = cnt39_r;
        cnt40_w = cnt40_r;
        cnt41_w = cnt41_r;
        cnt42_w = cnt42_r;
        cnt43_w = cnt43_r;
        cnt44_w = cnt44_r;
        cnt45_w = cnt45_r;
        cnt46_w = cnt46_r;
        cnt47_w = cnt47_r;
        cnt48_w = cnt48_r;
        cnt49_w = cnt49_r;
        cnt50_w = cnt50_r;
        x1_w = x1_r;
        x2_w = x2_r;
        x3_w = x3_r;
        x4_w = x4_r;
        x5_w = x5_r;
        x6_w = x6_r;
        x7_w = x7_r;
        x8_w = x8_r;
        x9_w = x9_r;
        x10_w = x10_r;
        x11_w = x11_r;
        x12_w = x12_r;
        x13_w = x13_r;
        x14_w = x14_r;
        x15_w = x15_r;
        x16_w = x16_r;
        x17_w = x17_r;
        x18_w = x18_r;
        x19_w = x19_r;
        x20_w = x20_r;
        x21_w = x21_r;
        x22_w = x22_r;
        x23_w = x23_r;
        x24_w = x24_r;
        x25_w = x25_r;
        x26_w = x26_r;
        x27_w = x27_r;
        x28_w = x28_r;
        x29_w = x29_r;
        x30_w = x30_r;
        x31_w = x31_r;
        x32_w = x32_r;
        x33_w = x33_r;
        x34_w = x34_r;
        x35_w = x35_r;
        x36_w = x36_r;
        x37_w = x37_r;
        x38_w = x38_r;
        x39_w = x39_r;
        x40_w = x40_r;
        x41_w = x41_r;
        x42_w = x42_r;
        x43_w = x43_r;
        x44_w = x44_r;
        x45_w = x45_r;
        x46_w = x46_r;
        x47_w = x47_r;
        x48_w = x48_r;
        x49_w = x49_r;
        x50_w = x50_r;
        state_nxt = state_cur;
        w_mag_w = w_mag_r;
        w_sign_w = w_sign_r;
        mux_rst = 1'b0;
        if(state_cur == IDLE) begin
            if(i_next) begin
                state_nxt = CAL;
                w_sign_w = conv_w[8-1];
                w_mag_w = conv_w[8-2:0];
                x1_w = conv_x1;
                x2_w = conv_x2;
                x3_w = conv_x3;
                x4_w = conv_x4;
                x5_w = conv_x5;
                x6_w = conv_x6;
                x7_w = conv_x7;
                x8_w = conv_x8;
                x9_w = conv_x9;
                x10_w = conv_x10;
                x11_w = conv_x11;
                x12_w = conv_x12;
                x13_w = conv_x13;
                x14_w = conv_x14;
                x15_w = conv_x15;
                x16_w = conv_x16;
                x17_w = conv_x17;
                x18_w = conv_x18;
                x19_w = conv_x19;
                x20_w = conv_x20;
                x21_w = conv_x21;
                x22_w = conv_x22;
                x23_w = conv_x23;
                x24_w = conv_x24;
                x25_w = conv_x25;
                x26_w = conv_x26;
                x27_w = conv_x27;
                x28_w = conv_x28;
                x29_w = conv_x29;
                x30_w = conv_x30;
                x31_w = conv_x31;
                x32_w = conv_x32;
                x33_w = conv_x33;
                x34_w = conv_x34;
                x35_w = conv_x35;
                x36_w = conv_x36;
                x37_w = conv_x37;
                x38_w = conv_x38;
                x39_w = conv_x39;
                x40_w = conv_x40;
                x41_w = conv_x41;
                x42_w = conv_x42;
                x43_w = conv_x43;
                x44_w = conv_x44;
                x45_w = conv_x45;
                x46_w = conv_x46;
                x47_w = conv_x47;
                x48_w = conv_x48;
                x49_w = conv_x49;
                x50_w = conv_x50;
            end else begin
                state_nxt = IDLE;
            end
            mux_rst = 1'b1;

        end else if(state_cur == CAL) begin
            if(w_mag_r == 'd0) begin
                state_nxt = DONE;
            end else begin
                state_nxt = CAL;
                w_mag_w = w_mag_r - 1;

                if(w_sign_r^mux_out1 == 1'b1)begin
                    cnt1_w = cnt1_r + 1;
                end else begin
                    cnt1_w = cnt1_r - 1;
                end
                if(w_sign_r^mux_out2 == 1'b1)begin
                    cnt2_w = cnt2_r + 1;
                end else begin
                    cnt2_w = cnt2_r - 1;
                end
                if(w_sign_r^mux_out3 == 1'b1)begin
                    cnt3_w = cnt3_r + 1;
                end else begin
                    cnt3_w = cnt3_r - 1;
                end
                if(w_sign_r^mux_out4 == 1'b1)begin
                    cnt4_w = cnt4_r + 1;
                end else begin
                    cnt4_w = cnt4_r - 1;
                end
                if(w_sign_r^mux_out5 == 1'b1)begin
                    cnt5_w = cnt5_r + 1;
                end else begin
                    cnt5_w = cnt5_r - 1;
                end
                if(w_sign_r^mux_out6 == 1'b1)begin
                    cnt6_w = cnt6_r + 1;
                end else begin
                    cnt6_w = cnt6_r - 1;
                end
                if(w_sign_r^mux_out7 == 1'b1)begin
                    cnt7_w = cnt7_r + 1;
                end else begin
                    cnt7_w = cnt7_r - 1;
                end
                if(w_sign_r^mux_out8 == 1'b1)begin
                    cnt8_w = cnt8_r + 1;
                end else begin
                    cnt8_w = cnt8_r - 1;
                end
                if(w_sign_r^mux_out9 == 1'b1)begin
                    cnt9_w = cnt9_r + 1;
                end else begin
                    cnt9_w = cnt9_r - 1;
                end
                if(w_sign_r^mux_out10 == 1'b1)begin
                    cnt10_w = cnt10_r + 1;
                end else begin
                    cnt10_w = cnt10_r - 1;
                end
                if(w_sign_r^mux_out11 == 1'b1)begin
                    cnt11_w = cnt11_r + 1;
                end else begin
                    cnt11_w = cnt11_r - 1;
                end
                if(w_sign_r^mux_out12 == 1'b1)begin
                    cnt12_w = cnt12_r + 1;
                end else begin
                    cnt12_w = cnt12_r - 1;
                end
                if(w_sign_r^mux_out13 == 1'b1)begin
                    cnt13_w = cnt13_r + 1;
                end else begin
                    cnt13_w = cnt13_r - 1;
                end
                if(w_sign_r^mux_out14 == 1'b1)begin
                    cnt14_w = cnt14_r + 1;
                end else begin
                    cnt14_w = cnt14_r - 1;
                end
                if(w_sign_r^mux_out15 == 1'b1)begin
                    cnt15_w = cnt15_r + 1;
                end else begin
                    cnt15_w = cnt15_r - 1;
                end
                if(w_sign_r^mux_out16 == 1'b1)begin
                    cnt16_w = cnt16_r + 1;
                end else begin
                    cnt16_w = cnt16_r - 1;
                end
                if(w_sign_r^mux_out17 == 1'b1)begin
                    cnt17_w = cnt17_r + 1;
                end else begin
                    cnt17_w = cnt17_r - 1;
                end
                if(w_sign_r^mux_out18 == 1'b1)begin
                    cnt18_w = cnt18_r + 1;
                end else begin
                    cnt18_w = cnt18_r - 1;
                end
                if(w_sign_r^mux_out19 == 1'b1)begin
                    cnt19_w = cnt19_r + 1;
                end else begin
                    cnt19_w = cnt19_r - 1;
                end
                if(w_sign_r^mux_out20 == 1'b1)begin
                    cnt20_w = cnt20_r + 1;
                end else begin
                    cnt20_w = cnt20_r - 1;
                end
                if(w_sign_r^mux_out21 == 1'b1)begin
                    cnt21_w = cnt21_r + 1;
                end else begin
                    cnt21_w = cnt21_r - 1;
                end
                if(w_sign_r^mux_out22 == 1'b1)begin
                    cnt22_w = cnt22_r + 1;
                end else begin
                    cnt22_w = cnt22_r - 1;
                end
                if(w_sign_r^mux_out23 == 1'b1)begin
                    cnt23_w = cnt23_r + 1;
                end else begin
                    cnt23_w = cnt23_r - 1;
                end
                if(w_sign_r^mux_out24 == 1'b1)begin
                    cnt24_w = cnt24_r + 1;
                end else begin
                    cnt24_w = cnt24_r - 1;
                end
                if(w_sign_r^mux_out25 == 1'b1)begin
                    cnt25_w = cnt25_r + 1;
                end else begin
                    cnt25_w = cnt25_r - 1;
                end
                if(w_sign_r^mux_out26 == 1'b1)begin
                    cnt26_w = cnt26_r + 1;
                end else begin
                    cnt26_w = cnt26_r - 1;
                end
                if(w_sign_r^mux_out27 == 1'b1)begin
                    cnt27_w = cnt27_r + 1;
                end else begin
                    cnt27_w = cnt27_r - 1;
                end
                if(w_sign_r^mux_out28 == 1'b1)begin
                    cnt28_w = cnt28_r + 1;
                end else begin
                    cnt28_w = cnt28_r - 1;
                end
                if(w_sign_r^mux_out29 == 1'b1)begin
                    cnt29_w = cnt29_r + 1;
                end else begin
                    cnt29_w = cnt29_r - 1;
                end
                if(w_sign_r^mux_out30 == 1'b1)begin
                    cnt30_w = cnt30_r + 1;
                end else begin
                    cnt30_w = cnt30_r - 1;
                end
                if(w_sign_r^mux_out31 == 1'b1)begin
                    cnt31_w = cnt31_r + 1;
                end else begin
                    cnt31_w = cnt31_r - 1;
                end
                if(w_sign_r^mux_out32 == 1'b1)begin
                    cnt32_w = cnt32_r + 1;
                end else begin
                    cnt32_w = cnt32_r - 1;
                end
                if(w_sign_r^mux_out33 == 1'b1)begin
                    cnt33_w = cnt33_r + 1;
                end else begin
                    cnt33_w = cnt33_r - 1;
                end
                if(w_sign_r^mux_out34 == 1'b1)begin
                    cnt34_w = cnt34_r + 1;
                end else begin
                    cnt34_w = cnt34_r - 1;
                end
                if(w_sign_r^mux_out35 == 1'b1)begin
                    cnt35_w = cnt35_r + 1;
                end else begin
                    cnt35_w = cnt35_r - 1;
                end
                if(w_sign_r^mux_out36 == 1'b1)begin
                    cnt36_w = cnt36_r + 1;
                end else begin
                    cnt36_w = cnt36_r - 1;
                end
                if(w_sign_r^mux_out37 == 1'b1)begin
                    cnt37_w = cnt37_r + 1;
                end else begin
                    cnt37_w = cnt37_r - 1;
                end
                if(w_sign_r^mux_out38 == 1'b1)begin
                    cnt38_w = cnt38_r + 1;
                end else begin
                    cnt38_w = cnt38_r - 1;
                end
                if(w_sign_r^mux_out39 == 1'b1)begin
                    cnt39_w = cnt39_r + 1;
                end else begin
                    cnt39_w = cnt39_r - 1;
                end
                if(w_sign_r^mux_out40 == 1'b1)begin
                    cnt40_w = cnt40_r + 1;
                end else begin
                    cnt40_w = cnt40_r - 1;
                end
                if(w_sign_r^mux_out41 == 1'b1)begin
                    cnt41_w = cnt41_r + 1;
                end else begin
                    cnt41_w = cnt41_r - 1;
                end
                if(w_sign_r^mux_out42 == 1'b1)begin
                    cnt42_w = cnt42_r + 1;
                end else begin
                    cnt42_w = cnt42_r - 1;
                end
                if(w_sign_r^mux_out43 == 1'b1)begin
                    cnt43_w = cnt43_r + 1;
                end else begin
                    cnt43_w = cnt43_r - 1;
                end
                if(w_sign_r^mux_out44 == 1'b1)begin
                    cnt44_w = cnt44_r + 1;
                end else begin
                    cnt44_w = cnt44_r - 1;
                end
                if(w_sign_r^mux_out45 == 1'b1)begin
                    cnt45_w = cnt45_r + 1;
                end else begin
                    cnt45_w = cnt45_r - 1;
                end
                if(w_sign_r^mux_out46 == 1'b1)begin
                    cnt46_w = cnt46_r + 1;
                end else begin
                    cnt46_w = cnt46_r - 1;
                end
                if(w_sign_r^mux_out47 == 1'b1)begin
                    cnt47_w = cnt47_r + 1;
                end else begin
                    cnt47_w = cnt47_r - 1;
                end
                if(w_sign_r^mux_out48 == 1'b1)begin
                    cnt48_w = cnt48_r + 1;
                end else begin
                    cnt48_w = cnt48_r - 1;
                end
                if(w_sign_r^mux_out49 == 1'b1)begin
                    cnt49_w = cnt49_r + 1;
                end else begin
                    cnt49_w = cnt49_r - 1;
                end
                if(w_sign_r^mux_out50 == 1'b1)begin
                    cnt50_w = cnt50_r + 1;
                end else begin
                    cnt50_w = cnt50_r - 1;
                end
            end
        end else begin
            o_rdy = 1'b1;
            o_wx1 = cnt1_r;
            o_wx2 = cnt2_r;
            o_wx3 = cnt3_r;
            o_wx4 = cnt4_r;
            o_wx5 = cnt5_r;
            o_wx6 = cnt6_r;
            o_wx7 = cnt7_r;
            o_wx8 = cnt8_r;
            o_wx9 = cnt9_r;
            o_wx10 = cnt10_r;
            o_wx11 = cnt11_r;
            o_wx12 = cnt12_r;
            o_wx13 = cnt13_r;
            o_wx14 = cnt14_r;
            o_wx15 = cnt15_r;
            o_wx16 = cnt16_r;
            o_wx17 = cnt17_r;
            o_wx18 = cnt18_r;
            o_wx19 = cnt19_r;
            o_wx20 = cnt20_r;
            o_wx21 = cnt21_r;
            o_wx22 = cnt22_r;
            o_wx23 = cnt23_r;
            o_wx24 = cnt24_r;
            o_wx25 = cnt25_r;
            o_wx26 = cnt26_r;
            o_wx27 = cnt27_r;
            o_wx28 = cnt28_r;
            o_wx29 = cnt29_r;
            o_wx30 = cnt30_r;
            o_wx31 = cnt31_r;
            o_wx32 = cnt32_r;
            o_wx33 = cnt33_r;
            o_wx34 = cnt34_r;
            o_wx35 = cnt35_r;
            o_wx36 = cnt36_r;
            o_wx37 = cnt37_r;
            o_wx38 = cnt38_r;
            o_wx39 = cnt39_r;
            o_wx40 = cnt40_r;
            o_wx41 = cnt41_r;
            o_wx42 = cnt42_r;
            o_wx43 = cnt43_r;
            o_wx44 = cnt44_r;
            o_wx45 = cnt45_r;
            o_wx46 = cnt46_r;
            o_wx47 = cnt47_r;
            o_wx48 = cnt48_r;
            o_wx49 = cnt49_r;
            o_wx50 = cnt50_r;
            if(i_next) begin
                state_nxt = CAL;
                mux_rst = 1'b1;
                w_sign_w = conv_w[8-1];
                w_mag_w = conv_w[8-2:0];
                x1_w = conv_x1;
                x2_w = conv_x2;
                x3_w = conv_x3;
                x4_w = conv_x4;
                x5_w = conv_x5;
                x6_w = conv_x6;
                x7_w = conv_x7;
                x8_w = conv_x8;
                x9_w = conv_x9;
                x10_w = conv_x10;
                x11_w = conv_x11;
                x12_w = conv_x12;
                x13_w = conv_x13;
                x14_w = conv_x14;
                x15_w = conv_x15;
                x16_w = conv_x16;
                x17_w = conv_x17;
                x18_w = conv_x18;
                x19_w = conv_x19;
                x20_w = conv_x20;
                x21_w = conv_x21;
                x22_w = conv_x22;
                x23_w = conv_x23;
                x24_w = conv_x24;
                x25_w = conv_x25;
                x26_w = conv_x26;
                x27_w = conv_x27;
                x28_w = conv_x28;
                x29_w = conv_x29;
                x30_w = conv_x30;
                x31_w = conv_x31;
                x32_w = conv_x32;
                x33_w = conv_x33;
                x34_w = conv_x34;
                x35_w = conv_x35;
                x36_w = conv_x36;
                x37_w = conv_x37;
                x38_w = conv_x38;
                x39_w = conv_x39;
                x40_w = conv_x40;
                x41_w = conv_x41;
                x42_w = conv_x42;
                x43_w = conv_x43;
                x44_w = conv_x44;
                x45_w = conv_x45;
                x46_w = conv_x46;
                x47_w = conv_x47;
                x48_w = conv_x48;
                x49_w = conv_x49;
                x50_w = conv_x50;
            end else begin
                state_nxt = DONE;
            end
        end
    end

    always_ff @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_cur <= IDLE;
            x1_r <= 'd0;
            x2_r <= 'd0;
            x3_r <= 'd0;
            x4_r <= 'd0;
            x5_r <= 'd0;
            x6_r <= 'd0;
            x7_r <= 'd0;
            x8_r <= 'd0;
            x9_r <= 'd0;
            x10_r <= 'd0;
            x11_r <= 'd0;
            x12_r <= 'd0;
            x13_r <= 'd0;
            x14_r <= 'd0;
            x15_r <= 'd0;
            x16_r <= 'd0;
            x17_r <= 'd0;
            x18_r <= 'd0;
            x19_r <= 'd0;
            x20_r <= 'd0;
            x21_r <= 'd0;
            x22_r <= 'd0;
            x23_r <= 'd0;
            x24_r <= 'd0;
            x25_r <= 'd0;
            x26_r <= 'd0;
            x27_r <= 'd0;
            x28_r <= 'd0;
            x29_r <= 'd0;
            x30_r <= 'd0;
            x31_r <= 'd0;
            x32_r <= 'd0;
            x33_r <= 'd0;
            x34_r <= 'd0;
            x35_r <= 'd0;
            x36_r <= 'd0;
            x37_r <= 'd0;
            x38_r <= 'd0;
            x39_r <= 'd0;
            x40_r <= 'd0;
            x41_r <= 'd0;
            x42_r <= 'd0;
            x43_r <= 'd0;
            x44_r <= 'd0;
            x45_r <= 'd0;
            x46_r <= 'd0;
            x47_r <= 'd0;
            x48_r <= 'd0;
            x49_r <= 'd0;
            x50_r <= 'd0;
            w_mag_r <= 'd0;
            w_sign_r <= 1'b0;
            cnt1_r <= 'd0;
            cnt2_r <= 'd0;
            cnt3_r <= 'd0;
            cnt4_r <= 'd0;
            cnt5_r <= 'd0;
            cnt6_r <= 'd0;
            cnt7_r <= 'd0;
            cnt8_r <= 'd0;
            cnt9_r <= 'd0;
            cnt10_r <= 'd0;
            cnt11_r <= 'd0;
            cnt12_r <= 'd0;
            cnt13_r <= 'd0;
            cnt14_r <= 'd0;
            cnt15_r <= 'd0;
            cnt16_r <= 'd0;
            cnt17_r <= 'd0;
            cnt18_r <= 'd0;
            cnt19_r <= 'd0;
            cnt20_r <= 'd0;
            cnt21_r <= 'd0;
            cnt22_r <= 'd0;
            cnt23_r <= 'd0;
            cnt24_r <= 'd0;
            cnt25_r <= 'd0;
            cnt26_r <= 'd0;
            cnt27_r <= 'd0;
            cnt28_r <= 'd0;
            cnt29_r <= 'd0;
            cnt30_r <= 'd0;
            cnt31_r <= 'd0;
            cnt32_r <= 'd0;
            cnt33_r <= 'd0;
            cnt34_r <= 'd0;
            cnt35_r <= 'd0;
            cnt36_r <= 'd0;
            cnt37_r <= 'd0;
            cnt38_r <= 'd0;
            cnt39_r <= 'd0;
            cnt40_r <= 'd0;
            cnt41_r <= 'd0;
            cnt42_r <= 'd0;
            cnt43_r <= 'd0;
            cnt44_r <= 'd0;
            cnt45_r <= 'd0;
            cnt46_r <= 'd0;
            cnt47_r <= 'd0;
            cnt48_r <= 'd0;
            cnt49_r <= 'd0;
            cnt50_r <= 'd0;
        end else begin
            state_cur <= state_nxt;
            x1_r <= x1_w;
            x2_r <= x2_w;
            x3_r <= x3_w;
            x4_r <= x4_w;
            x5_r <= x5_w;
            x6_r <= x6_w;
            x7_r <= x7_w;
            x8_r <= x8_w;
            x9_r <= x9_w;
            x10_r <= x10_w;
            x11_r <= x11_w;
            x12_r <= x12_w;
            x13_r <= x13_w;
            x14_r <= x14_w;
            x15_r <= x15_w;
            x16_r <= x16_w;
            x17_r <= x17_w;
            x18_r <= x18_w;
            x19_r <= x19_w;
            x20_r <= x20_w;
            x21_r <= x21_w;
            x22_r <= x22_w;
            x23_r <= x23_w;
            x24_r <= x24_w;
            x25_r <= x25_w;
            x26_r <= x26_w;
            x27_r <= x27_w;
            x28_r <= x28_w;
            x29_r <= x29_w;
            x30_r <= x30_w;
            x31_r <= x31_w;
            x32_r <= x32_w;
            x33_r <= x33_w;
            x34_r <= x34_w;
            x35_r <= x35_w;
            x36_r <= x36_w;
            x37_r <= x37_w;
            x38_r <= x38_w;
            x39_r <= x39_w;
            x40_r <= x40_w;
            x41_r <= x41_w;
            x42_r <= x42_w;
            x43_r <= x43_w;
            x44_r <= x44_w;
            x45_r <= x45_w;
            x46_r <= x46_w;
            x47_r <= x47_w;
            x48_r <= x48_w;
            x49_r <= x49_w;
            x50_r <= x50_w;
            w_mag_r <= w_mag_w;
            w_sign_r <= w_sign_w;
            cnt1_r <= cnt1_w;
            cnt2_r <= cnt2_w;
            cnt3_r <= cnt3_w;
            cnt4_r <= cnt4_w;
            cnt5_r <= cnt5_w;
            cnt6_r <= cnt6_w;
            cnt7_r <= cnt7_w;
            cnt8_r <= cnt8_w;
            cnt9_r <= cnt9_w;
            cnt10_r <= cnt10_w;
            cnt11_r <= cnt11_w;
            cnt12_r <= cnt12_w;
            cnt13_r <= cnt13_w;
            cnt14_r <= cnt14_w;
            cnt15_r <= cnt15_w;
            cnt16_r <= cnt16_w;
            cnt17_r <= cnt17_w;
            cnt18_r <= cnt18_w;
            cnt19_r <= cnt19_w;
            cnt20_r <= cnt20_w;
            cnt21_r <= cnt21_w;
            cnt22_r <= cnt22_w;
            cnt23_r <= cnt23_w;
            cnt24_r <= cnt24_w;
            cnt25_r <= cnt25_w;
            cnt26_r <= cnt26_w;
            cnt27_r <= cnt27_w;
            cnt28_r <= cnt28_w;
            cnt29_r <= cnt29_w;
            cnt30_r <= cnt30_w;
            cnt31_r <= cnt31_w;
            cnt32_r <= cnt32_w;
            cnt33_r <= cnt33_w;
            cnt34_r <= cnt34_w;
            cnt35_r <= cnt35_w;
            cnt36_r <= cnt36_w;
            cnt37_r <= cnt37_w;
            cnt38_r <= cnt38_w;
            cnt39_r <= cnt39_w;
            cnt40_r <= cnt40_w;
            cnt41_r <= cnt41_w;
            cnt42_r <= cnt42_w;
            cnt43_r <= cnt43_w;
            cnt44_r <= cnt44_w;
            cnt45_r <= cnt45_w;
            cnt46_r <= cnt46_w;
            cnt47_r <= cnt47_w;
            cnt48_r <= cnt48_w;
            cnt49_r <= cnt49_w;
            cnt50_r <= cnt50_w;
        end
    end
endmodule
