module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);
  reg [3:0] op1_A;
  reg [3:0] op2_B_temporal;
  reg cpl;
  reg C_in0;
  always @(A or B or ALUOp or l) 
    begin
      if (l == 0) begin
        case(ALUOp)
          2'b00 :
          begin
            op1_A = 3'b000; 
            op2_B_temporal = A;
            cpl = 1;
            C_in0 = 1;
          end
          2'b01 : 
          begin
            op1_A = 3'b000; 
            op2_B_temporal = B; 
            cpl = 1;
            C_in0 = 1;
          end
          2'b10 : 
          begin
            op1_A = A; 
            op2_B_temporal = B; 
            cpl = 0;
            C_in0 = 0;
          end
          2'b11 : 
          begin
            op1_A = A; 
            op2_B_temporal = B; 
            cpl = 1;
            C_in0 = 1;
          end
        endcase
      end 
      else begin
        case(ALUOp)
          2'b00 :
          begin
            op1_A = A; 
            op2_B_temporal = B;
            cpl = 0;
            C_in0 = 1'bx;
          end
          2'b01 : 
          begin
            op1_A = A; 
            op2_B_temporal = B; 
            cpl = 0;
            C_in0 = 1'bx;
          end
          2'b10 : 
          begin
            op1_A = A; 
            op2_B_temporal = B; 
            cpl = 0;
            C_in0 = 1'bx;
          end
          2'b11 : 
          begin
            op1_A = A; 
            op2_B_temporal = 3'bxxx; 
            cpl = 1'bx;
            C_in0 = 1'bx;
          end
        endcase
      end
  end 

  wire [3:0] op2_B;
  wire [3:0] salida_sum4;
  wire [3:0] salida_ul4;
  wire posible_carry;
  compl1 complementador(op2_B, op2_B_temporal, cpl);
  sum4 sumador(salida_sum4, posible_carry, op1_A, op2_B, C_in0);
  ul4 logica(salida_ul4, op1_A, op2_B, ALUOp);

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
          assign carry_Aux = 1'bx;
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
