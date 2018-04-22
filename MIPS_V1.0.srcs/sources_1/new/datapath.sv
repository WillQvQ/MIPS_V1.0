`timescale 1ns / 1ps

module datapath(
    input   logic       clk, reset,
    input   logic       memtoreg, pcsrc,
    input   logic       alusrc, regdst,
    input   logic       regwrite, jump,
    input   logic [2:0] alucontrol,
    output  logic       zero,
    output  logic[31:0] pc,
    input   logic[31:0] instr,
    output  logic[31:0] aluout, writedata,
    input   logic[31:0] readdata
    );
logic [4:0] writereg;
logic[31:0] pcnext, pcnextbr, pcplus4, pcbranch;
logic[31:0] sigmimm, sigmimmsh;
logic[31:0] srca, srcb;
logic[31:0] result;
// next PC
flopr #(32) pcreg(clk, reset, pcnext, pc);
adder       pcadd1(pc,32'b100,pcplus4);
sl2         immsh(sigmimm, sigmimmsh);
adder       pcadd2(pcplus4, sigmimmsh, pcbranch);
mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28],instr[25:0],2'b00},
            jump,pcnext);
// register file logic
regfile     regfile(clk,regwrite, instr[25:21],instr[20:16],writereg
            ,result,srca,writedata);
mux2 #(5)   wrmux(instr[20:16],instr[15:11],regdst,writereg);
mux2 #(32)  resmux(aluout, readdata, memtoreg, result);
signextend  se(instr[15:0],sigmimm);
//ALU logic
mux2 #(32)  srcbmux(writedata, sigmimm, alusrc, srcb);
alu         alu(srca,srcb,alucontrol,aluout,zero);
endmodule
