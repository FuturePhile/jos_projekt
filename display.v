`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:40 07/11/2024 
// Design Name: 
// Module Name:    display 
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
module display(
		input wire CLK,
		input wire RST,
		input wire [3:0] SW,
		output reg [7:0] DISP
    );

always @(posedge CLK) begin
	if(!RST) begin
		DISP <= 8'b11111111;
	end else begin
		case(SW)
			4'b1111 : DISP[6:0] <= 7'b1000000;
			4'b1110 : DISP[6:0] <= 7'b1111001;
			4'b1101 : DISP[6:0] <= 7'b0100100;
			4'b1100 : DISP[6:0] <= 7'b0110000;
			4'b1011 : DISP[6:0] <= 7'b0011001;
			4'b1010 : DISP[6:0] <= 7'b0010010;
			4'b1001 : DISP[6:0] <= 7'b0000010;
			4'b1000 : DISP[6:0] <= 7'b1111000;
			4'b0111 : DISP[6:0] <= 7'b0000000;
			4'b0110 : DISP[6:0] <= 7'b0010000;
			default : DISP[6:0] <= 7'b1111111;
		endcase
		DISP[7] <= 1'b1;
	end
end

endmodule
