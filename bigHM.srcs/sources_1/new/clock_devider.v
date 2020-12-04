`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 16:20:01
// Design Name: 
// Module Name: clock_devider
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


module clock_devider(input clk_in, output clk_out);

    wire clk_in;
    reg clk_out;
 
    always @ (posedge clk_in)
        begin
            clk_out <= !clk_out ; 
        end
endmodule
