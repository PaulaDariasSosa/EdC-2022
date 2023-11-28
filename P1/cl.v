module cl(output wire out, input wire a, b, input wire [1:0] S);
  wire and1,or1, xor1, not1;
  and and_1 (and1, a, b);
  or or_1 (or1, a , b);
  xor xor_1 (xor1, a, b);
  not not_1 (not1, a);
  mux4_1 mux_1 (out, and1,or1, xor1, not1, S);
endmodule