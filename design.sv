`include "define.sv"

module ram(
  input      [`data_width-1:0]din,
  input      [`addr_width-1:0]addr,
  input                       clk,
  input                       valid,
  input                       wr_rd,
  input                       rst,
  output reg [`data_width-1:0]dout,
  output reg                  ready
);

  integer i;

  //reg [7:0]mem[127:0]; 1kb memory with byte addresssble 
  reg [`data_width-1:0]mem[`mem_depth-1:0];

  always@(posedge clk)begin
    
    if(rst)begin
      for(i=0;i<=32;i++)begin
	    mem[i] = 0;
          dout = 0;
		 ready = 0;  
      end
    end
    
    else begin
	// check for the else part 
      if(valid==1)begin
	    ready = 1;
        if(wr_rd)begin
          mem[addr] = din;
        end

        else dout = mem[addr];
	  end

	  else begin 
	    ready = 0;
	  end
    end
  end
endmodule

//mentor 
// 1. make 1kb with byte addressable
// 2. what value of ready when rst triggered
// 3. if(valid == 1) what about else part
