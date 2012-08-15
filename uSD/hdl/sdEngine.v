////////////////////////////////////////////////////////////////////////////////
// Module: sdEngine
// Engineer: Bruce Klein bklein@slac.stanford.edu
//
// Create Date: 6/13/2012
// Project COB DPM
// Target Device FX70T
// Tool Version ISE 13.4
// Description: This module handles the initialization of the SD Card.
//              The initialization is from Figure 4-2 of SD
//              Physical Layer Simplified Specification Version 2.0
//              in the open core. Finally, it contains the FIFO control logic.
//
// Revision:    0.01 File Created 6/13/2012
//
/////////////////////////////////////////////////////////////////////////////

module sdEngine(

// system 
   sdClkIn, sysRstN, initRst, sdReady,
// Command FIFO
   cmdFifoDataOut, cmdFifoRdEn, cmdFifoEmpty,
// Result FIFO
   resultFifoDataIn, resultFifoWrEn, resultFifoFull, 
// uSDCmd
   newCmd, argumentReg, cmdReg, statusReg, initDone, dataReady, cmdResponse,
// uSDData
   writeCmd, readCmd, writeDone, readDone, sdStatusCmd, dataStatus,
// write FIFO
   writeFifoAlmostEmpty,
// read FIFO
   readFifoAlmostFull,
// debug signals
   sdEngineDebug, chipScopeSel
);

// system
input sdClkIn;                           // sd clock
input sysRstN;                           // active low reset
output reg initRst;                      // initialization reset
output reg sdReady;                      // sd card is ready for data transfer
// Command FIFO (generates commands to uSD card_
input [71:0] cmdFifoDataOut;             // command fifo data
output reg cmdFifoRdEn;                  // command fifo read enable
input cmdFifoEmpty;                   // command fifo has data

// Result FIFO (contains results of last command)
output  [35:0] resultFifoDataIn;      // result fifo data
output reg resultFifoWrEn;               // result fifo write enable
input resultFifoFull;                 // result fifo not full

// sdCmd
output reg newCmd;                       // generate new command
output reg [31:0] argumentReg;	         // command argument
output reg [15:0] cmdReg;                // command setting
input [15:0] statusReg;                  // command status register
input initDone;                          // init is complete
input dataReady;                         // received data ready
input [135:0] cmdResponse;               // cmd response from host

// sdData
output reg writeCmd;                     // write command start
output reg readCmd;                      // read command start
input writeDone;
input readDone;
output reg sdStatusCmd;
input [3:0] dataStatus;

// write FIFO
input writeFifoAlmostEmpty;              // write fifo almost empty

// read FIFO
input readFifoAlmostFull;                // read fifo almost full

// debug
output [96:0] sdEngineDebug;             // chipscope signals
input chipScopeSel;

