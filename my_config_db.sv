class my_config_db;

static transection trans = new; 

static mailbox#(transection) gen2drv = new;

static mailbox#(transection) mon2scor = new;

static mailbox gen2scor = new;

static int repeat_cnt = 10;

endclass

//mentor
// 1. we can not define a variable virtual or static at a same time


