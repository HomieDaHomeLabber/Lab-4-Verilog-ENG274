`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

//Modified by Francisco Garcia 2026/10/09
//////////////////////////////////////////////////////////////////////////////////

module Counter8( Clock, Reset, Pause, Up, Count);
   input Clock, Reset, Pause, Up;
   output reg [7:0] Count;
   reg [7:0] CountNext;
   
//reset is highest priority
//arguments are listed in order of priority
   always @ ( Reset, Pause, Up, Count) begin
      if (Reset) begin
         CountNext = 0;
           end
      else if (Pause) begin
         CountNext = Count;
      end
      //counting up branch
      else if (Up) begin 
                   if (Count >= 'h27) begin
                      CountNext = 0;
                   end
                   else begin
                      CountNext = Count +1;
                   end
      end
      //count down branch
      else begin
         //count down branch
         if (Count == 0) begin
            CountNext = 'h27;//roll over to max limit when hit zero
         end
         else begin
            CountNext = Count -1;//Decrement Normally
            end
        end    
   end
   

//Register with Asynchronous Clear
   always @ (posedge Clock or posedge Reset) begin
      if (Reset) begin
           Count = 0; //Clear clock edge
      end      
      else begin
      Count = CountNext; //Load next state
   end
end

endmodule
