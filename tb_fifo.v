
`timescale 1ns / 1ns
module tb_fifo  ; 

parameter ADDRSIZE  = 4 ;
parameter DATASIZE  = 8 ; 
  reg    rrst_n   ; 
  reg    rclk   ; 
  reg    rinc   ; 
  wire  [DATASIZE-1:0]  rdata   ; 
  reg    wrst_n   ; 
  reg    wclk   ; 
  reg    winc   ; 
  reg  [DATASIZE-1:0]  wdata   ; 
  wire    rempty   ; 
  wire    wfull   ; 
  AsynchFIFO    #( DATASIZE, ADDRSIZE)
   DUT  ( 
       .rrst_n (rrst_n ) ,
      .rclk (rclk ) ,
      .rinc (rinc ) ,
      .rdata (rdata ) ,
      .wrst_n (wrst_n ) ,
      .wclk (wclk ) ,
      .winc (winc ) ,
      .wdata (wdata ) ,
      .rempty (rempty ) ,
      .wfull (wfull ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 10 us, Period = 100 ns
  initial
  begin
   repeat(100)
   begin
	   rclk  = 1'b1  ;
	  #40  rclk  = 1'b0  ;
	  #40 ;
// 10 us, repeat pattern in loop.
   end
  end


// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 10 us, Period = 20 ns
  initial
  begin
   repeat(500)
   begin
	   wclk  = 1'b1  ;
	  #10  wclk  = 1'b0  ;
	  #10 ;
// 10 us, repeat pattern in loop.
   end
  end
  
  initial 
	begin
	winc = 1'b0;
		rinc =1'b0;
		wrst_n = 0;
		rrst_n = 0;
		#50 wrst_n = 1;
		rrst_n = 1;
		winc = 1'b1;
		
		#2 @(negedge wclk) wdata =8'h00;
		@(negedge wclk) wdata = 8'hFF;
		@(negedge wclk) wdata = 8'hF1;
		@(negedge wclk) wdata = 8'hF2; 
		@(negedge wclk) wdata = 8'hF3;
		@(negedge wclk) wdata = 8'hF4;
		@(negedge wclk) wdata = 8'hF5;
		@(negedge wclk) wdata = 8'hF6;
		@(negedge wclk) wdata = 8'hF7;
		@(negedge wclk) wdata = 8'hF8; rinc =1'b1;
		@(negedge wclk) wdata = 8'hF9;
		@(negedge wclk) wdata = 8'hFA;
		@(negedge wclk) wdata = 8'hFB;
		@(negedge wclk) wdata = 8'hFC;
		@(negedge wclk) wdata = 8'hFD;
		@(negedge wclk) wdata = 8'hFE;
		@(negedge wclk) wdata = 8'hFF;
		@(negedge wclk) wdata = 8'hA1;
		@(negedge wclk) wdata = 8'hA2;
	end
		
		

  initial
	#20000 $stop;
endmodule
