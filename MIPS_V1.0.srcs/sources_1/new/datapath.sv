`timescale 1ns / 1ps

module datapath#(parameter N = 32)(
    input   logic       clk, reset,
    input   logic       memtoreg, pcsrc,
    input   logic [1:0] alusrc,
    input   logic       regdst,
    input   logic       regwrite, jump,
    input   logic [2:0] alucontrol,
    output  logic       zero,
    output  logic[N-1:0] pc,
    input   logic[N-1:0] instr,
    output  logic[N-1:0] aluout, writedata,
    input   logic[N-1:0] readdata
    );
logic [4:0] writereg;
logic[N-1:0] pcnext, pcnextbr, pcplus4, pcbranch;
logic[N-1:0] signimm1, signimm2;
logic[N-1:0] signimm, signimmsh;
logic[N-1:0] srca, srcb;
logic[N-1:0] result;
// next PC
flopr #(N) pcreg(clk, reset, pcnext, pc);
adder       pcadd1(pc,32'b100,pcplus4);
sl2         immsh(signimm1, signimmsh);
adder       pcadd2(pcplus4, signimmsh, pcbranch);
mux2 #(N)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
mux2 #(N)  pcmux(pcnextbr, {pcplus4[31:28],instr[25:0],2'b00},
            jump,pcnext);
// register file logic
regfile     regfile(clk,regwrite, instr[25:21],instr[20:16],writereg
            ,result,srca,writedata);
mux2 #(5)   wrmux(instr[20:16],instr[15:11],regdst,writereg);
mux2 #(N)  resmux(aluout, readdata, memtoreg, result);
signextend  se(instr[15:0],signimm1);
zeroextend  ze(instr[15:0],signimm2);
//ALU logic
// assign signimm = signimm1;
mux2 #(N)  immmux(signimm1, signimm2, alusrc[1], signimm);
mux2 #(N)  srcbmux(writedata, signimm, alusrc[0], srcb);
alu         alu(srca,srcb,alucontrol,aluout,zero);
endmodule
