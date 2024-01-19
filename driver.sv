
class driver;
  int no_trans;
  transection trans = new;
  virtual ram_inf vinf;  

  //write driver

  task write_drv();
    vinf.drv_cb.wr_rd <= 1;
	vinf.drv_cb.addr <= trans.addr;
	vinf.drv_cb.din <= trans.din;
    vinf.drv_cb.valid <= 1;
	wait(vinf.drv_cb.ready);
	$display("DRV <- write:[%0d], addr:[%0h],din:[%0h]",trans.wr_rd,trans.addr,trans.din);
  endtask
  
  //read driver

  task read_drv(); 
    vinf.drv_cb.valid <= 1;
	vinf.drv_cb.wr_rd <= 0;
	vinf.drv_cb.addr <= trans.addr;
	$display("DRV <- read:[%0d],addr:[%0h],dout:[%0h]",trans.wr_rd,trans.addr,vinf.drv_cb.dout);
  endtask

  // reset block

  /*task reset();
    vinf.drv_cb.addr <= 0;
	vinf.drv_cb.data <= 0;
	vinf.drv_cb.valid <= 0;
  endtask */

 // run task

  task run();
    forever begin
	  @(posedge vinf.clk);
	  my_config_db::gen2drv.get(trans); 

	  if(trans.wr_rd == 1)write_drv();
	  else read_drv();

    end
  endtask

endclass
