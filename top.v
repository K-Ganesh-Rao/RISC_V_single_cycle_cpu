/// Top module
// instansiate all module


module top(
	input clk,reset


);

wire [31:0] PC_Top;
wire [31:0] instruction_top , address_top , Memdata_top , WriteBack_top ;
wire [31:0] Rd1_top , Rd2_top , ImmExt_top , Mux1_out_top ,Sum_out_top  , NextoPC_top , PC_in_top; 
wire RegWrite_top , ALUSrc_top ,zero_top , branch_top , sel2_top ,MemtoReg_top , MemWrite_top ,Memread_top ; 
wire [1:0] ALUOp_top;
wire [3:0] Control_top ; 


// program counter
Program_Counter PC(.clk(clk), .reset(reset),.PC_in(PC_in_top), .PC_out(PC_Top));

// PC Adder

PC_plus4 PC_Adder(.fromPC(PC_Top) , .NextoPC(NextoPC_top));

// Instruction memory

Instruction_Mem Inst_memory(.clk(clk), .reset(reset), .read_address(PC_Top) ,  .instruction_out(instruction_top));

//Register file

Reg_file Reg_file( .clk(clk) , .reset(reset) , .RegWrite(RegWrite_top) , .Rs1(instruction_top[19:15]) , .Rs2(instruction_top[24:20]) , .Rd(instruction_top[11:7]) , .write_data(WriteBack_top)  , .read_data1(Rd1_top) , .read_data2(Rd2_top) );

//Immediate Generator

ImmGen ImmGen( .opcode(instruction_top[6:0]) , .instruction(instruction_top) , .ImmExt(ImmExt_top) );


//Controlunit

Control_Unit Control_Unit(.instruction(instruction_top[6:0]) , .Branch(branch_top) ,.MemRead(Memread_top) , .MemtoReg(MemtoReg_top) , .MemWrite(MemWrite_top) , .ALUSrc(ALUSrc_top) , .RegWrite(RegWrite_top) , .ALUOp(ALUOp_top) );


// ALU control


ALU_Control ALU_Control(.fun7(instruction_top[30]) , .fun3(instruction_top[14:12]) , .ALUOp(ALUOp_top) , .Control_out(Control_top));

//ALU unit

ALU_unit ALU_unit(.A(Rd1_top) , .B(Mux1_out_top) , .Control_in(Control_top) , .zero(zero_top) , .ALU_Result(address_top) );


// ALU MUX

Mux1 ALU_Mux(.sel1(ALUSrc_top) , .A1(Rd2_top) , .B1(ImmExt_top) , .Mux1_out(Mux1_out_top) );


// Adder

Adder Adder(.in_1(PC_Top) , .in_2(ImmExt_top) , .Sum_out(Sum_out_top) );

// AND gate logic 
 
AND_logic AND_logic( .branch(branch_top) , .zero(zero_top), .and_out(sel2_top) );

//MUX

Mux2 Adder_Mux(.sel2(sel2_top), .A2(NextoPC_top) , .B2(Sum_out_top) ,  .Mux2_out(PC_in_top));


//Data Memory

Data_Memory Data_Mem( .clk(),.reset() , .Memwrite(MemWrite_top) , .Memread(Memread_top) , .read_address(address_top) , .write_data(Rd2_top) , .MemData_out(Memdata_top) );


// MUX

Mux3 Mem_mux(.sel3(MemtoReg_top) , .A3(address_top) , .B3(Memdata_top) , .Mux3_out(WriteBack_top) );

endmodule