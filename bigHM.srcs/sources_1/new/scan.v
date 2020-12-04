`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 20:21:15
// Design Name: 
// Module Name: scan
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


module scan(
input clk,
output reg[10:0] hcount = 0,
output reg[10:0] vcount = 0,
output hs,
output vs);

    parameter Hor_Sync_Time = 16;
    parameter Hor_Total_Time = 800;
    parameter Ver_Sync_Time = 10;
    parameter Ver_Total_Time = 628;
    
    assign hs = (hcount < Hor_Sync_Time) ? 0 : 1;
    always @ (posedge clk)
    begin
        if(hcount == Hor_Total_Time - 1)
        begin
            hcount <= 0;
        end
        else
        begin
            hcount <= hcount + 1;
        end
    end
    
    assign vs = (vcount < Ver_Sync_Time) ? 0 : 1;
	always @ (posedge clk)
	begin
		if(hcount == Hor_Total_Time - 1)
		begin
			if(vcount == Ver_Total_Time - 1)
			begin
				vcount <= 0;
			end
			else
			begin
				vcount <= vcount + 1;
			end
		end
	end
                
endmodule
