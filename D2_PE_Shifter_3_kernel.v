`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:21 12/21/2022 
// Design Name: 
// Module Name:    over_all 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D2_PE_Shifter_3_kernel(
input  [1:0] sel,
input clk, reset_n,
input [2:0]w11,w12,w13,w21,w22,w23,w31,w32,w33,
input s11,s12,s13,s21,s22,s23,s31,s32,s33,
input [7:0] R1,R2,R3,
output [15:0] Y11, Y12,Y13
    );
	 
wire [15:0] y11_1, y12_1, y13_1, y11_2, y12_2, y13_2, y11_3, y12_3, y13_3; 


PE_BS PE_BS_R1 (
	 .clk(clk), 
    .rst_n(reset_n), 
    .in(R1), 
    .w1(w11), 
    .w2(w12), 
    .w3(w13), 
	 
	 .s1(s11), 
    .s2(s12), 
    .s3(s13), 
	 
    .sel(sel), 
    .y1(y11_1), 
    .y2(y12_1), 
    .y3(y13_1)
    );


PE_BS PE_BS_R2 (
    .clk(clk), 
    .rst_n(reset_n), 
    .in(R2), 
    .w1(w21), 
    .w2(w22), 
    .w3(w23),
	 
	 .s1(s21), 
    .s2(s22), 
    .s3(s23), 
	 
    .sel(sel), 
    .y1(y11_2), 
    .y2(y12_2), 
    .y3(y13_2)
    );
	 
	 
PE_BS PE_BS_R3 (
    .clk(clk), 
    .rst_n(reset_n), 
    .in(R3), 
    .w1(w31), 
    .w2(w32), 
    .w3(w33), 
	 
	 .s1(s31), 
    .s2(s32), 
    .s3(s33),
	 
    .sel(sel), 
    .y1(y11_3), 
    .y2(y12_3), 
    .y3(y13_3)
    );
	 
//Adding end results
assign Y11 = y11_1 + y11_2 + y11_3;
assign Y12 = y12_1 + y12_2 + y12_3;
assign Y13 = y13_1 + y13_2 + y13_3;	 

endmodule
