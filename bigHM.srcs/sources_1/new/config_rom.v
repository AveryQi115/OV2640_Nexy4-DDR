`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 15:45:37
// Design Name: 
// Module Name: config_rom
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


module config_rom(
    input wire clk,
    input wire [7:0] addr,
    output reg [15:0] dout
    );
    //FFFF is end of rom, FFF0 is delay
    always @(posedge clk) begin
    case(addr) 
            0: dout <= 16'hff_01;
            1: dout <= 16'h12_80;
            //delay 5ms
            2: dout <= 16'hff_f0;
            
            3: dout <= 16'hff_00;
            4: dout <= 16'h2c_ff;
            5: dout <= 16'h2e_df;
            6: dout <= 16'hff_01;
            7: dout <= 16'h3c_32;
            //
            8: dout <= 16'h11_01;
            9: dout <= 16'h09_02;
            10: dout <= 16'h04_20;
            11: dout <= 16'h13_e5;
            12: dout <= 16'h14_48;
            13: dout <= 16'h2c_0c;
            14: dout <= 16'h33_78;
            15: dout <= 16'h3a_33;
            16: dout <= 16'h3b_fB;
            //
            17: dout <= 16'h3e_00;
            18: dout <= 16'h43_11;
            19: dout <= 16'h16_10;
            //
            20: dout <= 16'h39_92;
            //
            21: dout <= 16'h35_da;
            22: dout <= 16'h22_1a;
            23: dout <= 16'h37_c3;
            24: dout <= 16'h23_00;
            25: dout <= 16'h34_c0;
            26: dout <= 16'h36_1a;
            27: dout <= 16'h06_88;
            28: dout <= 16'h07_c0;
            29: dout <= 16'h0d_87;
            30: dout <= 16'h0e_41;
            31: dout <= 16'h4c_00;
            32: dout <= 16'h48_00;
            33: dout <= 16'h5B_00;
            34: dout <= 16'h42_03;
            //
            35: dout <= 16'h4a_81;
            36: dout <= 16'h21_99;
            //
            37: dout <= 16'h24_40;
            38: dout <= 16'h25_38;
            39: dout <= 16'h26_82;
            40: dout <= 16'h5c_00;
            41: dout <= 16'h63_00;
            42: dout <= 16'h46_00;
            43: dout <= 16'h0c_3c;
            //
            44: dout <= 16'h61_70;
            45: dout <= 16'h62_80;
            46: dout <= 16'h7c_05;
            //
            47: dout <= 16'h20_80;
            48: dout <= 16'h28_30;
            49: dout <= 16'h6c_00;
            50: dout <= 16'h6d_80;
            51: dout <= 16'h6e_00;
            52: dout <= 16'h70_02;
            53: dout <= 16'h71_94;
            54: dout <= 16'h73_c1;
            //
            55: dout <= 16'h12_40;
            56: dout <= 16'h17_11;        //HREFST 原：11    改：无
            57: dout <= 16'h18_39;        //HREFSEND 原：43 改：39
            58: dout <= 16'h19_00;        //VSTRT 原：00 改：无
            59: dout <= 16'h1a_3C;        //VEND 原：4B 改：3C
            60: dout <= 16'h32_09;        //REG32 原：09    改：无
            61: dout <= 16'h37_c0;
            62: dout <= 16'h4f_ca;
            63: dout <= 16'h50_a8;
            64: dout <= 16'h5a_23;
            65: dout <= 16'h6d_00;
            66: dout <= 16'h3d_38;
            //
            67: dout <= 16'hff_00;
            68: dout <= 16'he5_7f;
            69: dout <= 16'hf9_c0;
            70: dout <= 16'h41_24;
            71: dout <= 16'he0_14;
            72: dout <= 16'h76_ff;
            73: dout <= 16'h33_a0;
            74: dout <= 16'h42_20;
            75: dout <= 16'h43_18;
            76: dout <= 16'h4c_00;
            77: dout <= 16'h87_d5;
            78: dout <= 16'h88_3f;
            79: dout <= 16'hd7_03;
            80: dout <= 16'hd9_10;
            81: dout <= 16'hd3_82;
            //
            82: dout <= 16'hc8_08;
            83: dout <= 16'hc9_80;
            //
            84: dout <= 16'h7c_00;
            85: dout <= 16'h7d_00;
            86: dout <= 16'h7c_03;
            87: dout <= 16'h7d_48;
            88: dout <= 16'h7d_48;
            89: dout <= 16'h7c_08;
            90: dout <= 16'h7d_20;
            91: dout <= 16'h7d_10;
            92: dout <= 16'h7d_0e;
            //
            93: dout <= 16'h90_00;
            94: dout <= 16'h91_0e;
            95: dout <= 16'h91_1a;
            96: dout <= 16'h91_31;
            97: dout <= 16'h91_5a;
            98: dout <= 16'h91_69;
            99: dout <= 16'h91_75;
            100: dout <= 16'h91_7e;
            101: dout <= 16'h91_88;
            102: dout <= 16'h91_8f;
            103: dout <= 16'h91_96;
            104: dout <= 16'h91_a3;
            105: dout <= 16'h91_af;
            106: dout <= 16'h91_c4;
            107: dout <= 16'h91_d7;
            108: dout <= 16'h91_e8;
            109: dout <= 16'h91_20;
            //
            110: dout <= 16'h92_00;
            111: dout <= 16'h93_06;
            112: dout <= 16'h93_e3;
            113: dout <= 16'h93_05;
            114: dout <= 16'h93_05;
            115: dout <= 16'h93_00;
            116: dout <= 16'h93_04;
            117: dout <= 16'h93_00;
            118: dout <= 16'h93_00;
            119: dout <= 16'h93_00;
            120: dout <= 16'h93_00;
            121: dout <= 16'h93_00;
            122: dout <= 16'h93_00;
            123: dout <= 16'h93_00;
            //
            124: dout <= 16'h96_00;
            125: dout <= 16'h97_08;
            126: dout <= 16'h97_19;
            127: dout <= 16'h97_02;
            128: dout <= 16'h97_0c;
            129: dout <= 16'h97_24;
            130: dout <= 16'h97_30;
            131: dout <= 16'h97_28;
            132: dout <= 16'h97_26;
            133: dout <= 16'h97_02;
            134: dout <= 16'h97_98;
            135: dout <= 16'h97_80;
            136: dout <= 16'h97_00;
            137: dout <= 16'h97_00;
            //
            138: dout <= 16'hc3_ed;
            139: dout <= 16'ha4_00;
            140: dout <= 16'ha8_00;
            141: dout <= 16'hc5_11;
            142: dout <= 16'hc6_51;
            143: dout <= 16'hbf_80;
            144: dout <= 16'hc7_10;
            145: dout <= 16'hb6_66;
            146: dout <= 16'hb8_A5;
            147: dout <= 16'hb7_64;
            148: dout <= 16'hb9_7C;
            149: dout <= 16'hb3_af;
            150: dout <= 16'hb4_97;
            151: dout <= 16'hb5_FF;
            152: dout <= 16'hb0_C5;
            153: dout <= 16'hb1_94;
            154: dout <= 16'hb2_0f;
            155: dout <= 16'hc4_5c;
            //
            156: dout <= 16'hc0_50;        //HSIZE 原：64 改：50
            157: dout <= 16'hc1_3C;        //VSIZE 原：4B 改：3C
            158: dout <= 16'h8c_00;        //SIZEL 原：00 改：无
            159: dout <= 16'h86_3D;
            160: dout <= 16'h50_00;
            161: dout <= 16'h51_A0;        //HSIZE 原：C8 改：A0
            162: dout <= 16'h52_78;        //VSIZE 原：96 改：78
            163: dout <= 16'h53_00;        //XOFFL 原：00 改：无
            164: dout <= 16'h54_00;        //YOFFL 原：00 改：无
            165: dout <= 16'h55_00;        //VHYX 原：00 改：无
            166: dout <= 16'h5a_A0;        //ZMOW 原：C8 改：A0
            167: dout <= 16'h5b_78;        //ZMOH 原：96 改：78
            168: dout <= 16'h5c_00;        //ZMHH 原：00 改：无
            169: dout <= 16'hd3_82;
            //
            170: dout <= 16'hc3_ed;
            171: dout <= 16'h7f_00;
            //
            172: dout <= 16'hda_08;
            //
            173: dout <= 16'he5_1f;
            174: dout <= 16'he1_67;
            175: dout <= 16'he0_00;
            176: dout <= 16'hdd_7f;
            177: dout <= 16'h05_00;
        default: dout <= 16'hFFFF;         //mark end of ROM
    endcase
    
    end
endmodule
