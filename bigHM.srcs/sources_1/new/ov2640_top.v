`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 18:41:18
// Design Name: 
// Module Name: ov2640_top
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


module OV2640_top(input clk100, //����ʱ��
                  output OV7670_SIOC, inout OV7670_SIOD, output OV7670_RESET,
                  output OV7670_PWDN, input OV7670_VSYNC, input OV7670_HREF, input OV7670_PCLK,
                  output OV7670_XCLK, input [7:0] OV7670_D, output [7:0] LED,   //����ͷ�ӿ�����
                          
                  output [3:0] vga_red,
                  output [3:0] vga_green, output [3:0] vga_blue, output vga_hsync, output vga_vsync,  //vga�ӿ�����
                  input btn,
                  input stop_btn
                  );
    wire resend;
    //����ͷд��
    wire [18:0] capture_addr;   //����ͷ�����ַ  
    wire [11:0] capture_data;   //����ͷ����RGB444   
    
    //��ȡBRAM����
    wire [18:0] frame_addr;
    wire [11:0] RGB444_pixel;     //������ϵ�rgb444ͼ��
    
    //����
    wire start;
    wire config_finished;     //��������ź�
    assign start = config_finished ? 0:1;
    wire capture_we;
    
    //ʱ��
    reg clk_feedback;
    reg clk50u;
    wire clk50;
    reg clk25u;
    wire clk25;

    reg buffered_pclk;
    
    assign LED = 8'b11111111 & config_finished;
    assign OV7670_PWDN = stop_btn? 1'b1:1'b0;
    

    vga vg1(.clk25(clk25),.vga_red(vga_red),.vga_green(vga_green),.vga_blue(vga_blue),.vga_hsync(vga_hsync),.vga_vsync(vga_vsync),.frame_addr(frame_addr),.frame_pixel(RGB444_pixel));

    BRAM buffer(
      .clka(OV7670_PCLK),    // input wire clka
      .wea(capture_we),      // input wire [0 : 0] wea
      .addra(capture_addr),  // input wire [18 : 0] addra
      .dina(capture_data),    // input wire [11 : 0] dina
      .clkb(clk50),    // input wire clkb
      .addrb(frame_addr),  // input wire [18 : 0] addrb
      .doutb(RGB444_pixel)  // output wire [11 : 0] doutb
    );
    
    debounce db1(.clk(clk50),.i(btn),.o(resend));
    camera_read cap1(.pclk(OV7670_PCLK),.vsync(OV7670_VSYNC),.href(OV7670_HREF),.d(OV7670_D),.addr(capture_addr),.dout(capture_data),.we(capture_we));
    configuration con1(.clk(clk50),.start(start),.sioc(OV7670_SIOC),.siod(OV7670_SIOD),.done(config_finished),.reset(OV7670_RESET),.xclk(OV7670_XCLK));    
    clock_devider clk1(.clk_in(clk100),.clk_out(clk50));
    clock_devider clk2(.clk_in(clk50),.clk_out(clk25));
  
endmodule
