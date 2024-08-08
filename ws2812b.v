`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:25 07/11/2024 
// Design Name: 
// Module Name:    ws2812b 
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
`include "display.v"
`include "rom.v"
`include "led_driver.v"

module ws2812b(
		input CLK,
		input RST,
		input [3:0] SW,
		output [7:0] DISP,
		output [2:0] DISP_SEG,
		output LED
    );

wire [23:0] color;

assign DISP_SEG[0] = 1'b0;
assign DISP_SEG[1] = 1'b1;
assign DISP_SEG[2] = 1'b1;

display display_control(
		.CLK(CLK),
		.RST(RST),
		.SW(SW),
		.DISP(DISP)
	);
	
rom rom_internal(
		.CLK(CLK),
		.RST(RST),
		.SW(SW),
		.color(color)
	);
	
led_driver led_driver_internal(
		.CLK(CLK),
		.RST(RST),
		.rgb_data(color),
		.DATA(LED)
	);

endmodule
