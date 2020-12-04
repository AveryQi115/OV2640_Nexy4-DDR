`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 15:23:44
// Design Name: 
// Module Name: debounce
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


module debounce(input clk, input i, output o); 
        reg unsigned [23:0] c;
        reg out_temp;
        
        always @(posedge clk)begin
            if(i == 1)begin
                if(c==24'hFFFFFF)begin
                    out_temp <= 1'b1;           
                end
                else begin
                    out_temp <= 1'b0;
                end
                c <= c+1'b1;
            end
            else begin
                c <= {24{1'b0}};
                out_temp <= 1'b0; 
            end
        end
        assign o = out_temp;
endmodule
