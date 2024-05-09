module Testbench();

  reg [1:0] g1,g2;
  reg [0:0] reset;
  reg clk;
  
  wire [1:0] manche;
  wire [1:0] partita;
  
  //testbench script 
  integer tb;
  //verilog outputs 
  integer vout;

  Morracinese m(
    .clk(clk),
    .g1(g1),.g2(g2),.reset(reset),
    .manche(manche),.partita(partita)
  );
  
  //assegna valore contrario del clock 
  always #10 clk = ~clk;
  
  initial begin
  
    $dumpfile("dump.vcd");
    $dumpvars(1); 
  
    //genero file
    tb=$fopen("testbench.script", "w");
    vout=$fopen("outputs_verilog", "w");
    
    $fdisplay(tb,"read_blif FSMD.blif");
                
    /*Moveset:
       
       sasso = 01
       carta = 10
       forbice = 11 
       
       */            
    
                
    // play 1
    clk = 1'b0;
    reset = 1'b1;

    // manchemax = 4
    g1 = 2'b00;
    g2 = 2'b00;

    #20
    $display("play 1");
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // sasso vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    g1 = 2'b01;
    g2 = 2'b10;
                
    
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // forbice vs carta
    // manche non valida
    // g2 + 1
    g1 = 2'b11;
    g2 = 2'b10;
     
      
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // sasso vs forbice
    // manche g1
    // pareggio 
    g1 = 2'b11;
    g2 = 2'b10;           
                
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // forbice vs forbice
    // manche pareggio
    // pareggio 
    g1 = 2'b11;
    g2 = 2'b11;          
                
       
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // sasso vs sasso
    // manche pareggio
    // pareggio 
    g1 = 2'b01;
    g2 = 2'b01;    
                
    
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: pareggio   
                
                
                
    // play 2
    reset = 1'b1;

    // manchemax = 5
    g1 = 2'b00;
    g2 = 2'b01;

    #20
    $display("play 2");
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // forbice vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    g1 = 2'b11;
    g2 = 2'b10;          
                
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // forbice vs sasso
    // manche g2
    // g2 + 2
    g1 = 2'b11;
    g2 = 2'b01;             
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // sasso vs forbici
    // manche g2
    // g2 + 1
    g1 = 2'b01;
    g2 = 2'b11;           
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // forbici vs sasso
    // manche g2
    // g2 + 2
    g1 = 2'b11;
    g2 = 2'b01; 
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 5
    // sasso vs carta
    // manche g2
    // g2 + 2
    g1 = 2'b01;
    g2 = 2'b10;   
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: player g2 vantaggio 3 
                
     
    // play 3
    reset = 1'b1;

    // manchemax = 6
    g1 = 2'b01;
    g2 = 2'b10;

    #20
    $display("play 3");
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // forbice vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    g1 = 2'b11;
    g2 = 2'b10;  
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // carta vs forbice
    // manche g1
    // pareggio
    g1 = 2'b10;
    g2 = 2'b11;           
                
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // interruzione con reset durante una partita 
    reset = 1'b1;
    g1 = 2'b11;
    g2 = 2'b11;            
                
                
    //play 4
    
    //manchemax 19
    
    #20
    $display("play 4");
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // sasso vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    g1 = 2'b01;
    g2 = 2'b10;
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // carta vs forbice
    // manche g2
    // g2 + 2
    reset = 1'b0;
    g1 = 2'b10;
    g2 = 2'b11;
     
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // forbice vs sasso
    // manche g2
    // g2 + 3
    reset = 1'b0;
    g1 = 2'b11;
    g2 = 2'b01;
                
    #20
    $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // sasso vs carta
    // manche g2
    // g2 + 3
    reset = 1'b0;
    g1 = 2'b01;
    g2 = 2'b10; 
                
 $display("g1: %b g2: %b manche: %b partita: %b", g1, g2, manche, partita);
    $fdisplay(tb, "simulate %b %b %b %b %b", g1[1], g1[0], g2[1], g2[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: player g2 vantaggio 3 
                
    $fdisplay( tb, "quit");
    $fclose(tb);            
    $fclose(vout);            
    $finish;            
   end             

endmodule