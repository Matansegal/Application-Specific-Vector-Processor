module random_top_tb();

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
        next_in = 8'h7f;
        #100

        // t2
        next_in = 8'h04;
        #100

        // t3
        next_in = 8'hf4;
        #100

        // t4
        next_in = 8'hec;
        #100

        // t5
        next_in = 8'h44;
        #100

        // t6
        next_in = 8'h3f;
        #100

        // t7
        next_in = 8'h36;
        #100

        // t8
        next_in = 8'hb0;
        #100

        // t9
        next_in = 8'h21;
        #100

        // t10
        next_in = 8'hae;
        #100

        // t11
        next_in = 8'h8f;
        #100

        // t12
        next_in = 8'hcf;
        #100

        // t13
        next_in = 8'h62;
        #100

        // t14
        next_in = 8'h84;
        #100

        // t15
        next_in = 8'h2e;
        #100

        // t16
        next_in = 8'h76;
        #100

        // t17
        next_in = 8'hed;
        #100

        // t18
        next_in = 8'h38;
        #100

        // t19
        next_in = 8'h6c;
        #100

        // t20
        next_in = 8'h4e;
        #100

        // t21
        next_in = 8'h56;
        #100

        // t22
        next_in = 8'h2c;
        #100

        // t23
        next_in = 8'hd4;
        #100

        // t24
        next_in = 8'h35;
        #100

        // t25
        next_in = 8'h47;
        #100

        // t26
        next_in = 8'h81;
        #100

        // t27
        next_in = 8'h8d;
        #100

        // t28
        next_in = 8'h61;
        #100

        // t29
        next_in = 8'hc5;
        #100

        // t30
        next_in = 8'hc1;
        #100

        // t31
        next_in = 8'hb2;
        #100

        // t32
        next_in = 8'h55;
        #100

        // t33
        next_in = 8'h1d;
        #100

        // t34
        next_in = 8'h28;
        #100

        // t35
        next_in = 8'h3b;
        #100

        // t36
        next_in = 8'hca;
        #100

        // t37
        next_in = 8'h49;
        #100

        // t38
        next_in = 8'hd1;
        #100

        // t39
        next_in = 8'h3a;
        #100

        // t40
        next_in = 8'h7f;
        #100

        // t41
        next_in = 8'h55;
        #100

        // t42
        next_in = 8'h8c;
        #100

        // t43
        next_in = 8'h24;
        #100

        // t44
        next_in = 8'h32;
        #100

        // t45
        next_in = 8'h40;
        #100

        // t46
        next_in = 8'h8c;
        #100

        // t47
        next_in = 8'h10;
        #100

        // t48
        next_in = 8'h32;
        #100

        // t49
        next_in = 8'hb4;
        #100

        // t50
        next_in = 8'h30;
        #100

        // t51
        next_in = 8'h15;
        #100

        // t52
        next_in = 8'h47;
        #100

        // t53
        next_in = 8'hdb;
        #100

        // t54
        next_in = 8'h46;
        #100

        // t55
        next_in = 8'hc5;
        #100

        // t56
        next_in = 8'hb4;
        #100

        // t57
        next_in = 8'hdf;
        #100

        // t58
        next_in = 8'h88;
        #100

        // t59
        next_in = 8'hc0;
        #100

        // t60
        next_in = 8'hd4;
        #100

        #300 //to see last outputs

    $finish;
    end

endmodule