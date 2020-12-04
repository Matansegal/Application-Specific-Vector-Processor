`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 05:22:56 AM
// Design Name: 
// Module Name: controller
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


module controller(
    input wire clk,
    input wire reset,
    output reg [3:0] state,
    output reg [9:0] load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read // 10 registers
    );

    parameter [3:0] s1 = 4'b0000,
                    s2 = 4'b0001,
                    s3 = 4'b0011,
                    s4 = 4'b0010,
                    s5 = 4'b0110,
                    s6 = 4'b0111,
                    s7 = 4'b1111,
                    s8 = 4'b1110,
                    s9 = 4'b1010,
                    s10 = 4'b1011,
                    s11 = 4'b1001,
                    s12 = 4'b1000;
              
    reg not_first_flag; // for first cycles, set to flase at the beginning, set to true at state 4
    
    // next state block
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            begin
                state = s1;
                not_first_flag = 1'b0;
            end
        else
        begin
            case(state)
                s1: state = s2;
                s2: state = s3;
                s3: state = s4;
                s4: state = s5;
                s5: state = s6;
                s6: state = s7;
                s7: state = s8;
                s8: state = s9;
                s9: state = s10;
                s10: state = s11;
                s11: state = s12;
                s12: state = s1;
                default: state = s1;
            endcase
        end       
    end
    
    // assigning output block
    always@(posedge clk)
    begin
        case(state)
            s1: 
                begin
                    load = 10'b0000000001;
                    if(not_first_flag)
                    begin
                        mul_en = 0; 
                        add1_en = 10'b1000001000; 
                        add2_en = 10'b0001000100; 
                        mul_read = 0; 
                        add1_read = 10'b0000000100;
                        add2_read = 0;
                    end
                end
            s2: 
                begin
                    load = 10'b0000000010;
                    if(not_first_flag)
                    begin
                        mul_en = 0; 
                        add1_en = 0; 
                        add2_en = 10'b0010001000; 
                        mul_read = 0; 
                        add1_read = 10'b0000001000;
                        add2_read = 0;
                    end
                end
            s3:
                begin
                    load = 10'b0000000100; 
                    mul_en = 0; 
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 0; 
                    add1_read = 0;
                    add2_read = 0;
                    not_first_flag = 1'b1;
                end
            s4:
                begin
                    load = 10'b0000001000;
                    mul_en = 0;
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 0;
                    add1_read = 0;
                    add2_read = 0;
                end
            s5:
                begin
                    load = 10'b0000010000;
                    mul_en = 0;
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 0;
                    add1_read = 0;
                    add2_read = 0;
                end
            s6:
                begin
                    load = 10'b0000100000;
                    mul_en = 10'b0000010001; // reg 1 and 5
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 0;
                    add1_read = 0;
                    add2_read = 0;
                end
            s7:
                begin
                    load = 10'b0001000000;
                    mul_en = 10'b0000100010; // reg 2 and 6
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 10'b0000000001; // to reg 1
                    add1_read = 0;
                    add2_read = 0;
                end
            s8:
                begin
                    load = 10'b0010000000; //load b4 to reg 8
                    mul_en = 10'b0001000100; // reg 3 and 7
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 10'b0000000010; // to reg 2
                    add1_read = 0;
                    add2_read = 0;
                end
            s9:
                begin
                    load = 10'b0100000000; //load d1 to reg 9
                    mul_en = 10'b0010001000; // reg 4 and 8
                    add1_en = 0; 
                    add2_en = 0; 
                    mul_read = 10'b0000000100; // to reg 3
                    add1_read = 0;
                    add2_read = 0;
                end
            s10:
                begin
                    load = 10'b1000000000; //load d2 to reg 10
                    mul_en = 0; 
                    add1_en = 10'b0100000001; 
                    add2_en = 0; 
                    mul_read = 10'b0000001000; // to reg 4
                    add1_read = 0;
                    add2_read = 0;
                end
            s11:
                begin
                    load = 10'b0100000000; //load d3 to reg9
                    mul_en = 0; 
                    add1_en = 10'b1000000010; 
                    add2_en = 10'b0000010001; 
                    mul_read = 0; 
                    add1_read = 10'b0000000001;
                    add2_read = 0;
                end
            s12:
                begin
                    load = 10'b1000000000; //load d4 to reg10
                    mul_en = 0; 
                    add1_en = 10'b0100000100; 
                    add2_en = 10'b0000100010; 
                    mul_read = 0; 
                    add1_read = 10'b0000000010;
                    add2_read = 0;
                end
            default: 
                not_first_flag = 1'b0;
                    
        endcase
    end
    
endmodule
