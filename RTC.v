`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:41 11/18/2019 
// Design Name: 
// Module Name:    RTC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module RTC(
clk_1s,// 1 Hz clock
reset,
seconds,
minutes,
hours);

//INPUTS
input clk_1s;//1 Hz clock input 
input reset;//clock reset as input
//OUTPUTS
output [7:0] seconds;//8 bit output seconds
output [7:0] minutes;//8 bit output minutes
output [7:0] hours;//8 bit output hours
//INTERNAL SIGNALS
reg [7:0] seconds; 
reg [7:0] minutes;
reg [7:0] hours;

//Execute the always blocks when the clock or reset inputs are changing from 0 to 1
always @(posedge(clk_1s) or posedge(reset))
begin
if(reset == 1'b1) begin  //check for active high reset.
//then reset the time.
seconds = 0;
minutes = 0;
hours = 0;  
end
else if(clk_1s == 1'b1) begin  //at the beginning of each second
seconds = seconds + 1; //increment second
if(seconds == 60) begin //check for max value of second
seconds = 0;  //reset seconds
minutes = minutes + 1; //increment minutes
if(minutes == 60) begin //check for max value of minute
minutes = 0;  //reset minutes
hours = hours + 1;  //increment hours
if(hours ==  24) begin  //check for max value of hours
hours = 0; //reset hours
end
end
end    
end
end    
endmodule

module SPI_Master(scl,mosi,miso,ss);
RTC uut (
        .clk_1s(clk_1s),
        .reset(reset),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    ); //instantiating the RTC in Master module
output reg scl;
input [0:0]miso; 
output reg [0:0]mosi;
output reg ss;
reg [7:0]data; 
initial begin
scl = 0;
ss = 1;
#10 ss = 0; // selected slave is in active low 
repeat(50)
begin
data = hours; 
#200
data = minutes;
#200
data = seconds;
end  // data sent serially as hours, minutes and seconds
end
always @(negedge ss)
slock ;
always @(posedge scl)begin 
mosi = data[7];
data = data<<1; //shifting data by 1 bit 
end
task slock;
repeat (100)
#10 scl = !scl; // scl alternates between 0 and 1 
endtask: slock;
endmodule 