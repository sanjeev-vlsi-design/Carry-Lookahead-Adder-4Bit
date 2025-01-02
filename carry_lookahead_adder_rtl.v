module carry_lookahead_adder_rtl(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output [3:0] carry
);
    wire [3:0] pro, gen;

    // Generate propagate and generate signals
    assign pro = a ^ b;
    assign gen = a & b;

    // Compute carry bits
    assign carry[0] = gen[0];
    assign carry[1] = gen[1] | (gen[0] & pro[1]);
    assign carry[2] = gen[2] | (gen[1] & pro[2]) | (gen[0] & pro[1] & pro[2]);
    assign carry[3] = gen[3] | (gen[2] & pro[3]) | (gen[1] & pro[2] & pro[3]) | (gen[0] & pro[1] & pro[2] & pro[3]);

    // Compute sum bits
    assign sum[0] = pro[0];
    assign sum[1] = pro[1] ^ carry[0];
    assign sum[2] = pro[2] ^ carry[1];
    assign sum[3] = pro[3] ^ carry[2];
endmodule
