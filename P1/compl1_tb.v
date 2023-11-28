// Testbench para sumador con predicci n de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci n y el del paso de simulacion
module compl1_tb;

//declaracion de se ales
reg[3:0] test_Inp;
wire[3:0] test_Out;
reg test_cpl;

//instancia del modulo a testear
compl1 compl1(test_Out, test_Inp, test_cpl);

initial
begin
  $monitor("tiempo=%0d Inp=%b cpl=%b Out=%b", $time, test_Inp, test_cpl, test_Out);
  $dumpfile("compl1.vcd");
  $dumpvars;
  //Algunos valores de prueba
  test_cpl = 1'b0;
  test_Inp = 4'b0000;
  # 20;

  test_cpl = 1'b1;
  test_Inp = 4'b0000;
  # 20;

  test_cpl = 1'b0;
  test_Inp = 4'b1111;
  # 20;

  test_cpl = 1'b1;
  test_Inp = 4'b1111;
  # 20;

  $finish;
end

endmodule