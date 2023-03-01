`timescale 1ns / 1ps
module datapath  (input clk, input rst, input memin_read,input memin_write,
            input memout_read, input memout_write,
            input Reswrite, input Awrite, input Bwrite, input clearRes,
            input[4:0] addr, input[7:0] data_in , input[4:0]memout_addr,input[1:0]part,
	    output [7:0]Dataout
    );
    wire[17:0] add_res, res_out, memout_out, mult_res;
  
    wire [7:0] memin_out, A_out, B_out;

    
    Adder add(res_out, mult_res, add_res);
    Res result(clk, rst, clearRes, add_res, Reswrite, res_out);
    MultOperand A(clk, rst, memin_out, Awrite,A_out);
    Multiplier mult (A_out, B_out, mult_res);
    Memory8 memin(clk, rst, data_in, addr, memin_write, memin_read, memin_out);
    Memory18 memout(clk, rst, res_out, memout_addr, memout_write, memout_read, memout_out);
           
    MultOperand B(clk, rst, memin_out, Bwrite, B_out);

	 
 assign Dataout = part[0]? memout_out[15:8]:
						part[1]? {6'd0,memout_out[17:16]}:
						(~(part[0]||part[1]))? memout_out[7:0]:
						8'b0;
	 
endmodule