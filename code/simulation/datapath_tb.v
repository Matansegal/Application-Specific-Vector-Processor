`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 10:34:11 AM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb();

reg clk;
reg reset;
reg [3:0] state;
reg [7:0] next_in;
reg [9:0] load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read; // 10 registers
wire [7:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10; // for testing only
wire [7:0] f;

datapath D1(
    clk,
    reset,
    state,
    next_in,
    load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read, 
    r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,
    f
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
    
    always #50 clk = ~clk;    
    initial
    begin
        clk = 0;
        reset = 1;
        #10
        
        // state 1
        reset = 0;
        state = s1;
        next_in = 8'hFF;
        load = 10'b0000000001;
        mul_en = 0;
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 2
        state = s2;
        next_in = 8'hFF;
        load = 10'b0000000010;
        mul_en = 0;
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 3
        state = s3;
        next_in = 8'hff;
        load = 10'b0000000100;
        mul_en = 0;
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 4
        state = s4;
        next_in = 8'hff;
        load = 10'b0000001000;
        mul_en = 0;
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 5
        state = s5;
        next_in = 8'h02;
        load = 10'b0000010000;
        mul_en = 0;
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 6
        state = s6;
        next_in = 8'h02;
        load = 10'b0000100000;
        mul_en = 10'b0000010001; // reg 1 and 5
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0;
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 7
        state = s7;
        next_in = 8'h02;
        load = 10'b0001000000;
        mul_en = 10'b0000100010; // reg 2 and 6
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 10'b0000000001; // to reg 1
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 8
        state = s8;
        next_in = 8'h02;
        load = 10'b0010000000; //load b4 to reg 8
        mul_en = 10'b0001000100; // reg 3 and 7
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 10'b0000000010; // to reg 2
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 9
        state = s9;
        next_in = 8'h03;
        load = 10'b0100000000; //load d1 to reg 9
        mul_en = 10'b0010001000; // reg 4 and 8
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 10'b0000000100; // to reg 3
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 10
        state = s10;
        next_in = 8'h03;
        load = 10'b1000000000; //load d2 to reg 10
        mul_en = 0; 
        add1_en = 10'b0100000001; 
        add2_en = 0; 
        mul_read = 10'b0000001000; // to reg 4
        add1_read = 0;
        add2_read = 0;
        #100
        
        //state 11
        state = s11;
        next_in = 8'h03;
        load = 10'b0100000000; //load d3 to reg9
        mul_en = 0; 
        add1_en = 10'b1000000010; 
        add2_en = 10'b0000010001; 
        mul_read = 0; 
        add1_read = 10'b0000000001;
        add2_read = 0;
        #100
        
        //state 12
        state = s12;
        next_in = 8'h03;
        load = 10'b1000000000; //load d4 to reg10
        mul_en = 0; 
        add1_en = 10'b0100000100; 
        add2_en = 10'b0000100010; 
        mul_read = 0; 
        add1_read = 10'b0000000010;
        add2_read = 0;
        #100
        
        //cycle 13
        state = s1;
        next_in = 8'h03;
        load = 10'b0000000001; 
        mul_en = 0; 
        add1_en = 10'b1000001000; 
        add2_en = 10'b0001000100; 
        mul_read = 0; 
        add1_read = 10'b0000000100;
        add2_read = 0;
        #100
        
        //cycle 14
        state = s2;
        next_in = 8'h03;
        load = 10'b0000000010; 
        mul_en = 0; 
        add1_en = 0; 
        add2_en = 10'b0010001000; 
        mul_read = 0; 
        add1_read = 10'b0000001000;
        add2_read = 0;
        #100
        
        //cycle 15
        state = s3;
        next_in = 8'h03;
        load = 10'b0000000100; 
        mul_en = 0; 
        add1_en = 0; 
        add2_en = 0; 
        mul_read = 0; 
        add1_read = 0;
        add2_read = 0;
        #200
        
    $finish;
    end


endmodule
