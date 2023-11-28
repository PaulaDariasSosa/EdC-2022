module sum4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);
  wire C1, C2, C3;
  fa fa_1(S[0], C1, A[0], B[0], c_in);
  fa fa_2(S[1], C2, A[1], B[1], C1);
  fa fa_3(S[2], C3, A[2], B[2], C2);
  fa fa_4(S[3], c_out, A[3], B[3], C3);
endmodule