reg [31:0] initDelay;                    // mostly for chipscope delay
reg [31:0] cmdWaitCnt;                   // counter for no response commands
reg [7:0] cmdState;                      // command state machine state
reg sdInitComplete;                      // ready for data transfer
reg [135:0] cmdResponseInt;              // capture command response
reg acmd41Done;                          // ACMD41 is complete
reg acmd6Done;                           // ACMD6 is complete
reg acmd42Done;                          // ACMD42 is complete
//reg acmd51Done;
reg [15:0] RCA;                          // Relative card address
// command state machine states
parameter IDLE           = 8'h00;
parameter SEND_CMD0      = 8'h01;
parameter CMD0_WAIT      = 8'h02;
parameter SEND_CMD8      = 8'h03;
parameter CMD8_WAIT      = 8'h04;
parameter SEND_CMD55     = 8'h05;
parameter CMD55_WAIT     = 8'h06;
parameter SEND_ACMD41    = 8'h07;
parameter ACMD41_WAIT    = 8'h08;
parameter ACMD41_CHECK   = 8'h09;
parameter SEND_CMD2      = 8'h0A;
parameter CMD2_WAIT      = 8'h0B;
parameter SEND_CMD3      = 8'h0C;
parameter CMD3_WAIT      = 8'h0D;
parameter CMD3_CHECK     = 8'h0E;
parameter SEND_CMD9      = 8'h0F;
parameter CMD9_WAIT      = 8'h10;
parameter SEND_CMD7      = 8'h11;
parameter CMD7_WAIT      = 8'h12;
parameter SEND_ACMD6     = 8'h13;
parameter ACMD6_WAIT     = 8'h14;
parameter ACMD6_CHECK    = 8'h15;
parameter SEND_ACMD42    = 8'h16;
parameter ACMD42_WAIT    = 8'h17;
parameter SEND_CMD16     = 8'h18;
parameter CMD16_WAIT     = 8'h19;
parameter READY          = 8'h1A;
parameter CMD_READ       = 8'h1B;
parameter CMD_CHECK      = 8'h1C;
parameter WRITE_CHECK    = 8'h1D;
parameter SEND_CMD24     = 8'h1E;      // write block
parameter CMD24_WAIT     = 8'h1F;
parameter WRITE          = 8'h20;
parameter WRITE_WAIT     = 8'h21;
parameter READ_CHECK     = 8'h22;
parameter SEND_CMD17     = 8'h23;      // read block
parameter CMD17_WAIT     = 8'h24;
parameter READ           = 8'h25;
parameter READ_WAIT      = 8'h26;
parameter RESULT_CHECK   = 8'h27;
parameter WRITE_RESULT   = 8'h28;
parameter SEND_ACMD13    = 8'h29;
parameter ACMD13_WAIT    = 8'h2A;


// result fifo
assign resultFifoDataIn = {16'b0, dataStatus, 1'b0, cmdResponse[45:40], cmdFifoDataOut[7:0]};
//                         [31:20] [19:16]             [7:0]
// debug signals
assign sdEngineDebug[7:0] = cmdState;
assign sdEngineDebug[39:8] = initDelay;
assign sdEngineDebug[40] = acmd41Done;
assign sdEngineDebug[41] = acmd6Done;
assign sdEngineDebug[59] = acmd42Done;
assign sdEngineDebug[57:42] = RCA;
assign sdEngineDebug[58] = cmdFifoEmpty;
// command response
// generate delayed reset
always @(posedge sdClkIn or negedge sysRstN)
begin
   if (~sysRstN) begin
      initDelay <= 32'b0;
      initRst <= 1'b1;
   end
   else begin
