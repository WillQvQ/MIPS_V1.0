`timescale 1ns / 1ps

module zeroextend(
    input   logic [15:0]    se_a,
    output  logic [31:0]    se_y
    );
assign  se_y = {16'b0,se_a};
endmodule
