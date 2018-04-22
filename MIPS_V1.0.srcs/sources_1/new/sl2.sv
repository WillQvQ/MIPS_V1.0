`timescale 1ns / 1ps


module sl2(
    input   logic [31:0] sl2_a,
    output  logic [31:0] sl2_y
    );
assign sl2_y = {sl2_a[29:0],2'b00};
endmodule
