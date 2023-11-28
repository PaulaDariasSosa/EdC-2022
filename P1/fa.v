module fa(output wire c_out, sum, input wire a, b, c_in);

  assign {sum, c_out} = a + b + c_in;
 
endmodule