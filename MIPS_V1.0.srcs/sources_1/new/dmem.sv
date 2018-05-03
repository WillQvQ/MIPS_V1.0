`timescale 1ns / 1ps

module dmem#(parameter N = 32, L = 64)(
    input   logic           clk, we,
    input   logic [N-1:0]    a, wd,
    output  logic [N-1:0]    rd
    );
logic [N-1:0] RAM[L-1:0];
assign rd = RAM[a[N-1:2]];
always_ff @(posedge clk) begin
    if (we) RAM[a[N-1:2]] <= wd;
end
endmodule
