module Morracinese(
  input [0:0] clk,
  input [1:0] primo,
  input [1:0] secondo,
  input [0:0] reset, 
  output reg [1:0] manche,
  output reg [1:0] partita
);
  
  //FSM 
  reg [2:0] status = 3'b000;
  reg [2:0] nextstatus = 3'b000;
  
  //DATAPATH
  reg [4:0] mancheobb = 5'b00100;
  reg [4:0] manchecount = 5'b00000;
  reg [0:0] manchemin = 1'b0; 
  reg [0:0] manchemax = 1'b0;
  reg [1:0] precg1 = 2'b00;
  reg [1:0] precg2 = 2'b00;

  
  always @(posedge clk) begin: Updatefsm   
    if(reset == 1) begin 
      status = 3'b000;
      partita = 2'b00;
    end else begin
      status = nextstatus;
      partita = partita;
    end
  end
  
  //FSM 
 
  always @(manche, status, manchemax,manchemin,reset,partita) begin: FSM 
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
    
    if (manche == 2'b00) begin 
      nextstatus = status;
    end 
    else begin 
      if (status == 3'b001 && ( manchemin == 1'b1 && manchemax == 1'b1))begin
        partita = 2'b11;
      end else if (status == 3'b010 && (manchemin == 1'b1 && manchemax == 1'b1))begin
        partita = 2'b01;
      end else if (status == 3'b011 && (manchemin == 1'b1)) begin 
        partita = 2'b01; 
      end else if (status == 3'b100 && (manchemin == 1'b1)) begin 
        partita = 2'b01;
      end else if (status == 3'b101 && (manchemin == 1'b1 && manchemax == 1'b1))begin
        partita = 2'b10;
      end else if (status == 3'b110 && (manchemin == 1'b1)) begin 
        partita = 2'b10; 
      end else if (status == 3'b111 && (manchemin == 1'b1)) begin 
        partita = 2'b10;
      end
      
   case(status)
      3'b000: begin
        
        if(manche == 2'b01) begin
            nextstatus = 3'b010;
        end else if (manche == 2'b10) begin
            nextstatus = 3'b101;
        end else if (manche == 2'b11) begin
            nextstatus = 3'b001;
        end
      end 
        
        3'b001: begin
        
        if(manche == 2'b01) begin
            nextstatus = 3'b010;
        end else if(manche == 2'b10) begin
            nextstatus = 3'b101;
        end else if(manche == 2'b11) begin
            nextstatus = 3'b001;
        end
       end 
       
        3'b010: begin
        
        if(manche == 2'b01) begin
            nextstatus = 3'b011;
        end else if(manche == 2'b10) begin
            nextstatus = 3'b001;
        end else if(manche == 2'b11) begin
            nextstatus = 3'b010;
        end
       end
         
        3'b011: begin
       
          if(manche == 2'b01) begin
            nextstatus = 3'b100;
          end else if(manche == 2'b10) begin
            nextstatus = 3'b010;
          end else if(manche == 2'b11) begin
            nextstatus = 3'b011;
          end
        end  
        
        3'b100: begin
   
         if(manche == 2'b01) begin
            nextstatus = 3'b100;
         end else if(manche == 2'b10) begin
            nextstatus = 3'b011;
         end else if(manche == 2'b11) begin
            nextstatus = 3'b100;
          end
        end
          
        3'b101: begin
          
         if(manche == 2'b01) begin
            nextstatus = 3'b001;
         end else if(manche == 2'b10) begin
            nextstatus = 3'b110;
         end else if(manche == 2'b11) begin
            nextstatus = 3'b101;
         end
        end
         
        3'b110 : begin 
          
           if(manche == 2'b01) begin
            nextstatus = 3'b101;
         end else if(manche == 2'b10) begin
            nextstatus = 3'b111;
         end else if(manche == 2'b11) begin
            nextstatus = 3'b110;
         end
        end
        
        3'b111 : begin
          
          if(manche == 2'b01) begin
            nextstatus = 3'b110;
         end else if(manche == 2'b10) begin
            nextstatus = 3'b111;
         end else if(manche == 2'b11) begin
            nextstatus = 3'b111;
         end
        end
      endcase
    end
  end  
  
  always @(manchecount) begin
    if (manchecount == mancheobb) begin
             manchemax = 1'b1;
    end 
    if (manchecount == 5'b00100) begin
      manchemin = 1'b1;
    end 
  end
       
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
           mancheobb = 5'b00100 + {primo,secondo};
         end 
         else begin 
           
           
           
           if(primo == precg1 || secondo == precg2 || primo == 2'b00 || secondo == 2'b00) begin
             manche = 2'b00;
           end
           else begin
           	 manchecount++;
             if( primo == 2'b01 && secondo == 2'b11 )begin
               manche = 2'b01;
               precg1 = 2'b01;
               precg2 = 2'b00;
             end else if ( primo == 2'b11 && secondo == 2'b01 ) begin
               manche = 2'b10;
               precg2 = 2'b01;
               precg1 = 2'b00;
             end else if ( primo == 2'b11 && secondo == 2'b10 ) begin
               precg2 = 2'b00;
               manche = 2'b01;
               precg1 = 2'b11;
             end else if ( primo == 2'b10 && secondo == 2'b11 ) begin
               precg1 = 2'b00;
               manche = 2'b10;
               precg2 = 2'b11;
             end else if ( primo == 2'b10 && secondo == 2'b01 ) begin
               precg2 = 2'b00;
               manche = 2'b01;
               precg1 = 2'b10;
             end else if ( primo == 2'b01 && secondo == 2'b10 ) begin
               precg1 = 2'b00;
               manche = 2'b10;
               precg2 = 2'b10;
             end else if( primo == secondo ) begin
               manche = 2'b11;
               precg1 = 2'b00;
               precg2 = 2'b00;
             end
           end
         end
        end
  endmodule  
           
//comportamento dei moduli 
          
/*FSM:
la nostra FSM da in output solo e soltanto lo stato dello vittoria e tiene conto del vantaggio
*/
      
      
/*DATAPATH:
mentre nel datapath da in uscita le manche e controlla le mosse bloccanti e se la manche e valida e imposta le manche massime 
*/