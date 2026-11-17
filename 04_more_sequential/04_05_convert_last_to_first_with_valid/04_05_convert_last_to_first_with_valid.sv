//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module conv_last_to_first #(
    parameter width = 8
) (
    input clock,
    input reset,

    input               up_valid,
    input               up_last,
    input [width - 1:0] up_data,

    output               down_valid,
    output               down_first,
    output [width - 1:0] down_data
);
  // Task:
  // Implement a module that converts 'last' input status signal
  // to the 'first' output status signal.
  //
  // See README for full description of the task with timing diagram.
  logic down_first_r;

  always_ff @(posedge clock) begin
    if (reset) begin
      down_first_r <= 1'b1;
    end else if (up_last & up_valid) begin
      down_first_r <= 1'b1;
    end else if (~up_valid) begin
      down_first_r <= down_first_r;
    end else begin
      down_first_r <= '0;
    end
  end


  assign down_first = down_first_r;
  assign down_data  = up_data;
  assign down_valid = up_valid;

endmodule
