module Testbench();
  
  reg [1:0] primo,secondo;
  reg [0:0] reset;
  reg clk;
  
  wire [1:0] manche;
  wire [1:0] partita;
  

  Morracinese m(
    .clk(clk),
    .primo(primo),.secondo(secondo),.reset(reset),
    .manche(manche),.partita(partita)
  );
  
  //testbench script 
  integer tb;
  //verilog outputs 
  integer vout;
  
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
    primo = 2'b00;
    secondo = 2'b00;

    #20
    $display("play 1");
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // sasso vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    primo = 2'b01;
    secondo = 2'b10;
                
    
    #20
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // forbice vs carta
    // manche non valida
    // g2 + 1
    primo = 2'b11;
    secondo = 2'b10;
     
      
    #20
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // sasso vs forbice
    // manche g1
    // pareggio 
    primo = 2'b01;
    secondo = 2'b11;           
                
                
    #20
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // forbice vs forbice
    // manche pareggio
    // pareggio 
    primo = 2'b11;
    secondo = 2'b11;          
                
       
    #20
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // sasso vs sasso
    // manche pareggio
    // pareggio 
    primo = 2'b01;
    secondo = 2'b01;    
                
    
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: pareggio   
                
                
                
    // play 2
    reset = 1'b1;

    // manchemax = 5
    primo = 2'b00;
    secondo = 2'b01;

    #20
    $display("play 2");
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // carta vs forbice
    // manche g2
    // g2 + 1
    reset = 1'b0;
    primo = 2'b10;
    secondo = 2'b11;          
                
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // forbice vs sasso
    // manche g2
    // g2 + 2
    primo = 2'b11;
    secondo = 2'b01;             
                
    #20
                 $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // sasso vs forbici
    // manche g2
    // g2 + 1
    primo = 2'b01;
    secondo = 2'b11;           
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // carta vs sasso
    // manche g1
    // g2 + 1
    primo = 2'b10;
    secondo = 2'b01;
    
    #20
    
                   $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 5
    // sasso vs forbici
    // manche g1
    // pareggio
    primo = 2'b01;
    secondo = 2'b11;
    
    
    #20
                   $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: player g1 vantaggio 1 e manchemax 
                
     
    // play 3
    reset = 1'b1;

    // manchemax = 6
    primo = 2'b01;
    secondo = 2'b10;

    #20
    $display("play 3");
                $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // forbice vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    primo = 2'b11;
    secondo = 2'b10;  
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // carta vs forbice
    // manche g1
    // pareggio
    primo = 2'b10;
    secondo = 2'b11;           
                
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // interruzione con reset durante una partita 
    reset = 1'b1;
    primo = 2'b11;
    secondo = 2'b11;            
                
                
    //play 4
    reset = 1'b1;

    // manchemax = 19
    primo = 2'b11;
    secondo = 2'b11;
    
    #20
    $display("play 4");
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // sasso vs carta
    // manche g2
    // g2 + 1
    reset = 1'b0;
    primo = 2'b01;
    secondo = 2'b10;
                
    #20
                 $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // carta vs forbice
    // manche g2
    // g2 + 2
    reset = 1'b0;
    primo = 2'b10;
    secondo = 2'b11;
     
    #20
                 $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // forbice vs sasso
    // manche g2
    // g2 + 3
    reset = 1'b0;
    primo = 2'b11;
    secondo = 2'b01;
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // sasso vs carta
    // manche g2
    // g2 + 3
    reset = 1'b0;
    primo = 2'b01;
    secondo = 2'b10; 
    
    
    #20
    $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: player g2 vantaggio 3 
    
    
    // play 5
    reset = 1'b1;

    // manchemax = 5
    primo = 2'b00;
    secondo = 2'b01;

    #20
    $display("play 5");
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 1
    // carta vs forbice
    // manche g2
    // g2 + 1
    reset = 1'b0;
    primo = 2'b10;
    secondo = 2'b11;          
                
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 2
    // forbice vs sasso
    // manche g2
    // g2 + 2
    primo = 2'b11;
    secondo = 2'b01;             
                
    #20
                 $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 3
    // sasso vs forbici
    // manche g2
    // g2 + 1
    primo = 2'b01;
    secondo = 2'b11;           
                
    #20
               $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    // manche 4
    // forbici vs sasso
    // manche g2
    // g2 + 2
    primo = 2'b11;
    secondo = 2'b01;   
                
    #20
                   $display("primo: %b secondo: %b manche: %b partita: %b", primo, secondo, manche, partita);
                $fdisplay(tb, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0],reset);
    $fdisplay(vout, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
    //play vinta: player g2 vantaggio 3 
    
                
    $fdisplay( tb, "quit");
    $fclose(tb);            
    $fclose(vout);            
    $finish;            
   end             

endmodule
                
                
                
    