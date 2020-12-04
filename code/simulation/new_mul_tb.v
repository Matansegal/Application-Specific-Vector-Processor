`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 07:15:05 PM
// Design Name: 
// Module Name: new_mul_tb
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


module new_mul_tb();

reg [7:0] in1;
reg [7:0] in2;
wire [15:0] out_new; 


multiplier1 M2 (in1,in2,out_new);

    initial
    begin
        in1 = 12;
        in2 = -1;
        #100

        
        in1 = -10;
        in2 = 17;
        #100

        
        in1 = 20;
        in2 = 13;
        #100
        
        in1 = 12;
        in2 = -1;
        #100

        
        in1 = -12;
        in2 = 17;
        #100

        
        in1 = -22;
        in2 = 13;
        #100
        
        in1 = 112;
        in2 = -21;
        #100

        
        in1 = -110;
        in2 = 117;
        #100

        
        in1 = 14;
        in2 = -113;
        #100
        
        
    $finish;
    end

endmodule
