//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_adder_with_vld
(
  input logic clk,
  input logic rst,
  input logic vld,
  input logic a,
  input logic  b,
  input logic last,
  output logic sum
);

  // Task:
  // Implement a module that performs serial addition of two numbers
  // (one pair of bits is summed per clock cycle).
  //
  // It should have input signals a and b, and output signal sum.
  // Additionally, the module have two control signals, vld and last.
  //
  // The vld signal indicates when the input values are valid.
  // The last signal indicates when the last digits of the input numbers has been received.
  //
  // When vld is high, the module should add the values of a and b and produce the sum.
  // When last is high, the module should output the sum and reset its internal state, but
  // only if vld is also high, otherwise last should be ignored.
  //
  // When rst is high, the module should reset its internal state.
  logic carry_i;
  logic carry_o;
  assign {carry_o, sum} = a+b+carry_i;
  
  always_ff @(posedge clk) begin
    if (rst) carry_i <= '0;
    else if(vld) begin
      if(last)
        carry_i <= '0;
      else
        carry_i <= carry_o;
    end
  end

endmodule
