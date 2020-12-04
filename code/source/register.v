`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 07:21:12 PM
// Design Name: 
// Module Name: subsystem
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

// from lab 7, cahnged to 8bits from 16 bits
module register(
    input wire [7:0] din,
    input wire clk,
    input wire reset,
    input wire ld,
    output reg [7:0] data
    );
    
    
    always@(posedge clk or posedge reset)
    begin
        if(reset == 1)
            data = 0;
        else if(ld == 1)
            data = din;
    end
endmodule
