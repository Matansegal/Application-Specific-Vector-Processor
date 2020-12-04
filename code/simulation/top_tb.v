`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 06:06:03 AM
// Design Name: 
// Module Name: top_tb
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

// basic test - should be the same result as when I tested the datapath

module top_tb();

reg clk;
reg reset;
reg [7:0] next_in;
wire [7:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10; // for testing only!
wire [7:0] f;

top T1(
    clk,
    reset,
    next_in,
    r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, // for testing only!
    f
    );
    
    always #50 clk = ~clk;    
    initial
    begin
        clk = 0;
        reset = 1;
        #110
        reset = 0;
        
        // t1
        next_in = 8'hff;
        #100

        // t2
        next_in = 8'h8f;
        #100

        // t3
        next_in = 8'hde;
        #100

        // t4
        next_in = 8'h1a;
        #100

        // t5
        next_in = 8'h34;
        #100

        // t6
        next_in = 8'h05;
        #100

        // t7
        next_in = 8'h72;
        #100

        // t8
        next_in = 8'h32;
        #100

        // t9
        next_in = 8'h25;
        #100

        // t10
        next_in = 8'h13;
        #100

        // t11
        next_in = 8'h15;
        #100

        // t12
        next_in = 8'hd2;
        #100

        // t13
        next_in = 8'hea;
        #100

        // t14
        next_in = 8'hb2;
        #100

        // t15
        next_in = 8'h34;
        #100

        // t16
        next_in = 8'h41;
        #100

        // t17
        next_in = 8'ha1;
        #100

        // t18
        next_in = 8'h12;
        #100

        // t19
        next_in = 8'h7a;
        #100

        // t20
        next_in = 8'h49;
        #100

        // t21
        next_in = 8'h61;
        #100

        // t22
        next_in = 8'ha1;
        #100

        // t23
        next_in = 8'hb6;
        #100

        // t24
        next_in = 8'h53;
        #100

        #300 //to see last outputs


        
        
        
    $finish;
    end

endmodule
