`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/12 10:22:46
// Design Name: 
// Module Name: style_controller
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


module style_ontroller(
input clk,
input [3:0] Edge,
input [11:0] data,      //RGB444类型
output [18:0] ReadAddr, //下一个要读的地址
output [11:0] pixel,    //处理后写入的像素
output [11:0] WriteAddr //处理后写入的地址
);  

   wire done_me,done_so,done_ero,done_di;
   wire done;
   assign WriteAddr = done? ReadAddr:WriteAddr;
	
	//灰度生成
       wire [7:0] R0, G0, B0;
       	wire [7:0] Y;
       assign R0 = {data[11:8], data[11:8]};
       assign G0 = {data[7:4], data[7:4]};
       assign B0 = {data[3:0],data[3:0]};
       wire [15:0] R1,G1,B1,Y0;
       assign R1 = R0 * 77;
       assign G1 = G0 * 150;
       assign B1 = B0 * 29;
       assign Y0 = R1+G1+B1;
       assign Y = {Y0[15:8]};	
	
	wire [7:0] median_filter_pixel_value;
	
	//计算对应灰度的做完中值滤波后的pixel_value
	median_filter median_filter_dut(
	.clk(clk),
	.ReadAddr(ReadAddr),
	.done(done_me),
	.Y(Y),
	.pixel_value(median_filter_pixel_value)
	);
	
	wire [11:0] sobel_value;
	
	sobel_detect sobel_detect_dut(
	.clk(div_clk),
	.hcount(RealHcount3),
	.vcount(RealVcount3),
	.median_value(median_filter_pixel_value),
	.sobel_value(sobel_value));
    
	wire [11:0] erode_value;
	
	erode erode_dut(
	.clk(div_clk),
	.hcount(RealHcount4),
	.vcount(RealVcount4),
	.sobel_value(sobel_value[0]),
	.erode_value(erode_value));
	
	wire [11:0] dilate_value;
	
	dilate dilate_dut(
	.clk(div_clk),
	.hcount(RealHcount5),
	.vcount(RealVcount5),
	.erode_value(erode_value[0]),
	.dilate_value(dilate_value));
    
	//输出对应模式下的当前像素
	//assign pixel =  enable ? (pic ? {douta[15:12], douta[10:7], douta[4:1]} : 12'b000000000000) : 12'b000100010001;
	assign pixel =  enable ? 
	                    (Edge == 4'b0001 ? 
	                           {3{Y[7:4]}}
	                             :(Edge == 4'b0010 ?
	                                    {3{median_filter_pixel_value[7:4]}}
	                                    :(Edge == 4'b0011 ?
	                                        sobel_value
	                                        :(Edge == 4'b0100 ?
												erode_value
												:(Edge == 4'b0101 ?
													dilate_value
													:12'b000100010001)))))
	                    :12'b000100010001;
	
endmodule
