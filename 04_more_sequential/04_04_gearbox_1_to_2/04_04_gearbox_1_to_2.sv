//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module gearbox_1_to_2 #(
    parameter width = 0
) (
    input clk,
    input rst,

    input               up_vld,  // upstream
    input [width - 1:0] up_data,

    output                   down_vld,  // downstream
    output [2 * width - 1:0] down_data
);
  // Task:
  // Implement a module that transforms a stream of data
  // from 'width' to the 2*'width' data width.
  //
  // The module should be capable to accept new data at each
  // clock cycle and produce concatenated 'down_data'
  // at each second clock cycle.
  //
  // The module should work properly with reset 'rst'
  // and valid 'vld' signals
  logic vld_2;
  logic [width - 1:0] down_data_r;
  assign vld_2 = (counter_1[0] & up_vld) ? 1'b1 : 1'b0;

  logic [1:0] counter_1;
  always_ff @(posedge clk) begin
    if (rst) begin
      counter_1 <= '0;
    end else if (up_vld) begin
      if (vld_2) begin
        counter_1 <= '0;
      end else begin
        counter_1 <= 1'b1;
      end
    end
  end


  always_ff @(posedge clk) begin
    if (rst) begin
      down_data_r <= '0;
    end else if (up_vld) begin
      down_data_r <= up_data;
    end
  end

  assign down_data = (vld_2) ? {down_data_r, up_data} : '0;
  assign down_vld  = (vld_2) ? 1'b1 : 1'b0;

endmodule
