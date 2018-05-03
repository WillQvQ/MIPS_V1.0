`timescale 1ns / 1ps

module mips#(parameter N = 32)(
    input   logic       clk, reset,
    output  logic[N-1:0] pc,
    input   logic[N-1:0] instr,
    output   logic       memwrite,
    output  logic[N-1:0] aluout, writedata,
    input  logic[N-1:0] readdata
);
logic       memtoreg, regdst, regwrite, jump, pcsrc, zero;
logic [1:0] alusrc;   
logic [2:0] alucontrol;
controller controller(instr[31:26],instr[5:0],zero,
            memtoreg, memwrite, pcsrc ,alusrc,
            regdst, regwrite, jump, alucontrol);
datapath datapath(clk, reset, memtoreg, pcsrc, alusrc, 
        regdst, regwrite, jump, alucontrol, zero, 
        pc, instr, aluout, writedata, readdata);
endmodule