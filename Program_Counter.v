/*
Author: Ganesh
Date : 01/12/2024

*/

//Program Countre

module Program_Counter(
	input clk,
	input reset,
	input [31:0] PC_in,
	output reg [31:0] PC_out

);			// Program_Counter(clk, reset,PC_in, PC_out);

always@(posedge clk or posedge reset )begin
	if(reset)
		PC_out <= 32'b00;
	else
		PC_out <= PC_in;
		
end

endmodule