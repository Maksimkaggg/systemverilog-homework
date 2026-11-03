//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module add
(
  input  [3:0] a, b,
  output [3:0] sum
);

  assign sum = a + b;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module signed_add_with_overflow
(
  input  [3:0] a, b,
  output [3:0] sum,
  output       overflow
);
  // Task:
  //
  // Implement a module that adds two signed numbers
  // and detects an overflow.
  //
  // By "signed" we mean "two's complement numbers".
  // See https://en.wikipedia.org/wiki/Two%27s_complement for details.
  //
  // The 'overflow' output bit should be set to 1
  // when the resulting sum (either positive or negative)
  // of two input arguments is greater or less than
  // 4-bit maximum or minimum signed number.
  //
  // Otherwise the 'overflow' should be set to 0.
  logic  [4:0] a_e, b_e, res;
  assign a_e = $signed(a);
  assign b_e = $signed(b);
  assign res = a_e  + b_e;
  assign sum = res[3:0];
  assign overflow = res[4]^res[3];
//TEST: extra argument ‘+’
// на code2silicon прошло тесты

endmodule
