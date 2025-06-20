//k.indhu
//indhukoyyana2004@gmail.com
//projectname:password_locking_system_using_verilog_HDL

module password_lock_system(
      input reset,
      input clk,
      input [3:0] setpass,
      input [3:0] passin,
      input enter,
      output access,
      output alarm,
      output [1:0] count
    );
      wire check;
      assign check = !(setpass^passin);  // Password match
      password_attempt_counter counter( .clk(clk),.enter(enter),.e(!check),.rstn(reset),.cnt(count),.access(access),.alarm(alarm));
    endmodule
    
module password_attempt_counter(
  input clk,
  input enter,
  input e,
  input rstn,
  output reg [1:0] cnt,
  output reg access,
  output reg alarm
);
  parameter N = 4;
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin     // when reset = 0 this block will excute
      cnt <= 0;
      access <= 1;
      alarm <= 0;
    end 
    else if (enter) begin
      if (!e) begin
        cnt <= 0;        // when password is correct this block will excute when enter = 1
        access <= 1;
        alarm <= 0;
      end     
      else if (cnt == N - 2) begin
        cnt <= cnt + 1;
        access <= 0;                // when count = 2 this block wil wxcute when enter =1
        alarm <= 1;
      end   
      else if (cnt == N - 1) begin
        access <= 0;               // when count = 3 his block will excute when enter =1						
        alarm <= 1;  
      end 
        else if(e) begin
        cnt <= cnt + 1;         //when password is wrong this block wil excute when enter =1
        access <= 0;             
        alarm <= 0;
      end
    end
  end
endmodule
