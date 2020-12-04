`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 15:48:45
// Design Name: 
// Module Name: camera_read
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


module camera_read(
    input pclk,                 //pclk����ͷʱ��
    input vsync,                //��ͬ���ź�
    input href,                 //��ͬ���ź�
    input[7:0] d,               //����ͷ��������
    output[18:0] addr,          //BRAM��ַλ
    output[11:0] dout,          //48bit���BRamд��˿�
    output we                   //����д����Ч�ź�
    );

    reg [15:0] d_latch;
    reg [18:0] address;
    reg [18:0] address_next; 
    reg [1:0] wr_hold;   
    reg [11:0] dout_reg;
    //reg [1:0] cnt;
    //integer count = 0;
    reg we_temp;
    //reg ok = 0;
    wire valid;
    
    initial d_latch = 16'b0;
    initial address = 19'b0;
    initial address_next = 19'b0;
    initial wr_hold = 2'b0;
    initial dout_reg = 12'b0;    
    //initial cnt = 2'b0;
    
           
    assign addr = address;

    always@(posedge pclk)
    begin
        //count <= count + 1;
        if(vsync == 0) begin     //����״̬
            address <= 19'b0;
            address_next <= 19'b0;
            wr_hold <= 2'b0;
            we_temp <= 0;
            //cnt <=  2'b0;
            //ok <= 0;
            //count <= 0;
        end
        else begin
            address <= address_next;
            we_temp <= wr_hold[1];
            //ok <= wr_hold[1];
            wr_hold <= {wr_hold[0] , (href &&(!wr_hold[0]))};   //��Ҫ���Ƿ���������ֽھ�����λ״̬���������ֽڴ����ֹͣ����
            d_latch <= {d_latch[7:0] , d};  //ƴ��һ��16λ��d_latch

        if (wr_hold[1] == 1 )begin
                    address_next <= address_next+1;         
                    dout_reg[11:0]  <= {d_latch[15:12] , d_latch[10:7] ,d_latch[4:1] };         
          end
       end
    end
    
    //assign valid = count>=1 && count<= 307201 && (count-1)%600>=1 && (count-1)%600<=481;
    assign  we = we_temp;
    assign  dout =  dout_reg;
    
endmodule
