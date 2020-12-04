`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 11:21:27 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input wire clk,
    input wire reset,
    input wire [3:0] state,
    input wire [7:0] next_in,
    input wire [9:0] load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read, // 10 registers
    output wire [7:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, // for testing only!
    output reg [7:0] f
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
                    
    wire [7:0] sum1,sum2,prod; // ,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
    reg [7:0] add11,add12,add21,add22,mul1,mul2;
    reg not_first_flag; // for first cycles, set to flase at the beginning, set to true at state 4
    
    adder A1(add11,add12,1'b0,sum1); // always addition
    adder A2(add21,~add22,1'b1,sum2); // always subtraction, send inverted second input
    multiplier M1(mul1,mul2,prod);
    
    // registers(din,clk,reset,ld,output);
    // din is if load -> next_in
    //        if read mul or add -> prod or sum
    //        else high impedence
    // ld is 1 if one of the following load[0] || mul_read[0] || add1_read[0] || add2_read[0]
    // output is r_
    
    register reg1((load[0]) ? next_in : (mul_read[0]) ? prod : (add1_read[0]) ? sum1 : (add2_read[0]) ? sum2 : 8'bz,
        clk,reset,
        load[0] || mul_read[0] || add1_read[0] || add2_read[0],
        r1);

    register reg2((load[1]) ? next_in : (mul_read[1]) ? prod : (add1_read[1]) ? sum1 : (add2_read[1]) ? sum2 : 8'bz,
        clk,reset,
        load[1] || mul_read[1] || add1_read[1] || add2_read[1],
        r2);

    register reg3((load[2]) ? next_in : (mul_read[2]) ? prod : (add1_read[2]) ? sum1 : (add2_read[2]) ? sum2 : 8'bz,
        clk,reset,
        load[2] || mul_read[2] || add1_read[2] || add2_read[2],
        r3);

    register reg4((load[3]) ? next_in : (mul_read[3]) ? prod : (add1_read[3]) ? sum1 : (add2_read[3]) ? sum2 : 8'bz,
        clk,reset,
        load[3] || mul_read[3] || add1_read[3] || add2_read[3],
        r4);

    register reg5((load[4]) ? next_in : (mul_read[4]) ? prod : (add1_read[4]) ? sum1 : (add2_read[4]) ? sum2 : 8'bz,
        clk,reset,
        load[4] || mul_read[4] || add1_read[4] || add2_read[4],
        r5);

    register reg6((load[5]) ? next_in : (mul_read[5]) ? prod : (add1_read[5]) ? sum1 : (add2_read[5]) ? sum2 : 8'bz,
        clk,reset,
        load[5] || mul_read[5] || add1_read[5] || add2_read[5],
        r6);

    register reg7((load[6]) ? next_in : (mul_read[6]) ? prod : (add1_read[6]) ? sum1 : (add2_read[6]) ? sum2 : 8'bz,
        clk,reset,
        load[6] || mul_read[6] || add1_read[6] || add2_read[6],
        r7);

    register reg8((load[7]) ? next_in : (mul_read[7]) ? prod : (add1_read[7]) ? sum1 : (add2_read[7]) ? sum2 : 8'bz,
        clk,reset,
        load[7] || mul_read[7] || add1_read[7] || add2_read[7],
        r8);

    register reg9((load[8]) ? next_in : (mul_read[8]) ? prod : (add1_read[8]) ? sum1 : (add2_read[8]) ? sum2 : 8'bz,
        clk,reset,
        load[8] || mul_read[8] || add1_read[8] || add2_read[8],
        r9);
        
    register reg10((load[9]) ? next_in : (mul_read[9]) ? prod : (add1_read[9]) ? sum1 : (add2_read[9]) ? sum2 : 8'bz,
        clk,reset,
        load[9] || mul_read[9] || add1_read[9] || add2_read[9],
        r10);
        
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            // it will reset regs by setting reset to the regs
            // here I will just reset the outputs, flag
            f = 0;     
            not_first_flag = 1'b0;
        end
        else
        begin
            case(state)
                s1:
                    begin
                        // load a1 to reg1 - above
                        if(not_first_flag)
                        begin
                            add11 = r4;
                            add12 = r10;
                            add21 = sum1;
                            add22 = r7;
                            //r4 = sum1;  // e4
                            f = sum2;
                        end
                    end
                s2:
                    begin
                        // load a2 to reg2 - above
                        if(not_first_flag)
                        begin
                            add21 = sum1;
                            add22 = r8;
                            f = sum2;
                        end
                    end
                s3:
                    begin
                        // load a3 to reg3 - above
                        if(not_first_flag)
                            f = sum2;
                    end
                s4:
                    begin
                        // load a4 to reg4 - above
                        not_first_flag = 1'b1;
                    end
                s5:
                    begin
                        // load b1 to reg5 - above
                    end
                s6: // t6
                    begin
                        mul1 = r1;
                        mul2 = r5;
                    end
                s7: // t7
                    begin
                        //reg1 = prod; // c1
                        mul1 = r2;
                        mul2 = r6;
                        
                    end
                s8: //t8
                    begin
                        //reg2 = prod; // c2
                        mul1 = r3;
                        mul2 = r7;
                        
                    end
                s9: // t9
                    begin
                        //reg3 = prod; // c3
                        mul1 = r4;
                        mul2 = r8;
                    end
                s10: // t10
                    begin
                        //reg4 = prod; // c4
                        add11 = r1;
                        add12 = r9;
                    end
                s11: // t11
                    begin
                        //reg1 = sum1;  // e1
                        add11 = r2;
                        add12 = r10;
                        add21 = sum1;
                        add22 = r5;
                        //r2 = sum1;  // e2
                     
                    end
                s12: // t12
                    begin
                        add11 = r3;
                        add12 = r9;
                        add21 = sum1;
                        add22 = r6;
                        //r3 = sum1;  // e3
                        f = sum2;
                    end
               default: not_first_flag = 1'b0;
            endcase
        end
    end

    
endmodule
