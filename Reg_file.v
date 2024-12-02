/*
Author: Ganesg
Date : 01/12/2024

*/

//Register file

module Reg_file(
	input clk,
	input reset,
	input RegrWrite,
	input [4:0] Rs1,Rs2,Rd,
	input [31:0] write_data,
	output [31:0] readdata1 , read_data2
);

reg [31:0] Registers[31:0];
integer K;
always@(posedge clk or posedge reset)
begin
	if(reset)
		begin
			for(k=0 ; k < 32 ; k= k+1)begin
			Registers[k] <= 32'b00;
			end
		end
	else if(RegWrite)begin
		Register[Rd] <= Write_data;
	end
end

assign read_data1 = Registers[Rs1];
assign read_data2 = Registers[Rs2];
	
endmodule