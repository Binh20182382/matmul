`timescale 1ns / 1ps

module Adder(input[17:0] a, input[17:0] b, output reg[17:0] out);
   always @(a or b)
    begin
      out = a + b;
     end

endmodule