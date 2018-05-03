`timescale 1ns / 1ps

module zeroextend#(parameter Half = 16)(
    input   logic [Half-1:0]    se_a,
    output  logic [Half*2-1:0]    se_y
    );
assign  se_y = {{Half{1'b0}},se_a};
endmodule
