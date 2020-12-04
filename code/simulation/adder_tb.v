`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 03:27:47 PM
// Design Name: 
// Module Name: adder_tb
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


// checked my answers with
// https://www.easycalculation.com/2s-complement-addition.php
// https://www.exploringbinary.com/twos-complement-converter/

module adder_tb();

reg [7:0] in1;
reg [7:0] in2;
wire [7:0] out;

adder A1 (in1,in2,1'b0,out);

initial
begin
    
    in1 = 12;
    in2 = -24;
    #10
    

    in1 = 97; 
    in2 = 15; 
    #10
    

    in1 = -45; 
    in2 = -81; 
    #10
    

    in1 = -23; 
    in2 = -121; 
    #10
    

    in1 = 82; 
    in2 = 56; 
    #10
    

    in1 = 23; 
    in2 = -78; 
    #10
    

    in1 = -48; 
    in2 = 61; 
    #10

$finish;
end

    
endmodule
