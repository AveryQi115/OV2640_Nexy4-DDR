`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:42:27
// Design Name: 
// Module Name: GetAddr
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


module GetAddr(
input clk,
input [10:0] hcount,
input [10:0] vcount,
output reg [18:0] Addr = 0
);
    reg [18:0] hcount1 = 0, vcount1 = 0, vcount2 = 0;
    always @ (posedge clk)
    begin
            hcount1 <= hcount - 16;
            vcount1 <= vcount - 10;
    end
    
    always @ (posedge clk)
        begin
            vcount2 <= vcount1 * 640;
        end
    
    always @ (posedge clk)
    begin
        Addr <= hcount1 + vcount2;
    end
    
endmodule
