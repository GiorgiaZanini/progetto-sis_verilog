// Code your design here

module Morracinese(
  input [0:0] clk,
  input [1:0] g1,
  input [1:0] g2,
  input [1:0] reset, 
  output reg [1:0] manche,
  output [1:0] partita,
);
  
  //FSM 
  reg [2:0] status = 3'b000;
  reg [2:0] nextstatus = 3'b000;
  
  //DATAPATH
  reg [4:0] mancheobb = 5'b00100;
  reg [4:0] manchecount = 5'b00000;
  reg [0:0] manchemin = 1'b0; 
  reg [0:0] manchemax = 1'b0;
  reg [0:0] precg1 = 2'b00;
  reg [0:0] precg2 = 2'b00;

  
  always @(posedge clk) begin: Updatefsm
    
    if(reset) stato = 3'b000;
    else stato = nextstate;
  
  end
  
  //FSM 
  always @(manche,reset) begin: FSM 
    /*
    reset = 000
    pareggio = 001
    g1_van1 = 010 
    g1_van2 = 011
    g1_van3 = 100
    g2_van1 = 101 
    g2_van2 = 110
    g2_van3 = 111
    */
 
   case(manche)
      2'b00: begin
        if (status == 3'b000) begin
          nextstatus = 3'b000;
          play = 2'b00;
        end 
        if (status == 3'b001) begin
        nextstatus = 3'b001;
        play = 2'b00;
        end
      if (status == 3'b010) begin 
        nextstatus = 3'b010;
       play = 2'b00;
        end 
      if (status == 3'b011) begin
          nextstatus = 3'b011;
       play = 2'b00;
        end
      if (status == 3'b100) begin
          nextstatus = 3'b100;
       play = 2'b00;
      end 
      if (status == 3'b101) begin
        nextstatus = 3'b101;
       play = 2'b00; 
       end
      if (status == 3'b110) begin 
        nextstatus = 3'b110;
       play = 2'b00; 
      end 
      if (status == 3'b111) begin
          nextstatus = 3'b111;
       play = 2'b00; 
      end
      endcase
      2'b11: begin
         if (status == 3'b000) begin
          nextstatus = 3'b001;
          play = 2'b00;
        end 
        
        if (status == 3'b001) begin
        nextstatus = 3'b001;
          //se manchemin e max a 1 allora pareggio 
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b11;
          end
          else begin
            play = 2'b00;
          end
        end
        
        if (status == 3'b010) begin 
        nextstatus = 3'b010;
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end
        end 
        
        if (status == 3'b011) begin
          nextstatus = 3'b011;
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end
        end
        
        if (status == 3'b100) begin
          nextstatus = 3'b100;
          if(manchecount == 4)begin
            play = 2'b01;
          end
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b01;
          end 
          else begin
            play = 2'b00;
          end
        end 
        
        if (status == 3'b101) begin
        nextstatus = 3'b101;
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b10;
          end
          else begin
            play = 2'b00;
          end
        end
        
        if (status == 3'b110) begin 
        nextstatus = 3'b110;
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b10;
          end
          else begin
            play = 2'b00;
          end
        end 
        
        if (status == 3'b111) begin
          nextstatus = 3'b111;
          if(manchemin == 1 && manchemax == 1)begin
            play = 2'b10;
          end
          else begin
            play = 2'b00;
          end
        end
        endcase
      //manche G1
      2'b01: begin
          if (status == 3'b000) begin
          nextstatus = 3'b010;
            play = 2'b00;
          end 
        
        if (status == 3'b001) begin
        nextstatus = 3'b010;
          if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end 
        end
        
        if (status == 3'b010) begin 
        nextstatus = 3'b011;
          if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end 
        end 
        
        if (status == 3'b011) begin
          nextstatus = 3'b100;
         if(manchemin == 1 && manchemax == 1)begin 
             play = 2'b01;
           end
           else begin
          play = 2'b00;
           end 
        end
        
        if (status == 3'b100) begin
          nextstatus = 3'b100;
         if(manchecount == 5'b00100)begin
            play = 2'b01;
          end
         if(manchemin == 1 && manchemax == 1)begin 
             play = 2'b01;
           end
           else begin
             play = 2'b00;
           end 
        end
        
        if (status == 3'b101) begin
        nextstatus = 3'b001;
        if(manchemin == 1 && manchemax == 1)begin 
             play = 2'b11;
           end
           else begin
             play = 2'b00;
           end 
        end
        
        if (status == 3'b110) begin 
        nextstatus = 3'b101;
        if(manchemin == 1 && manchemax == 1)begin 
             play = 2'b10;
           end
           else begin
             play = 2'b00;
           end 
        end
        
        if (status == 3'b111) begin
          nextstatus = 3'b110;
          if(manchemin == 1 && manchemax == 1)begin 
             play = 2'b10;
           end
           else begin
             play = 2'b00;
           end 
        end
     endcase
     //manche g2
        2'b10: begin   
        if (status == 3'b000) begin
          nextstatus = 3'b101;
          play = 2'b00;
        end 
        
          
        if (status == 3'b001) begin
        nextstatus = 3'b101;
           if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b10;
           end
          else begin
            play = 2'b00;
          end 
        end
        if (status == 3'b010) begin 
        nextstatus = 3'b001;
          if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b11;
          end
          else begin
            play = 2'b00;
          end 
        end 
       
        if (status == 3'b011) begin
          nextstatus = 3'b010;
         if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end 
        end
        
       if (status == 3'b100) begin
          nextstatus = 3'b011;
         if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b01;
          end
          else begin
            play = 2'b00;
          end 
       end 
        if (status == 3'b101) begin
        nextstatus = 3'b110;
          if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b11;
          end
          else begin
            play = 2'b00;
          end 
        end
        
       if (status == 3'b110) begin 
        nextstatus = 3'b111;
          end 
         if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b10;
          end
          else begin
            play = 2'b00;
          end 
       end 
       
       if (status == 3'b111) begin
          nextstatus = 3'b111;
         if(manchecount == 5'b00100)begin
            play = 2'b10;
          end
         if(manchemin == 1 && manchemax == 1)begin 
            play = 2'b10;
          end
          else begin
            play = 2'b00;
          end 
       end
      endcase
       
       /*Moveset:
       
       sasso = 01
       carta = 10
       forbice = 11 
       
       */
        always @(posedge clk) begin: Datapath
         if (reset) begin
           manche = 2'b00;
           manchemin = 1'b0;
           manchemax = 1'b0;
           manchecount = 5'b00000;
           precg1 = 2'b00;
           precg2 = 2'b00;
           mancheobb = 5'b00100 + {g1,g2};
         end 
         else begin 
           if(manche != 2'b00) begin 
             manchecount++;
           end
           if (manchecount == mancheobb) begin
             manchemax = 1'b1;
             manchemin = 1'b1;
           end 
           
           
           
           if( g1 == 2'b01 && g2 == 2'b11 )begin
             if ( precg1 != 01 && precg2 !=11 ) begin
               manche = 2'b00;
             end
             manche = 2'b01;
             precg1 = 2'b01;
           end else if ( g1 == 2'b11 && g2 == 2'b01 ) begin
             if ( precg1 != 11 && precg2 !=01 ) begin
               manche = 2'b00;
             end
             manche = 2'b10;
           	 precg2 = 2'b01;
           end else if ( g1 == 2'b11 && g2 == 2'b10 ) begin
             if ( precg1 != 11 && precg2 !=10 ) begin
               manche = 2'b00;
             end
             manche = 2'b01;
           	 precg1 = 2'b11;
           end else if ( g1 == 2'b10 && g2 == 2'b11 ) begin
             if ( precg1 != 10 && precg2 !=11 ) begin
               manche = 2'b00;
             end
             manche = 2'b10;
           	 precg2 = 2'b11;
           end else if ( g1 == 2'b10 && g2 == 2'b01 ) begin
             if ( precg1 !=10 && precg2 !=01 ) begin
               manche = 2'b00;
             end
             manche = 2'b01;
           	 precg1 = 2'b10;
           end else if ( g1 == 2'b01 && g2 == 2'b10 ) begin
             if ( precg1 != 01 && precg2 != 10 ) begin
               manche = 2'b00;
             end
             manche = 2'b10;
           	 precg2 = 2'b10;
           end
         end
           
//comportamento dei moduli 
          
/*FSM:
la nostra FSM da in output solo e soltanto lo stato dello vittoria e tiene conto del vantaggio
*/
      
      
/*DATAPATH:
mentre nel datapath da in uscita le manche e controlla le mosse bloccanti e se la manche e valida e imposta le manche massime 
*/    
    
    
    
    
    
    