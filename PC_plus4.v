/*
Author: Ganesh
Date : 01/12/2024

*/

//PC = PC + 4

module PC_plus4(
	input [31:0] fromPC,
	output [31:0] NextoPC
);

 // PC_plus4(fromPC , NextoPC );

assign NextoPC = 4 + fromPC;

endmodule