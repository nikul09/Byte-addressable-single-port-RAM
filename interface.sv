`include "define.sv"
interface ram_inf(input logic clk,rst);

//input signals
	
logic [`data_width-1:0]din;
logic [`addr_width-1:0]addr;
logic valid;
logic wr_rd;

//output signals
logic ready;
logic [`data_width-1:0]dout;
 
clocking drv_cb @(posedge clk);
	default input #1 output #1;
	input ready;
	input dout;
	output valid;
	output wr_rd;
	output din;
	output addr;
endclocking 

//monitor clocking
clocking mon_cb@(posedge clk);

  default input #1 output #1;
  input din;
  input addr;
  input wr_rd;
  input valid;
  input ready;
  input dout;

endclocking

// modport for drive 

modport drv_mp(clocking drv_cb,input clk,rst);

//modport for monitor

modport mon_mp(clocking mon_cb,input clk,rst);

modport dut(input din,addr,valid,wr_rd,clk,rst,output ready,dout);

endinterface 
