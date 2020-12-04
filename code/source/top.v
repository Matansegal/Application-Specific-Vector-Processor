`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 05:57:01 AM
// Design Name: 
// Module Name: top
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


module top(
    input wire clk,
    input wire reset,
    input wire [7:0] next_in,
    output wire [7:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, // for testing only!
    output wire [7:0] f
    );
    
    wire [9:0] load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read;
    wire [3:0] state;
    
    controller C1(
        clk,
        reset,
        state,
        load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read // 10 registers
    );
    
    datapath DP1(
        clk,
        reset,
        state,
        next_in,
        load, mul_en, add1_en, add2_en, mul_read, add1_read, add2_read, // 10 registers
        r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, // for testing only!
        f
    );
    
    
endmodule
