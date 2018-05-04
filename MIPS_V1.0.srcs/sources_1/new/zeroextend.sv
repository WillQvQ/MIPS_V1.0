`timescale 1ns / 1ps

module zeroextend#(parameter HALF = 16)(
    input   logic [HALF-1:0]    se_a,
    output  logic [HALF*2-1:0]    se_y
    );
assign  se_y = {{HALF{1'b0}},se_a};
endmodule
