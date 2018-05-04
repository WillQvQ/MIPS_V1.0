`timescale 1ns / 1ps

module imem#(parameter N = 32, L = 64, LL=6)(
    input   logic [LL-1:0] a,
    output  logic [N-1:0] rd 
    );
logic [N-1:0] RAM[L-1:0];
initial 
    $readmemh("C:/Users/will131/Documents/workspace/MIPS_V1.0/memfile.dat",RAM);
assign rd = RAM[a];
endmodule
