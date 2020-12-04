`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 06:45:25 PM
// Design Name: 
// Module Name: multiplier1
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

// Booth algorithm
// got inspiration from:
// https://www.youtube.com/watch?v=qi4VAr5SXVg

module multiplier(
    input wire [7:0] in1,
    input wire [7:0] in2,
    output wire [7:0] out 
    );
    
    wire [7:0] A_out1, A_out2, A_out3, A_out4, A_out5, A_out6, A_out7, A_out8;
    wire [7:0] Q_out1, Q_out2, Q_out3, Q_out4, Q_out5, Q_out6, Q_out7, Q_out8;
    wire q0_1, q0_2, q0_3, q0_4, q0_5, q0_6, q0_7, q0_8; 

        
    Booth B1 (
        8'h00,in1,in2,1'b0,
        A_out1,Q_out1,q0_1
        );
    
    Booth B2 (
        A_out1,in1,Q_out1,q0_1,
        A_out2,Q_out2,q0_2
        );
        
    Booth B3 (
        A_out2,in1,Q_out2,q0_2,
        A_out3,Q_out3,q0_3
        );
    
    Booth B4 (
        A_out3,in1,Q_out3,q0_3,
        A_out4,Q_out4,q0_4
        );
        
    Booth B5 (
        A_out4,in1,Q_out4,q0_4,
        A_out5,Q_out5,q0_5
        );
    
    Booth B6 (
        A_out5,in1,Q_out5,q0_5,
        A_out6,Q_out6,q0_6
        );
    
    Booth B7 (
        A_out6,in1,Q_out6,q0_6,
        A_out7,Q_out7,q0_7
        );
        
    Booth B8 (
        A_out7,in1,Q_out7,q0_7,
        A_out8,Q_out8,q0_8
        );
     
    assign out = A_out8; // just MS 8 bits
   
endmodule



module Booth(
    input [7:0] A_in,
    input [7:0] M,
    input [7:0] Q_in,
    input  q0,
    output reg [7:0] A_out,
    output reg [7:0] Q_out,
    output reg q0_out
    );

    
    wire [7:0] sum, diff;
    
    adder A1 (A_in, M, 1'b0, sum);
    adder S1 (A_in, ~M, 1'b1, diff);

    
    always@(A_in,Q_in,M,q0,sum,diff)
    begin
        case({Q_in[0],q0})
        
            2'b00,2'b11: {A_out, Q_out, q0_out} <= {A_in[7], A_in, Q_in};
            2'b01: {A_out, Q_out, q0_out} <= {sum[7], sum, Q_in};
            2'b10: {A_out, Q_out, q0_out} <= {diff[7], diff, Q_in};

        endcase
    end
    


endmodule
