// Testbench para sumador con predicci n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci n y el del paso de simulacion
module ul4_tb;

//declaracion de se ales
reg[3:0] test_A, test_B;
reg[1:0] test_S;
wire[3:0] test_Out;

//instancia del modulo a testear
ul4 ul41(test_Out, test_A, test_B, test_S);

initial
begin
  $monitor("tiempo=%0d A=%b B=%b S=%b Out=%b", $time, test_A, test_B, test_S, test_Out);
  $dumpfile("ul4.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_S = 2'b01;
  test_A = 4'b0110;
  test_B = 4'b0100;
  # 20;
  
  test_S = 2'b10;
  test_A = 4'b1001;
  test_B = 4'b0100;
  # 20;
  
  test_S = 2'b11;
  test_A = 4'b1111;
  test_B = 4'b0100;
  # 20;
 
  test_S = 2'b00;
  test_A = 4'b1111;
  test_B = 4'b0100;
  # 20;
  
  test_S = 2'b10;
  test_A = 4'b1111;
  test_B = 4'b1111;
  # 20;
  
  //fin simulacion
  $finish;
end

endmodule