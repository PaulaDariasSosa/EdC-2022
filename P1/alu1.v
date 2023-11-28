module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);
  reg [3:0] op1_A;
  reg [3:0] op2_B;
  reg cpl;
  reg C_in0;
  always @(ALUOp or l or A or B) 
    begin 
    op1_A = (ALUOp[1] | l)? A : 0;
    op2_B = (ALUOp[0] | ALUOp[1] | l)? B : A;
    cpl = ((~l & ~ALUOp[1]) | (~l & ALUOp[0]));
    C_in0 = ~ALUOp[1] | ALUOp[0];
    end 

  wire [3:0] OP1;
  assign OP1 = op1_A;

  wire [3:0] OP2;
  compl1 complementador(OP2, op2_B, cpl);
  
  wire [3:0] salida_sum4;
  wire [3:0] salida_ul4;
  wire posible_carry;
  
  sum4 sumador(salida_sum4, posible_carry, OP1, OP2, C_in0);
  ul4 logica(salida_ul4, OP1, OP2, ALUOp);

  reg [3:0] R_Aux;
  reg carry_Aux;
  reg sign_Aux;
  reg zero_Aux;

  always @(salida_sum4 or salida_ul4)
    begin 
      if (l == 0) 
      begin 
        assign R_Aux = salida_sum4;
        sign_Aux = R[3];
        if (R_Aux == 4'b0000)
          assign zero_Aux = 1;
        else 
          assign zero_Aux = 0;
        if (posible_carry == 1)
          assign carry_Aux = 1;
        else 
          assign carry_Aux = 0;
      end
      else 
      begin
        assign R_Aux = salida_ul4;
        assign sign_Aux = 1'bx;
        if (R_Aux == 4'b0000)
          assign zero_Aux = 1;
        else 
          assign zero_Aux = 0;
        if (posible_carry == 1)
          assign carry_Aux = 1;
        else 
          assign carry_Aux = 1'bx;
      end
    end
  assign R = R_Aux;
  assign sign = sign_Aux;
  assign carry = carry_Aux;
  assign zero = zero_Aux;

endmodule