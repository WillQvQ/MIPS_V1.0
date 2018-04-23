`timescale 1ns / 1ps


module alu#(parameter N = 32,
    S_AND = 3'b000,
    S_OR = 3'b001,
    S_PLUS = 3'b010,
    S_UNUSED = 3'b011,
    S_AND_NEG = 3'b100,
    S_OR_NEG = 3'b101,
    S_MINUS = 3'b110,
    S_STL = 3'b111
    )
    (input logic [N-1:0]SrcA,SrcB,
    input logic [2:0]ALUControl,
    output logic [N-1:0]ALUResult,
    output logic Zero
    );
always_comb begin
    case(ALUControl)
        S_AND:      ALUResult = SrcA & SrcB;
        S_OR:       ALUResult = SrcA | SrcB;
        S_PLUS:     ALUResult = SrcA + SrcB;
        S_AND_NEG:  ALUResult = SrcA &~SrcB;
        S_OR_NEG:   ALUResult = SrcA |~SrcB;
        S_MINUS:    ALUResult = SrcA - SrcB;
        S_STL:      ALUResult = SrcA < SrcB;
        S_UNUSED:   ALUResult = 0;
    endcase
end
assign Zero = ALUResult==0 ? 1 : 0;
endmodule
