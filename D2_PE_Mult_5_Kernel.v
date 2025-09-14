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

module D2_PE_Mult_5_Kernel(
input  [2:0] sel,
input clk, reset_n,
input [7:0]w11,w12,w13,w14,w15,w21,w22,w23,w24,w25,w31,w32,w33,w34,w35,w41,w42,w43,w44,w45,w51,w52,w53,w54,w55,
input [7:0] R1,R2,R3,R4,R5,
output [15:0] Y11,Y12,Y13,Y14,Y15
    );
	 
wire [15:0] y11_1,y12_1,y13_1,y14_1,y15_1, 
y11_2,y12_2,y13_2,y14_2,y15_2, 
y11_3,y12_3,y13_3,y14_3,y15_3, 
y11_4,y12_4,y13_4,y14_4,y15_4, 
y11_5,y12_5,y13_5,y14_5,y15_5;


D1_PE_5K PE_R1 (
    .clk(clk), 
    .reset_n(reset_n), 
    .in(R1), 
    .w1(w11), 
    .w2(w12), 
    .w3(w13), 
	 .w4(w14), 
    .w5(w15),
	 
    .sel(sel), 
    .y1(y11_1), 
    .y2(y12_1), 
    .y3(y13_1),
	 .y4(y14_1), 
    .y5(y15_1)
    );

D1_PE_5K PE_R2 (
    .clk(clk), 
    .reset_n(reset_n), 
    .in(R2), 
    .w1(w21), 
    .w2(w22), 
    .w3(w23),
    .w4(w24), 
    .w5(w25),
	 
    .sel(sel), 
    .y1(y11_2), 
    .y2(y12_2), 
    .y3(y13_2),
    .y4(y14_2), 
    .y5(y15_2)
    );
	 
D1_PE_5K PE_R3 (
    .clk(clk), 
    .reset_n(reset_n), 
    .in(R3), 
    .w1(w31), 
    .w2(w32), 
    .w3(w33), 
	 .w4(w34), 
    .w5(w35),
	 
    .sel(sel), 
    .y1(y11_3), 
    .y2(y12_3), 
    .y3(y13_3),
	 .y4(y14_3), 
    .y5(y15_3)
    );
	 
D1_PE_5K PE_R4 (
    .clk(clk), 
    .reset_n(reset_n), 
    .in(R4), 
    .w1(w41), 
    .w2(w42), 
    .w3(w43), 
	 .w4(w44), 
    .w5(w45),
	 
    .sel(sel), 
    .y1(y11_4), 
    .y2(y12_4), 
    .y3(y13_4),
	 .y4(y14_4), 
    .y5(y15_4)
    );

D1_PE_5K PE_R5 (
    .clk(clk), 
    .reset_n(reset_n), 
    .in(R5), 
    .w1(w51), 
    .w2(w52), 
    .w3(w53), 
	 .w4(w54), 
    .w5(w55),
	 
    .sel(sel), 
    .y1(y11_5), 
    .y2(y12_5), 
    .y3(y13_5),
	 .y4(y14_5), 
    .y5(y15_5)
    );	 
	 

//Adding end results
assign Y11 = y11_1 + y11_2 + y11_3 + y11_4 + y11_5;
assign Y12 = y12_1 + y12_2 + y12_3 + y12_4 + y12_5;
assign Y13 = y13_1 + y13_2 + y13_3 + y13_4 + y13_5;
assign Y14 = y14_1 + y14_2 + y14_3 + y14_4 + y14_5;
assign Y15 = y15_1 + y15_2 + y15_3 + y15_4 + y15_5;
				

endmodule
