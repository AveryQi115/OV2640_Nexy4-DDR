`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:53:30
// Design Name: 
// Module Name: get_length
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


module get_length(
input clk,
input signed [11:0] data_0,
input signed [11:0] data_1,
output reg [12:0] result);

	always @ (posedge clk)
	begin
		result <= (data_0 >= 0 ? data_0 : -data_0) + (data_1 >= 0 ? data_1 : -data_1);
	end

endmodule
