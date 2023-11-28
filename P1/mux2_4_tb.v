// Testbench para sumador con predicci n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci n y el del paso de simulacion
module mux2_4_tb;

//declaracion de se ales
reg[3:0] test_A, test_B;
reg test_s;
wire[3:0] test_Out;

//instancia del modulo a testear
mux2_4 mux2_41(test_Out, test_A, test_B, test_s);

initial
begin
  $monitor("tiempo=%0d A=%b B=%b s=%b Out=%b", $time, test_A, test_B, test_s, test_Out);
  $dumpfile("mux2_4.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_s = 1'b1;
  test_A = 4'b0000;
  test_B = 4'b0101;
  # 20;
  
  test_s = 1'b0;
  test_A = 4'b1111;
  test_B = 4'b0001;
  # 20;
  
  test_s = 1'b1;
  test_A = 4'b1111;
  test_B = 4'b0111;
  # 20;
 
  test_s = 1'b1;
  test_A = 4'b0000;
  test_B = 4'b1111;
  # 20;
  
  test_s = 1'b0;
  test_A = 4'b0101;
  test_B = 4'b1010;
  # 20;

  $finish;
end

endmodule