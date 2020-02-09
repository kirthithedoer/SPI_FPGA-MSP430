`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:50:55 12/07/2019
// Design Name:   SPI_Master
// Module Name:   /home/eng/k/kxv190001/Desktop/Project_MP/testmaster.v
// Project Name:  Project_MP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_Master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmaster;

	// Inputs
	reg [0:0] miso;

	// Outputs
	wire scl;
	wire [0:0] mosi;
	wire ss;

	// Instantiate the Unit Under Test (UUT)
	SPI_Master uut (
		.scl(scl), 
		.mosi(mosi), 
		.miso(miso), 
		.ss(ss)
	);

initial begin
// Initialize Inputs
miso = 0;
// Wait 100 ns for global reset to finish
#100;  
// Add stimulus here
end     
endmodule 