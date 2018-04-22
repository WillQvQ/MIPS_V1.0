`timescale 1ns / 1ps

module adder(
    input   logic [31:0]    adder_a, adder_b,
    output  logic [31:0]    adder_y
    );
assign  adder_y = adder_a + adder_b;
endmodule
