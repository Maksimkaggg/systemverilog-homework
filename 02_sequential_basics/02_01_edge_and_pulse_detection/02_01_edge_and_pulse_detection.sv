// ----------------------------------------------------------------------------
// Example
// ----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (
    input  logic      clk,
    input  logic      rst,
    input  logic        a,
    output logic detected
);
  logic [1:0] a_r1;  

  always_ff @(posedge clk)
    if (rst) begin
      a_r1 <= 2'b0;
    end
    else begin
      a_r1 <= {a_r1[0], a}; 
    end

  assign detected = (a_r1 == 2'b01) && (a == 1'b0);


    




endmodule
