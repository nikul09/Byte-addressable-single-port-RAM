
class monitor;
  virtual ram_inf vinf; 
  transection trans = new;

  task write_mon();
 
    wait(vinf.mon_cb.valid==1 && vinf.mon_cb.ready==1);
    trans.wr_rd <= vinf.mon_cb.wr_rd;
    trans.addr <= vinf.mon_cb.addr;
	trans.din <= vinf.mon_cb.din;
	$display("MON <- write:[%0d],addr:[%0h],din:[%0h]",trans.wr_rd,trans.addr,trans.din);
  endtask

  task read_mon();

    wait(vinf.mon_cb.valid==1 && vinf.mon_cb.ready==1);
    trans.wr_rd <= vinf.mon_cb.wr_rd;
    trans.addr <= vinf.mon_cb.addr;
	trans.dout <= vinf.mon_cb.dout;
	$display("MON <- read:[%0d],addr:[%0h],dout:[%0h]",trans.wr_rd,trans.addr,trans.dout);
  endtask

  task run();
    forever begin
	  @(posedge vinf.clk);
	  if(vinf.mon_cb.wr_rd == 1)write_mon();
	  else read_mon();
	  my_config_db::mon2scor.put(trans);
	end 
  endtask

endclass


//check for handsaking signal 
//check seperately for writw and read
//and put into the mailbox



