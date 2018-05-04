`timescale 1ns / 1ps

module signextend#(parameter HALF = 16)(
    input   logic [HALF-1:0]    se_a,
    output  logic [2*HALF-1:0]    se_y
    );
assign  se_y = {{HALF{se_a[HALF-1]}},se_a};
endmodule
