`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:37 12/21/2022 
// Design Name: 
// Module Name:    PE_BS 
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


`resetall
`timescale 1ns/10ps
module PE_BS_5K(clk, rst_n, in, w1,w2,w3,w4,w5, s1,s2,s3,s4,s5, sel, y1,y2,y3,y4,y5);


// ### Please start your Verilog code here ### 
input [7:0] in;
input [2:0]w1, w2, w3, w4, w5;
input s1, s2, s3, s4, s5;
input  [2:0] sel;
input clk, rst_n;

output [15:0] y1, y2, y3, y4, y5;

// Physical Registers
reg [7:0] R1, R2, R3, R4, R5;
reg [15:0] y1, y2, y3, y4, y5;

wire [2:0] weight;
wire sign;
//Code starts here
assign weight = (sel == 0)?w1:(sel == 1)?w2:(sel == 2)?w3:(sel == 3)?w4:(sel == 4)?w5:0;
assign sign = (sel == 0)?s1:(sel == 1)?s2:(sel == 2)?s3:(sel == 3)?s4:(sel == 4)?s5:0;

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    R1 <= 0;
    R2 <= 0;
    R3 <= 0;
	 R4 <= 0;
    R5 <= 0;
  end
  else
  begin
	 R5 <= in;
	 R4 <= R5;
    R3 <= R4;
    R2 <= R3;
    R1 <= R2;
  end
end

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    y1 <= 0;
    y2 <= 0;
    y3 <= 0;
	 y4 <= 0;
    y5 <= 0;
  end
  else if(sel!= 5)
  begin
    y1 <= barrel(R1, weight, sign) + y1;
    y2 <= barrel(R2, weight, sign) + y2;
    y3 <= barrel(R3, weight, sign) + y3;
	 y4 <= barrel(R4, weight, sign) + y4;
    y5 <= barrel(R5, weight, sign) + y5;
  end
end

function [15:0] barrel;
input [7:0] in;
input [2:0] weight;
input sign;

begin
  if (~sign)
    barrel = in>>>weight; 
  else
    barrel = in<<<weight;
end
endfunction
  
endmodule
