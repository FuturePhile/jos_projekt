`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:58 07/11/2024 
// Design Name: 
// Module Name:    rom 
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
module rom(
		input wire CLK,
		input wire RST,
		input wire [3:0] SW,
		output reg [23:0] color
    );

always @(posedge CLK) begin
	if(!RST) begin
		color <= 24'h00_00_00;
	end else begin
		case(SW)
			4'b1111 : color <= 24'hFF_FF_FF;
			4'b1110 : color <= 24'hFF_00_00;
			4'b1101 : color <= 24'h00_FF_00;
			4'b1100 : color <= 24'h00_00_FF;
			4'b1011 : color <= 24'hFF_FF_00;
			4'b1010 : color <= 24'hFF_00_FF;
			4'b1001 : color <= 24'h00_FF_FF;
			4'b1000 : color <= 24'hCE_F6_0A;
			4'b0111 : color <= 24'h55_55_55;
			4'b0110 : color <= 24'hAA_AA_AA;
			default : color <= 24'h00_00_00;
		endcase
	end
end

endmodule
