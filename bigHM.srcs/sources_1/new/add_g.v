`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:52:43
// Design Name: 
// Module Name: add_g
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


module add_g(
input clk,
input [10:0] data_0,
input [10:0] data_1,
output reg signed [11:0] result);

	always @ (posedge clk)
	begin
			result <= data_1 - data_0;
	end

endmodule
