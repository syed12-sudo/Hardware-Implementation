`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:39 12/21/2022 
// Design Name: 
// Module Name:    D_PE 
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
module D1_PE(clk, reset_n, in, w1, w2, w3, sel, y1, y2, y3);


// ### Please start your Verilog code here ### 
input [7:0] in;
input [7:0] w1, w2, w3;
input  [1:0] sel;
input clk, reset_n;

output [15:0] y1, y2, y3;


// Physical Registers
reg [7:0] R1, R2, R3;
reg [15:0] y1, y2, y3;
reg reg1, rst_n;
reg [1:0]count1 = 0;
reg [1:0]count2 = 0;
reg [1:0]count3 = 0;
wire [7:0] weight;

//Code starts here

assign weight = (sel == 0)?w1:(sel == 1)?w2:(sel == 2)?w3:0;


always@(posedge clk or negedge reset_n)
begin
  if (!reset_n)
  begin
    reg1 <= 0;
    rst_n <= 0;
  end
  else
  begin
    reg1 <= 1;
    rst_n <= reg1;
  end
end

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    R3 <= 0;
    R2 <= 0;
    R1 <= 0;
  end
  else
  begin
    R3 <= in;
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
	 
  end
  else if(sel!= 3)
  begin
		 y1 <= weight*R1 + y1;
		 y2 <= weight*R2 + y2;
		 y3 <= weight*R3 + y3;
  end

end

endmodule


