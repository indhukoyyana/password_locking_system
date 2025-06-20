//k.indhu
//indhukoyyana2004@gmail.com
//projectname:password_locking_system_using_verilog_HDL


`timescale 1ns/1ps
module tb_password_lock_system;
  reg clk, reset, enter;
  reg [3:0] setpass, passin;
  wire access, alarm;
  wire [1:0] count;
  // Instantiate DUT
  password_lock_system dut ( .reset(reset),.clk(clk),.setpass(setpass),.passin(passin),.enter(enter),.access(access),.count(count),.alarm(alarm));
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  // Stimulus
  initial begin
    $display("Starting simulation...\n");
    setpass = 4'hE;  // Set correct password = 1110
    // Initial reset
    reset = 0; 
    #5 enter = 0;
    passin = 0;
    #10 reset = 1;
    // 1st attempt - wrong
    #10 passin = 4'hA;
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 1:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d",  reset, passin,setpass, access, alarm, count);
    // 2nd attempt - wrong
    #10 passin = 4'hB; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 2:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d", reset, passin,setpass, access, alarm, count);
    // 3rd attempt - wrong (should trigger alarm)
    #10 passin = 4'h9; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 3:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d", reset, passin,setpass, access, alarm, count);

    // 4th attempt - correct password
    #10 passin = 4'hE; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 4:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d",  reset, passin,setpass, access, alarm, count);
    // 5th attempt - wrong
    #10 passin = 4'hF; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 5:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d", reset, passin, setpass,access, alarm, count);
    // 6th attempt - wrong
    #10 passin = 4'h5;
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 6:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d",  reset, passin,setpass, access, alarm, count);
    // 7th attempt - wrong
    #10 passin = 4'h4; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 7:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d", reset, passin,setpass, access, alarm, count);
    // 8th attempt - wrong (should trigger alarm)
    #10 passin = 4'h7; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 8:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d", reset, passin,setpass, access, alarm, count);
       // 9th attempt - wrong password but reset condition
     #10 reset = 0;
    #10 passin = 4'hc; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 9:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d",  reset, passin,setpass, access, alarm, count);
     // 10th attempt - correct password
    #10 reset = 1;
    #10 passin = 4'he; 
    #5 enter = 1;
    #10 enter = 0;
    $display("Attempt 10:  reset=%b passin=%h setpass=%h access=%b alarm=%b count=%d",  reset, passin,setpass, access, alarm, count);
    $display("\nSimulation complete.");
    #20 $finish;
  end
endmodule