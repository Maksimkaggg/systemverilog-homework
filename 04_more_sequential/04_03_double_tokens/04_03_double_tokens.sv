//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module double_tokens (
    input        clk,
    input        rst,
    input        a,
    output       b,
    output logic overflow
);
  // Task:
  // Implement a serial module that doubles each incoming token '1' two times.
  // The module should handle doubling for at least 200 tokens '1' arriving in a row.
  //
  // In case module detects more than 200 sequential tokens '1', it should assert
  // an overflow error. The overflow error should be sticky. Once the error is on,
  // the only way to clear it is by using the "rst" reset signal.
  //
  // Note:
  // Check the waveform diagram in the README for better understanding.
  //
  // Exam 
  // a -> 10010011000110100001100100
  // b -> 11011011110111111001111110
  logic [7:0] counter_1;
  logic plus_1;

  assign overflow = (counter_1 > 8'd200);
  assign b = a | plus_1;
  always_ff @(posedge clk) begin
    if (rst) begin
      counter_1 <= '0;
    end else if (a) begin
      counter_1 <= counter_1 + 1'b1;
    end else if (plus_1 & ~a & (counter_1 > 0)) begin
      counter_1 <= counter_1 - 1'b1;
    end
  end

  always_comb begin
    if (~a & counter_1 > 1'b0) begin
      plus_1 = 1'b1;
    end else begin
      plus_1 = 1'b0;
    end
  end
endmodule
