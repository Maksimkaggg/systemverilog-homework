//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

// A non-parameterized module
// that implements the signed multiplication of 4-bit numbers
// which produces 8-bit result

module signed_mul_4 (
    input  signed [3:0] a,
    b,
    output signed [7:0] res
);

  assign res = a * b;

endmodule

// A parameterized module
// that implements the unsigned multiplication of N-bit numbers
// which produces 2N-bit result

module unsigned_mul #(
    parameter n = 8
) (
    input  [    n - 1:0] a,
    b,
    output [2 * n - 1:0] res
);

  assign res = a * b;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

// Task:
//
// Implement a parameterized module
// that produces either signed or unsigned result
// of the multiplication depending on the 'signed_mul' input bit.

module signed_or_unsigned_mul #(
    parameter n = 8
) (
    input  logic [    n - 1:0] a,
    b,
    input  logic               signed_mul,
    output logic [2 * n - 1:0] res
);

  //напомнить насте расссказать про никиту С. и кощеенко.

  logic signed [n:0] a_e;
  logic signed [n:0] b_e;
  logic signed [2 * n:0] res_e;
  assign a_e   = $signed(a);
  assign b_e   = $signed(b);
  assign res_e = a_e * b_e;
  always_comb begin
    case (signed_mul)
      1'b0: res = a * b;
      1'b1: res = res_e[2*n-1:0];
    endcase
  end




endmodule
