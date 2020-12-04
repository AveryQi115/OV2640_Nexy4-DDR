`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 21:55:24
// Design Name: 
// Module Name: erode
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


module erode(
input clk,
input [10:0] hcount,
input [10:0] vcount,
input sobel_value,
output [11:0] erode_value
);
	parameter Hor_Addr_Time = 640;
	parameter Width = Hor_Addr_Time >> 1;
	parameter Ver_Addr_Time = 480;
	parameter Height = Ver_Addr_Time >> 1;
	
	reg line_buffer_0 [(Width - 1):0];
    reg line_buffer_1 [(Width - 1):0];
    reg line_buffer_2 [(Width - 1):0];
    
    wire pixel[8:0];
    
    wire [10:0] div_two_hcount, div_two_vcount;
	
	genvar line_buffer_i;
	generate	
	   for(line_buffer_i = Width - 1; ~line_buffer_i; line_buffer_i = line_buffer_i - 1)
	   begin:Line_0
	       always @ (posedge clk)
	       begin
	           if( ~vcount[0] && hcount == 0)
	           begin
	               line_buffer_0[line_buffer_i] <= line_buffer_1[line_buffer_i];
	               line_buffer_1[line_buffer_i] <= line_buffer_2[line_buffer_i];
	           end
	       end
	  end
    endgenerate 
    
   always @ (posedge clk)
   begin
	   if( ~vcount[0] && ~hcount[0])
	   begin
			line_buffer_2[div_two_hcount] <= sobel_value;
	   end
   end
	
	assign div_two_hcount = hcount >> 1;
	assign div_two_vcount = vcount >> 1;
	
	assign pixel[0] = (div_two_hcount >= 2 && div_two_vcount >= 2 && div_two_hcount <= Width + 2 && div_two_vcount <= Height + 2) ? line_buffer_0[div_two_hcount - 2] : 0;
	assign pixel[1] = (div_two_hcount >= 1 && div_two_vcount >= 2 && div_two_hcount <= Width + 1 && div_two_vcount <= Height + 2) ? line_buffer_0[div_two_hcount - 1] : 0;
	assign pixel[2] = (div_two_vcount >= 2 && div_two_hcount <= Width && div_two_vcount <= Height + 2) ? line_buffer_0[div_two_hcount] : 0;
	
	assign pixel[3] = (div_two_hcount >= 2 && div_two_vcount >= 1 && div_two_hcount <= Width + 2 && div_two_vcount <= Height + 1) ? line_buffer_1[div_two_hcount - 2] : 0;
	assign pixel[4] = (div_two_hcount >= 1 && div_two_vcount >= 1 && div_two_hcount <= Width + 1 && div_two_vcount <= Height + 1) ? line_buffer_1[div_two_hcount - 1] : 0;
	assign pixel[5] = (div_two_vcount >= 1 && div_two_hcount <= Width && div_two_vcount <= Height + 1) ? line_buffer_1[div_two_hcount] : 0;
	
	assign pixel[6] = (div_two_hcount >= 2 && div_two_hcount <= Width + 2 && div_two_vcount <= Height) ? line_buffer_2[div_two_hcount - 2] : 0;
	assign pixel[7] = (div_two_hcount >= 1 && div_two_hcount <= Width + 1 && div_two_vcount <= Height) ? line_buffer_2[div_two_hcount - 1] : 0;
	assign pixel[8] = (div_two_hcount <= Width && div_two_vcount <= Height) ? line_buffer_2[div_two_hcount] : 0;
	
	wire and_0, and_1, and_2;
	wire and_all;
	
	assign erode_value = {12{and_all}};
	
	And And_dut_0(
	.clk(clk),
	.data_0(pixel[0]),
	.data_1(pixel[1]),
	.data_2(pixel[2]),
	.result(and_0)
	);
	
	And And_dut_1(
	.clk(clk),
	.data_0(pixel[3]),
	.data_1(pixel[4]),
	.data_2(pixel[5]),
	.result(and_1)
	);
	
	And And_dut_2(
	.clk(clk),
	.data_0(pixel[6]),
	.data_1(pixel[7]),
	.data_2(pixel[8]),
	.result(and_2)
	);
	
	And And_dut_all(
	.clk(clk),
	.data_0(and_0),
	.data_1(and_1),
	.data_2(and_2),
	.result(and_all));
	
endmodule
