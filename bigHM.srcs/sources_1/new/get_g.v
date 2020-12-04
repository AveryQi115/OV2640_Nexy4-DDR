`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:50:47
// Design Name: 
// Module Name: get_g
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


module get_g(
input clk,
input [7:0] data_0,
input [7:0] data_1,
input [7:0] data_2,
output reg [10:0] result);

	always @ (posedge clk)
	begin
			result <= data_0 + (data_1 << 1) + data_2;
	end

endmodule
