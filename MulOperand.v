`timescale 1ns / 1ps
module MultOperand(input clk, input rst, input[7:0] data_in, input Write, output[7:0] out);
   
   reg[7:0] data;
   
   always@(posedge clk)
    begin
      if(rst)
        data <= 8'd0;
      if(Write)
        data <= data_in;
    end
        
  assign out = data;
        
endmodule