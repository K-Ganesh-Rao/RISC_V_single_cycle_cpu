// AND gate

module AND_logic(
	input branch , zero,
	output and_out
	
);  //  AND_logic( branch , zero, , and_out );

assign and_out = branch & zero;

endmodule