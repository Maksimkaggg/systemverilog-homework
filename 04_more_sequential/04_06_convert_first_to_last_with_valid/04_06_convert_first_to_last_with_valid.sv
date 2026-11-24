//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module conv_first_to_last_no_ready #(
    parameter width = 8
) (
    input clock,
    input reset,

    input               up_valid,
    input               up_first,
    input [width - 1:0] up_data,

    output               down_valid,
    output               down_last,
    output [width - 1:0] down_data
);
  // Task:
  // Implement a module that converts 'first' input status signal
  // to the 'last' output status signal.
  //
  // See README for full description of the task with timing diagram.

  logic valid;

  always_ff @(posedge clock) begin
    if (reset) begin
      valid <= '0;
    end else if (up_valid) begin
      valid <= up_valid;
    end
  end

  assign down_valid = valid & up_valid;


  logic [width - 1:0] data;

  always_ff @(posedge clock) begin
    if (reset) begin
      data <= '0;
    end else if (up_valid) begin
      data <= up_data;
    end
  end

  assign down_data = data;


  assign down_last = up_first & valid & up_valid;



endmodule