//      if (initDelay == 32'hFFFFFFFF) begin // counter at max count
      if (initDelay == 32'h0FFFFFFF) begin // counter at max count      
         initDelay <= initDelay;
         initRst <= 1'b0;
      end
      else begin
         initDelay <= initDelay + 1;
         initRst <= 1'b1;
      end
    end
end
//`endif

always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      cmdResponseInt <= 136'b0;
   end
   else if (dataReady) begin
      cmdResponseInt <= cmdResponse;
   end
   else begin
      cmdResponseInt <= cmdResponseInt;
   end
end


// cmd wait counter for no response commands
always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      cmdWaitCnt <= 32'b0;
   end
   else begin
      case(cmdState)
      SEND_CMD0: begin
         cmdWaitCnt <= 32'b0;
      end
      CMD0_WAIT: begin
         if (cmdWaitCnt == 32'hFFFFFFFF) begin
            cmdWaitCnt <= cmdWaitCnt;
         end
         else begin
            cmdWaitCnt <= cmdWaitCnt + 1;
         end
      end
      endcase // case (cmdState)
   end
end

always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      cmdState <= IDLE;
   end
   else begin
      case(cmdState) // synthesis parallel_case full_case
      IDLE: begin
         if (initDone) begin
            cmdState <= SEND_CMD0;
         end
         else begin
            cmdState <= IDLE;
         end
      end
      SEND_CMD0: begin
         cmdState <= CMD0_WAIT;
      end
      CMD0_WAIT: begin
         if (cmdWaitCnt >= 256) begin
            cmdState <= SEND_CMD8;
         end
         else begin
            cmdState <= CMD0_WAIT;
         end
      end
      SEND_CMD8: begin
         cmdState <= CMD8_WAIT;
      end
      CMD8_WAIT: begin
         if (dataReady) begin
            cmdState <= SEND_CMD55;
	 end
	 else begin
            cmdState <= CMD8_WAIT;
         end
      end
      SEND_CMD55: begin
         cmdState <= CMD55_WAIT;
      end
      CMD55_WAIT: begin
         if (dataReady) begin
            if (~acmd41Done & ~acmd6Done) begin
               cmdState <= SEND_ACMD41;
            end
            else if (acmd41Done & ~acmd6Done) begin
               cmdState <= SEND_ACMD6;
            end
            else if (acmd41Done & acmd6Done & ~acmd42Done) begin
               cmdState <= SEND_ACMD42;
            end
            else begin
               cmdState <= SEND_ACMD13;
	    end
	 end
	 else begin
            cmdState <= CMD55_WAIT;
         end
      end
      SEND_ACMD41: begin
         cmdState <= ACMD41_WAIT;
      end
      ACMD41_WAIT: begin
         if (dataReady) begin
            cmdState <= ACMD41_CHECK;
	 end
	 else begin
            cmdState <= ACMD41_WAIT;
         end
      end
      ACMD41_CHECK: begin
         if (cmdResponseInt[39]) begin
            cmdState <= SEND_CMD2;
         end
         else begin
            cmdState <= SEND_CMD55;
         end
      end
      SEND_CMD2: begin
         cmdState <= CMD2_WAIT;
      end
      CMD2_WAIT: begin
         if (dataReady) begin
            cmdState <= SEND_CMD3;
	 end
	 else begin
            cmdState <= CMD2_WAIT;
         end
      end
      SEND_CMD3: begin
         cmdState <= CMD3_WAIT;
      end
      CMD3_WAIT: begin
         if (dataReady) begin
            cmdState <= CMD3_CHECK;
	 end
	 else begin
            cmdState <= CMD3_WAIT;
         end
      end
      CMD3_CHECK: begin
         cmdState <= SEND_CMD9;
      end
      SEND_CMD9: begin
         cmdState <= CMD9_WAIT;
      end
      CMD9_WAIT: begin
         if (dataReady) begin
            cmdState <= SEND_CMD7;
	 end
	 else begin
            cmdState <= CMD9_WAIT;
         end
      end
      SEND_CMD7: begin
         cmdState <= CMD7_WAIT;
      end
      CMD7_WAIT: begin
         if (dataReady) begin
            cmdState <= SEND_CMD55;
	 end
	 else begin
            cmdState <= CMD7_WAIT;
         end
      end
      SEND_ACMD6: begin
         cmdState <= ACMD6_WAIT;
      end
      ACMD6_WAIT: begin
         if (dataReady) begin
            cmdState <= ACMD6_CHECK;
	 end
	 else begin
            cmdState <= ACMD6_WAIT;
         end
      end
      ACMD6_CHECK: begin
         cmdState <= SEND_CMD55;
      end
      SEND_ACMD42: begin
         cmdState <= ACMD42_WAIT;
      end
      ACMD42_WAIT: begin
         if (dataReady) begin
            cmdState <= SEND_CMD16;
	 end
	 else begin
            cmdState <= ACMD42_WAIT;
         end
      end
      SEND_CMD16: begin
         cmdState <= CMD16_WAIT;
      end
      CMD16_WAIT: begin
         if (dataReady) begin
            cmdState <= READY;
	 end
	 else begin
            cmdState <= CMD16_WAIT;
         end
      end
      SEND_ACMD13: begin
         cmdState <= ACMD13_WAIT;
      end
      ACMD13_WAIT: begin
         if (dataReady) begin
            cmdState <= READ_CHECK;
	 end
	 else begin
            cmdState <= ACMD13_WAIT;
         end
      end
      READY: begin
         if (~cmdFifoEmpty) begin
            cmdState <= CMD_READ;
         end
         else begin
            cmdState <= READY;
         end
      end
      CMD_READ: begin
         cmdState <= CMD_CHECK;
      end
      CMD_CHECK: begin
         if (cmdFifoDataOut[63:58] == 24) begin
            cmdState <= WRITE_CHECK;
         end
         else if (cmdFifoDataOut[63:58] == 17) begin
            cmdState <= READ_CHECK;
         end
         else if (cmdFifoDataOut[63:58] == 13) begin
            cmdState <= SEND_CMD55;
         end
         else begin
            cmdState <= READY;
         end
      end
      WRITE_CHECK: begin
         if (writeFifoAlmostEmpty) begin
            cmdState <= WRITE_CHECK;
         end
         else begin
            cmdState <= SEND_CMD24;
         end
      end
      SEND_CMD24: begin
         cmdState <= CMD24_WAIT;
      end
      CMD24_WAIT: begin
         if (dataReady) begin
            cmdState <= WRITE;
         end
         else begin
            cmdState <= CMD24_WAIT;
         end
      end
      WRITE: begin
         cmdState <= WRITE_WAIT;
      end
      WRITE_WAIT: begin
         if (writeDone) begin
            cmdState <= RESULT_CHECK;
         end
         else begin
            cmdState <= WRITE_WAIT;
         end
      end
      READ_CHECK: begin
         if (readFifoAlmostFull) begin
            cmdState <= READ_CHECK;
         end
         else begin
            if (cmdFifoDataOut[63:58] == 17) begin
               cmdState <= SEND_CMD17;
            end
            else if (cmdFifoDataOut[63:58] == 13) begin
               cmdState <= READ;
            end
         end
      end
      SEND_CMD17: begin
         cmdState <= CMD17_WAIT;
      end
      CMD17_WAIT: begin
         if (dataReady) begin
            cmdState <= READ;
         end
         else begin
            cmdState <= CMD17_WAIT;
         end
      end
      READ: begin
         cmdState <= READ_WAIT;
      end
      READ_WAIT: begin
         if (readDone) begin
            cmdState <= RESULT_CHECK;
         end
         else begin
            cmdState <= READ_WAIT;
         end
      end
      WRITE_RESULT: begin
         cmdState <= READY;
      end
      RESULT_CHECK: begin
         if (resultFifoFull) begin
            cmdState <= RESULT_CHECK;
	 end
	 else begin
            cmdState <= WRITE_RESULT;
         end
      end
      endcase // case (cmdState)
   end
end




// send initialization command
always @(*)
begin
   case(cmdState)  // synthesis parallel_case full_case
   IDLE: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h0000000;
      cmdReg <= 16'h0000;
      sdInitComplete <= 1'b0;
      writeCmd <= 1'b0;
      readCmd <= 1'b0;
      resultFifoWrEn <= 1'b0;
      cmdFifoRdEn <= 1'b0;
      sdStatusCmd <= 1'b0;
   end
   SEND_CMD0: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h0000000;
      cmdReg <= 16'h0000;
   end
   CMD0_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h0000000;
      cmdReg <= 16'h0000;
   end
   SEND_CMD8: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00001AA;
      cmdReg <= 16'h081A;
   end
   CMD8_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00001AA;
      cmdReg <= 16'h081A;
   end
   SEND_CMD55: begin
      newCmd <= 1'b1;
      argumentReg <= {RCA, 16'hAAAA};
      cmdReg <= 16'h371A;
   end
   CMD55_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= {RCA, 16'hAAAA};
      cmdReg <= 16'h371A;
   end
   SEND_ACMD41: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h40FF8000;
      cmdReg <= 16'h2912;
   end
   ACMD41_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h40FF8000;
      cmdReg <= 16'h2912;
   end
   SEND_CMD2: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h0209;
   end
   CMD2_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h0209;
   end
   SEND_CMD3: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h031A;
   end
   CMD3_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h031A;
   end
   CMD3_CHECK: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h031A;
   end
  SEND_CMD9: begin
      newCmd <= 1'b1;
      argumentReg <= {RCA, 16'h0};
      cmdReg <= 16'h0919;
  end
  CMD9_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= {RCA, 16'h0};
      cmdReg <= 16'h0919;
  end
  SEND_CMD7: begin
      newCmd <= 1'b1;
      argumentReg <= {RCA, 16'h0};
      cmdReg <= 16'h071A;
  end
  CMD7_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= {RCA, 16'h0};
      cmdReg <= 16'h071A;
  end
  SEND_ACMD6: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00000002;
      cmdReg <= 16'h061A;
  end
  ACMD6_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000002;
      cmdReg <= 16'h061A;
  end
  ACMD6_CHECK: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000002;
      cmdReg <= 16'h061A;
  end
  SEND_ACMD42: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h2A1A;
  end
  ACMD42_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h2A1A;
  end
  SEND_CMD16: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h00000200;
      cmdReg <= 16'h101A;
  end
  CMD16_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000200;
      cmdReg <= 16'h101A;
   end
   READY: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h0000;
      sdInitComplete <= 1'b1;
      resultFifoWrEn <= 1'b0;
      cmdFifoRdEn <= 1'b0;
      sdStatusCmd <= 1'b0;
   end
   CMD_READ: begin
      cmdFifoRdEn <= 1'b1;
   end
   CMD_CHECK: begin
      cmdFifoRdEn <= 1'b0;
   end
   WRITE_CHECK: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h0000;
   end
   SEND_CMD24: begin
      newCmd <= 1'b1;
      argumentReg <= cmdFifoDataOut[31:0];
      cmdReg <= 16'h181A;
   end
   CMD24_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= cmdFifoDataOut[31:0];
      cmdReg <= 16'h181A;
   end
   WRITE: begin
      writeCmd <= 1'b1;
   end
   WRITE_WAIT: begin
      writeCmd <= 1'b0;
   end
   READ_CHECK: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h00000000;
      cmdReg <= 16'h0000;
   end
   SEND_CMD17: begin
      newCmd <= 1'b1;
      argumentReg <= cmdFifoDataOut[31:0];
      cmdReg <= 16'h111A;
   end
   CMD17_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= cmdFifoDataOut[31:0];
      cmdReg <= 16'h111A;
   end
   READ: begin
      readCmd <= 1'b1;
      if (cmdFifoDataOut[63:58] == 13) begin
         sdStatusCmd <= 1'b1;
      end
      else begin
         sdStatusCmd <= 1'b0;
      end
   end
   READ_WAIT: begin
      readCmd <= 1'b0;
      if (cmdFifoDataOut[63:58] == 13) begin
         sdStatusCmd <= 1'b1;
      end
      else begin
         sdStatusCmd <= 1'b0;
      end
   end
   RESULT_CHECK: begin
      resultFifoWrEn <= 1'b0;
   end
   WRITE_RESULT: begin
      resultFifoWrEn <= 1'b1;
   end
   SEND_ACMD13: begin
      newCmd <= 1'b1;
      argumentReg <= 32'h0;
      cmdReg <= 16'h0D1A;
   end
   ACMD13_WAIT: begin
      newCmd <= 1'b0;
      argumentReg <= 32'h0;
      cmdReg <= 16'h0D1A;
   end
   endcase
end

// acmd41 done
always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      acmd41Done <= 1'b0;
   end
   else begin
      if (cmdState == ACMD41_CHECK) begin
         acmd41Done <= cmdResponse[39];
      end
      else begin
         acmd41Done <= acmd41Done;
      end
   end
end

// acmd6 done
always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      acmd6Done <= 1'b0;
   end
   else begin
      if (cmdState == ACMD6_CHECK) begin
         acmd6Done <= 1'b1;
      end
      else begin
         acmd6Done <= acmd6Done;
      end
   end
end


// acmd42 done
always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      acmd42Done <= 1'b0;
   end
   else begin
      if (cmdState == ACMD42_WAIT) begin
         acmd42Done <= 1'b1;
      end
      else begin
         acmd42Done <= acmd42Done;
      end
   end
end

// capture RCA
always @(posedge sdClkIn or posedge initRst)
begin
   if (initRst) begin
      RCA <= 16'b0;
   end
   else begin
      if (cmdState == CMD3_CHECK) begin
         RCA <= cmdResponseInt[39:24];
      end
      else begin
         RCA <= RCA;
      end
   end
end

endmodule

