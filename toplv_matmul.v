`timescale 1ns / 1ps

module toplv_matmul(input st,rst,clk /* input[4:0] addr */, input[7:0] data_in   , output  done ,output [7:0]dataout);
    
    wire Reswrite,Awrite,Bwrite,memin_read,memin_write,memout_read,memout_write;
    wire clearRes;
    wire[4:0]addr;
    wire[4:0]addr18;
    wire[1:0] part;
    
   datapath  dp(clk,rst,memin_read,memin_write,memout_read,memout_write,Reswrite,Awrite,Bwrite,clearRes,addr,data_in,addr18, part,dataout);
   controller control(st,rst,clk,memin_read,memin_write,Awrite,Bwrite,Reswrite,memout_read,memout_write,clearRes,done,addr,addr18 , part);


endmodule