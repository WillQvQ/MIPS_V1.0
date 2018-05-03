`timescale 1ns / 1ps

module top(
    input   logic       clk, reset,
    output  logic [31:0]writedata, dataadr,
    output  logic       memwrite,
    output  logic [31:0]instr,//
    output  logic [5:0]pclow
);
logic [31:0] pc,readdata;
mips mips(clk, reset, pc, instr, memwrite, dataadr,
        writedata, readdata);
imem imem(pc[7:2], instr);
dmem dmem(clk, memwrite, dataadr, writedata, readdata);
assign pclow = pc[7:2];
endmodule