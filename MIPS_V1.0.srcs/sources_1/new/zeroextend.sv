`timescale 1ns / 1ps

module zeroextend#(parameter HALF = 16)(
    input   logic [HALF-1:0]    ze_a,
    output  logic [HALF*2-1:0]  ze_y
    );
assign  ze_y = {{HALF{1'b0}},ze_a};
endmodule
