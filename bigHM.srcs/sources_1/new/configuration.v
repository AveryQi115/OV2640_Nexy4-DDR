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
    parameter CLK_FREQ=25000000 //��������һ������ͷ�ڲ��Ĵ�����Ъʱ�� 25M
    )
    (
    input wire clk,     //clk����һ�Σ������л�һ��״̬ �ɲ���50MHZʱ��
    input wire start,   //start�ź����߿�ʼ��������ͷ
    output wire sioc,   //sioc������ͷʱ������
    output wire siod,   //siod������ͷ��������
    output wire done,    //doneΪ1ʱ��ʾ����ͷ�������
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
        sys_clk = ~sys_clk;     //xclkƵ��Ϊ25MHZ
        end
    
    //������������ͷ����Ϣ��rom_addrΪ�Ĵ�����ַ��rom_doutΪ��ӦҪ���õ�ֵ
    config_rom rom1(
        .clk(clk),
        .addr(rom_addr),
        .dout(rom_dout)
        );
    
    //��ȡ����������ϢתΪ�ӻ���ַ+ �Ĵ�����ַ+���ݵ���ʽ������������һ��֮��������һ��
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
    
    //��SCCB������Ϣ��Э�鷽ʽ���䣬����sccbʱ���źź������ź�
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
