

class schorebord;
  
  int cnt;
  transection trans,trans_ref;

  bit [31:0]mem[31:0];
  
  task run();
    trans = new;
	trans_ref = new;
    forever begin
	  $display("---------------------- Transection:[%0d] -----------------------",cnt);
	  
	  my_config_db::mon2scor.get(trans);
      my_config_db::gen2scor.get(trans_ref);  

	  if(trans.wr_rd == 0 && trans_ref.wr_rd == 1)begin
	    if(trans.dout == trans_ref.din)begin
		  $display("Match ->dout :[%0d],din: [%0d]",trans.dout,trans_ref.din);
		end
		
		else $display("Not Match ->dout :[%0d],din: [%0d]",trans.dout,trans_ref.din);

	  end

	  else if(trans.wr_rd == 1 && trans_ref.wr_rd == 0)begin
	    if(trans.din == trans_ref.dout)begin
		  $display("Match -> din :[%0d],dout : [%0d]",trans.din,trans_ref.dout);
		end
	    else begin
		  $display("Match -> din :[%0d],dout : [%0d]",trans.din,trans_ref.dout);
		end
		
	  end
	 cnt++;
	end
  endtask

endclass

//mentor
//1. can we use que,asso, mem witch whould be best and why 
//2. what is write are read index in assoi aarry
