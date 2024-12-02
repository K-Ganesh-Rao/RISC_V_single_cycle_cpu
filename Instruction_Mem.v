/*
Author: Ganesg
Date : 01/12/2024

*/

//Instruction Memory

module Instruction_Mem(
	input clk,
	input reset,
	input [31:0] read_address,
	output [31:0] instruction_out
);

reg [31:0] I_Mem [63:0];
integer k;

always @(posedge clk or posedge reset)
begin
	if(reset)
		begin
			for(k = 0; k <64 ; k=k+1)begin
				I_Mem[k] <= 32'b00;
			end
			
		end
	else
		instruction_out <= I_Mem[read_address];
end


endmodule