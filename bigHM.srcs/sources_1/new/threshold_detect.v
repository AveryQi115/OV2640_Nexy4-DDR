`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:54:28
// Design Name: 
// Module Name: threshold_detect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module threshold_detect(
input clk,
input [12:0] length,
output reg [11:0] result);
	
	parameter threshold = 140;
	
	always @ (posedge clk)
	begin
		result <= (length >= threshold ? {12{1'b1}} : 0);
	end

endmodule
