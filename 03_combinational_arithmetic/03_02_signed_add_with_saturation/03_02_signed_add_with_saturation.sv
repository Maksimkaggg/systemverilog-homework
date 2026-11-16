//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module add (
    input  [3:0] a,
    b,
    output [3:0] sum
);

  assign sum = a + b;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module signed_add_with_saturation (
    input  logic [3:0] a,
    b,
    output logic [3:0] sum
);

  // Task:
  //
  // Implement a module that adds two signed numbers with saturation.
  //
  // "Adding with saturation" means:
  //
  // When the result does not fit into 4 bits,
  // and the arguments are positive,
  // the sum should be set to the maximum positive number.
  //
  // When the result does not fit into 4 bits,
  // and the arguments are negative,
  // the sum should be set to the minimum negative number.
  // logic signed [4:0] a_e;
  // logic signed [4:0] b_e;
  // logic signed [4:0] sum_e;


  logic signed [4:0] a_e;
  logic signed [4:0] b_e;
  logic signed [4:0] sum_e;
  logic              overflow;

  assign a_e      = $signed(a);
  assign b_e      = $signed(b);
  assign sum_e    = a_e + b_e;
  assign overflow = sum_e[4] ^ sum_e[3];
  always_comb begin
    if (overflow) begin
      if (sum_e > 'sd7) begin
        sum = 'd7;
      end else begin
        sum = 'b1000;
      end
    end else begin
      sum = sum_e[3:0];
    end
  end


endmodule
