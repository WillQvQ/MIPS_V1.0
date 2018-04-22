`timescale 1ns / 1ps

module signextend(
    input   logic [15:0]    se_a,
    output  logic [31:0]    se_y
    );
assign  se_y = {{16{se_a[15]}},se_a};
endmodule
