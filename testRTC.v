`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:56 11/25/2019
// Design Name:   RTC
// Module Name:   Kirthika
// Project Name:  Project_MP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RTC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;
    // Inputs
    reg clk_1s;
    reg reset;

    // Outputs
    wire [7:0] seconds;
    wire [7:0] minutes;
    wire [7:0] hours;

    // Instantiate the Unit Under Test (UUT)
    RTC uut (
        .clk_1s(clk_1s),
        .reset(reset),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    );
   
    //Generating the Clock with `1 Hz frequency
    initial clk_1s = 0;
    always #50000000 clk_1s = ~clk_1s;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;
        // Wait 100 ns for global reset to finish
        #100;
        reset = 0;  
    end
endmodule


