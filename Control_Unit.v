/*
Author: Ganesg
Date : 02/12/2024

*/

//Control Unit

module Control_Unit(
	input [6:0]instruction , 
	output Branch ,MemRead , MemtoReg , MemWrite , ALUSrc , RegWrite ,
	output [1:0] ALUOp


);

always @(*)beginb
	case(instruction)
	
	//Rtype instruction
	7'b0110011 : {ALUSrc ,MemtoReg, RegWrite , MemRead , MemWrite , Branch , ALUOp} <= 8'b001000_01;
	// lw type instruction
	7'b0000011 : {ALUSrc ,MemtoReg, RegWrite , MemRead , MemWrite , Branch , ALUOp} <= 8'b111100_00;
	// sw type instruction
	7'b0100011 : {ALUSrc ,MemtoReg, RegWrite , MemRead , MemWrite , Branch , ALUOp} <= 8'b100010_00;	//MemtoReg = X (dontcare)
	// beq type instruction (branch)
	7'b1100011 : {ALUSrc ,MemtoReg, RegWrite , MemRead , MemWrite , Branch , ALUOp} <= 8'b000001_01;   //MemtoReg = X (dontcare)
	endcase
	
end

endmodule