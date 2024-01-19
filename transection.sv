class transection;

  randc bit [`data_width-1:0]din;// data 
  rand  bit [`addr_width-1:0]addr;
        bit ready;
        bit valid;
  randc bit wr_rd;
        bit rst;
        bit [`data_width-1:0]dout;
 

 constraint unique_addr{
 unique{addr};
 }
 
endclass
