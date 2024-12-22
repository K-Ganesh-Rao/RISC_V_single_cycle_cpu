/*
Author: Ganesh
Date : 02/12/2024

*/

//Immediate Generator
// with sign extended bits
module ImmGen(
	input [6:0] opcode,
	input [31:0] instruction,
	output reg [31:0] ImmExt

);	// ImmGen( opcode , instruction , ImmExt );

always @(*)begin
	case(opcode)
		7'b0000011 : ImmExt <= {{20{instruction[31]}} , instruction[31:20]}; 								 //Load type instruction  (lw)
		7'b0100011 : ImmExt <= {{20{instruction[31]}} , instruction[31:25] , instruction[11:7]};	//Store type instruction	  (sw)
		7'b1100011 : ImmExt <= {{19{instruction[31]}} , instruction[31] , instruction[30:25] , instruction[11:8] ,1'b0};	//Branch type instruction (beq)
	endcase
	
end


endmodule