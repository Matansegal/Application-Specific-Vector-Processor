`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 03:20:57 PM
// Design Name: 
// Module Name: adder
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


module adder(
    input wire [7:0] in1,
    input wire [7:0] in2,
    input wire sub, // 0 if addition , 1 for subtraction
    output wire [7:0] out
    );
    
    reg [7:0] tmp;
    
    wire s0,s1,s2,s3,s4,s5,s6,s7;
    wire co0,co1,co2,co3,co4,co5,co6,co7;
    
    fa f0(in1[0],in2[0],1'b0,s0,co0);
    fa f1(in1[1],in2[1],co0,s1,co1);
    fa f2(in1[2],in2[2],co1,s2,co2);
    fa f3(in1[3],in2[3],co2,s3,co3);
    fa f4(in1[4],in2[4],co3,s4,co4);
    fa f5(in1[5],in2[5],co4,s5,co5);
    fa f6(in1[6],in2[6],co5,s6,co6);
    fa f7(in1[7],in2[7],co6,s7,co7); // dont care co7
    
    // addition of a 2's compliment is just regular addition
    // where we neglect the carry out.
        
    // fliped the bits (already done when pass in2) and add 1 if sub
    assign out = {s7,s6,s5,s4,s3,s2,s1,s0} + sub;

    
endmodule 


module fa( input A,
       input B,
       input CIN,
       output S,
       output COUT
       );
       
       assign S = A^B^CIN;
       assign COUT = (A&B) | (CIN&A) | (CIN&B);

endmodule
