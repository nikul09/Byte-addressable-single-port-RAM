
`include "interface.sv"

module top();
import ram_pkg::*;

  bit clk;
  bit rst;
  test test1 = new;
  
 //rst block

  initial begin
    rst = 1;
    #10;
    rst = 0;
  end

  // clock block

  initial begin 
    forever #5 clk = ~clk;
  end

// stim

 ram_inf pinf(clk,rst);
 

  initial begin
    test1.vinf = pinf;
    test1.run();
  end

 

  ram dut(
    .din(pinf.din),
    .addr(pinf.addr),
    .clk(pinf.clk),
    .ready(pinf.ready),
    .valid(pinf.valid),
    .wr_rd(pinf.wr_rd),
    .rst(pinf.rst),
    .dout(pinf.dout)
  );

initial begin
  #200;
  $finish;
end
  
 
endmodule
