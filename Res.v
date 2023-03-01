`timescale 1ns / 1ps

module Res(input clk, input rst,input clearRes, input[17:0] data_in, input Reswrite, output[17:0] res_out);
  reg[17:0] data;
  
   always@(posedge clk)
    begin
      if(rst)
        data<= 18'd0;
      if(clearRes)
	data <= 18'd0;
      if(Reswrite)
        data <= data_in;
     end
    
  assign res_out = data;
      

endmodule