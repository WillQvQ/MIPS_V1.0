`timescale 1ns / 1ps


module maindec(
    input   logic [5:0] op,
    output  logic       memtoreg, memwrite,
    output  logic       branch,
    output  logic [1:0] alusrc,//
    output  logic       regdst, regwrite,
    output  logic       jump,
    output  logic [2:0] aluop
    );
logic [10:0] controls;
assign {regwrite, regdst, alusrc, branch, memwrite,
    memtoreg, jump, aluop} = controls;
always_comb begin
    case (op)
        6'b000000: controls <= 11'b1100_0000_010;    //RTYPE
        6'b100011: controls <= 11'b1001_0010_000;    //LW
        6'b101011: controls <= 11'b0001_0100_000;    //SW
        6'b000100: controls <= 11'b0000_1000_001;    //BEQ
        6'b000101: controls <= 11'b0000_1000_101;    //BNE ====
        6'b001000: controls <= 11'b1001_0000_000;    //ADDI
        6'b001100: controls <= 11'b1011_0000_100;    //ANDI====
        6'b001101: controls <= 11'b1011_0000_101;    //ORI ====
        6'b001010: controls <= 11'b1001_0000_110;    //SLTI====
        6'b000010: controls <= 11'b0000_0001_000;    //J
        default:   controls <= 11'bxxxx_xxxx_xxx;    // illegeal op
    endcase
end
endmodule
