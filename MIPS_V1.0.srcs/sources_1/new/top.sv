`timescale 1ns / 1ps

module top#(parameter N = 32)(
    input   logic       clk, reset,
    output  logic [N-1:0]writedata, dataadr,
    output  logic       memwrite,
    output  logic [N-1:0]instr,//
    output  logic [5:0]pclow
);
logic [N-1:0] pc,readdata;
mips mips(clk, reset, pc, instr, memwrite, dataadr,
        writedata, readdata);
imem imem(pc[7:2], instr);
dmem dmem(clk, memwrite, dataadr, writedata, readdata);
assign pclow = pc[7:2];
endmodule