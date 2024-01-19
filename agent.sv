

class agent;

  generator gen = new;
  driver drv = new;
  monitor mon = new;
  virtual ram_inf vinf;
  

  task main();
    fork 
      gen.run();
	  drv.run();
	  mon.run();
    join_any
  endtask

  task run();

    drv.vinf = vinf;
    mon.vinf = vinf;
    main();

  endtask

endclass
