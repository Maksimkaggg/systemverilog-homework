//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output [1:0] grants
);
    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01



// преоритет меняется только при requests = 11
// logic flag;
// assign flag = requests[1] & requests[0];
// logic queue;

// assign grants = (requests == 2'b11) ? {requests[1] & queue, requests[0] & ~queue} : requests;



// always_ff @(posedge clk) begin
//     if (rst)
//         queue <= '0;
//     else if (flag) begin
//         queue <= ~queue;
//     end
// end
// приоритет будет меняться после каждого победителя

logic flag;
assign flag = requests[1] & requests[0];
logic queue;

assign grants = (requests == 2'b11) ? {queue, ~queue} : requests;


always_ff @(posedge clk) begin
    if (rst)
        queue <= '0;
    else if (flag) begin
        queue <= ~queue;
    end
    else if (requests != '0) begin
        queue <= requests[0];
    end
end

endmodule
