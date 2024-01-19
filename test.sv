
class test;

  environment env = new;
  virtual ram_inf vinf;
 
  task run();
    env.vinf = vinf;
    env.run();

  endtask
 
 endclass



 //make class tra,env
 // interface

