
class environment;

  schorebord schor = new;
  agent age = new;
  virtual ram_inf vinf;
  
  task run();
    age.vinf = vinf;
    fork 
      age.run();
      schor.run();
    join_any
  endtask
  
endclass
