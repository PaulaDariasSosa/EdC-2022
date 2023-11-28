// Testbench para modulos mux4_1
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module mux4_1_tb;
//declaracion de se�ales
wire [1:0] test_S;
wire test_a, test_b, test_c, test_d;
reg test_out;

//instancia del modulo a testear, con notaci�n de posiciones de argumentos y con notaci�n de nombres
mux4_1 mat( test_out, test_a, test_b, test_c, test_d, test_s);

initial
begin
  $monitor("tiempo=%0d S=%b a=%b b=%b c=%b d=%b out=%b", $time, test_s, test_a, test_b, test_c, test_d, test_out);
  //vector de test 0
  test_s = 2'b00;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  //vector de test 1
  test_s = 2'b01;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  //vector de test 2
  test_s = 2'b10;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  //vector de test 3
  test_s = 2'b11;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  //vector de test 4
  test_s = 2'b00;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b1;
  # 20;
  //fin simulacion
  $finish;
end

endmodule
