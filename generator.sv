
class generator;
 
  
  int cnt;
  int que[$];
  transection trans;
  
  //generate write trnasection

  task write_gen();
    repeat(my_config_db::repeat_cnt)begin
      trans = new;
	  assert(trans.randomize() with {wr_rd == 1;});//addr & 1'b1 == 0
	  que.push_back(trans.addr);
	  my_config_db::gen2drv.put(trans);
	  my_config_db::gen2scor.put(trans);
	 
	  $display("GEN -> write:[%0d], addr:[%0h], din:[%0h]",trans.wr_rd,trans.addr,trans.din);
    end
  endtask

  //generate read transection

  task read_gen();
    repeat(my_config_db::repeat_cnt) begin
      trans = new;
	  assert(trans.randomize() with {addr == que.pop_front(); wr_rd == 0;});
	  my_config_db::gen2drv.put(trans);
	  my_config_db::gen2scor.put(trans);
    
      $display("GEN -> read:[%0d], addr:[%0h]",trans.wr_rd,trans.addr);
    end
  endtask

  //run task

  task run();
    write_gen();
    read_gen();
  endtask

endclass

 //write inline con read from the same which we are writnned -< done!
 //write cons to read and write seqn 
