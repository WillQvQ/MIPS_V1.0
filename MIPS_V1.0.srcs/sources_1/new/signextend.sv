`timescale 1ns / 1ps

module signextend#(parameter Half = 16)(
    input   logic [Half-1:0]    se_a,
    output  logic [2*Half-1:0]    se_y
    );
assign  se_y = {{Half{se_a[Half-1]}},se_a};
endmodule
