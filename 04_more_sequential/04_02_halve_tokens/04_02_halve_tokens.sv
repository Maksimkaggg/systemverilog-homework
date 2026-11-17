//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens (
    input  clk,
    input  rst,
    input  a,
    output b
);
  // Task:
  // Implement a serial module that reduces amount of incoming '1' tokens by half.
  //
  // Note:
  // Check the waveform diagram in the README for better understanding.
  //
  // Exam 1
  // a -> 110_011_101_000_1111
  // b -> 010_001_001_000_0101
  assign b = (counter_1[0] & a) ? 1'b1 : 1'b0;

  logic [1:0] counter_1;
  always_ff @(posedge clk) begin
    if (rst) begin
      counter_1 <= '0;
    end else if (a) begin
      if (b) begin
        counter_1 <= '0;
      end else begin
        counter_1 <= 1'b1;
      end
    end
  end
endmodule
