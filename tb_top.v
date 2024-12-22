

module tb_top;

reg clk , reset;

top uut(.clk(clk) , .reset(resert));

initial begin
	clk = 0;
	reset = 1;
	
	#5;
	reset = 0;
	#400;

end

always #5 clk = ~clk;

endmodule