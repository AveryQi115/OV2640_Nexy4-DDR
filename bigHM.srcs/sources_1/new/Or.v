`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:59:07
// Design Name: 
// Module Name: Or
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


module Or(
input clk,
input data_0,
input data_1,
input data_2,
output reg result);

	always @ (posedge clk)
	begin
			result <= (data_0 | data_1 | data_2);
	end

endmodule
