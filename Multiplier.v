`timescale 1ns / 1ps
module Multiplier(input[7:0] a, input[7:0] b, output reg[17:0] out);
   always @(a or b)
    begin
      out = a*b ;
     end

endmodule