# -*- coding: utf-8 -*-
"""
Created on Mon Nov 29 22:21:28 2020

@author: matan
"""
import math
import random

#fucntion to conver hex of 2'compliment to decimal
def hex_to_dec(h):
    num = int(h,16)
    binary = bin(int(h,16))[2:]
    real = ""
    if len(binary) == 8 and binary[0] == '1': # negative
        for bit in binary:
            real += '1' if bit == '0' else '0' # flip
        num = -(int(real,2)+1)
    return num

#conver decimal to hex of 2'complement 
def dec_to_hex(d):
    if d < 0:
        tmp = bin(-d)[2:]
        while len(tmp) < 8: # extend sign bit
            tmp = '0' + tmp
        d_bin = ""
        for bit in tmp:
            d_bin += '1' if bit == '0' else '0' # flip
        d = (int(d_bin,2)+1)
    return hex(d)


def calc_output(a,b,d,idx):
    a = hex_to_dec(a)
    b = hex_to_dec(b)
    d = hex_to_dec(d)
    c = a * b
    c = hex_to_dec(dec_to_hex(math.floor(c/256))) # MS 8 bits
    e = c + d 
    f = e - b # b moved 8 bits 
    
    idx = str(idx)
    print('c%s = %6s e%s = %6s f%s = %6s'%(idx,dec_to_hex(c),idx,dec_to_hex(e),idx,dec_to_hex(f)))
    #print('c%s = %6d e%s = %6d f%s = %6d'%(idx,c,idx,e,idx,f))
    
    


def generate_random_tb_file(periods = 5, to_file = False):
    if to_file:
        f = open("random_top_tb.v", "w")
        f.write('''module random_top_tb();

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
        reset = 0;\n\n''')

    h_list = [str(i) for i in range(10)]
    h_list += ['a','b','c','d','e','f']
    t_counter = 1
    
    for j in range(periods):
        A = [random.choice(h_list)+random.choice(h_list) for i in range(4)]
        B = [random.choice(h_list)+random.choice(h_list) for i in range(4)]
        D = [random.choice(h_list)+random.choice(h_list) for i in range(4)]
        
        print("----------- peiod {} -----------".format(j+1))
        for n in range(4):    
            #print('a = %3d b = %3d d = %3d'%(hex_to_dec(Ap1[i]),hex_to_dec(Bp1[i]),hex_to_dec(Dp1[i])))
            #print('a = {} b = {} d = {}'.format(Ap1[i],Bp1[i],Dp1[i]))
            calc_output(A[n],B[n],D[n],n+1)
            print('-------------------------------')
        
        print('\n')
        
        if to_file:
            for elm in A+B+D:
                f.write("        // t" + str(t_counter) + "\n")
                f.write("        next_in = 8'h" + elm + ";\n")
                f.write("        #100\n\n")
                t_counter += 1
    
    
    if to_file:
        f.write("        #300 //to see last outputs\n\n    $finish;\n    end\n\nendmodule")
          
        f.close()
        print('\ndone..')
    
if __name__ == "__main__":
    generate_random_tb_file(2, to_file = True)
