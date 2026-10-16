`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    23:23:54 04/21/2012 
// Author:(Roman Lysecky
//
// modified by SJKranock 2019/12/25
//    parameter DivVal = xxxxxxxxxxxxxxxxxxxxxxxx
// Modified by FGarcia51 2026/10/09
// parameter DivVal = 50_000
//////////////////////////////////////////////////////////////////////////////////

module ClkDivDisp_1( ClkIn, Reset, ClkOut );

   input ClkIn, Reset;
   output reg ClkOut;

   parameter DivVal = 50_000;   // f = 100e6 / (2*50_000) = 1 kHz
   reg [31:0] DivCnt;

   always @ ( posedge ClkIn ) begin
      if ( Reset ) begin
         ClkOut = 0;
         DivCnt = 0;
      end
      else begin
         if ( DivCnt == DivVal ) begin
            ClkOut = ~ClkOut;
            DivCnt = 0;
         end
         else begin
            DivCnt = DivCnt + 1;
         end
      end
   end
endmodule
