`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 15:39:03
// Design Name: 
// Module Name: configuration
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


module configuration
    #(
    parameter CLK_FREQ=25000000 //控制配置一个摄像头内部寄存器间歇时间 25M
    )
    (
    input wire clk,     //clk拉高一次，配置切换一次状态 可采用50MHZ时钟
    input wire start,   //start信号拉高开始配置摄像头
    output wire sioc,   //sioc接摄像头时钟总线
    output wire siod,   //siod接摄像头数据总线
    output wire done,    //done为1时表示摄像头配置完毕
    output wire xclk,
    output wire reset
    );
    
    wire [7:0] rom_addr;
    wire [15:0] rom_dout;
    wire [7:0] SCCB_addr;
    wire [7:0] SCCB_data;
    wire SCCB_start;
    wire SCCB_ready;
    wire SCCB_SIOC_oe;
    wire SCCB_SIOD_oe;
    
    assign sioc = SCCB_SIOC_oe ? 1'b0 : 1'bZ;
    assign siod = SCCB_SIOD_oe ? 1'b0 : 1'bZ;
    

    assign reset = 1;
    reg sys_clk = 0;
    assign xclk = sys_clk;
    always@(posedge clk)
        begin
        sys_clk = ~sys_clk;     //xclk频率为25MHZ
        end
    
    //储存配置摄像头的信息，rom_addr为寄存器地址，rom_dout为相应要配置的值
    config_rom rom1(
        .clk(clk),
        .addr(rom_addr),
        .dout(rom_dout)
        );
    
    //将取出的配置信息转为从机地址+ 寄存器地址+数据的形式，控制配置完一项之后配置下一项
    camera_config #(.CLK_FREQ(CLK_FREQ)) config_1(
        .clk(clk),
        .SCCB_interface_ready(SCCB_ready),
        .rom_data(rom_dout),
        .start(start),
        .rom_addr(rom_addr),
        .done(done),
        .SCCB_interface_addr(SCCB_addr),
        .SCCB_interface_data(SCCB_data),
        .SCCB_interface_start(SCCB_start)
        );
    
    //将SCCB传输信息按协议方式传输，制造sccb时钟信号和数据信号
    SCCB_interface #( .CLK_FREQ(CLK_FREQ)) SCCB1(
        .clk(clk),
        .start(SCCB_start),
        .address(SCCB_addr),
        .data(SCCB_data),
        .ready(SCCB_ready),
        .SIOC_oe(SCCB_SIOC_oe),
        .SIOD_oe(SCCB_SIOD_oe)
        );
    
endmodule
