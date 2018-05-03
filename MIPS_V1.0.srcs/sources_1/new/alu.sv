`timescale 1ns / 1ps


module alu#(parameter N = 32)
    (input logic [N-1:0]SrcA,SrcB,
    input logic [2:0]ALUControl,
    output logic [N-1:0]ALUResult,
    output logic Zero
    );
parameter S_OR = 3'b001;
parameter S_AND = 3'b000;
parameter S_PLUS = 3'b010;
parameter S_UNUSED = 3'b011;
parameter S_AND_NEG = 3'b100;
parameter S_MINUS_NE = 3'b101;
parameter S_MINUS = 3'b110;
parameter S_STL = 3'b111;

always_comb begin
    case(ALUControl)
        S_AND:      ALUResult = SrcA & SrcB;
        S_OR:       ALUResult = SrcA | SrcB;
        S_PLUS:     ALUResult = SrcA + SrcB;
        S_AND_NEG:  ALUResult = SrcA &~SrcB;
        S_MINUS_NE: ALUResult = (SrcA - SrcB == 0 )? 1 : 0;
        S_MINUS:    ALUResult = SrcA - SrcB;
        S_STL:      ALUResult = SrcA < SrcB;
        S_UNUSED:   ALUResult = 0;
    endcase
end
assign Zero = ALUResult==0 ? 1 : 0;
endmodule
