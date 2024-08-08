`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:09 07/11/2024 
// Design Name: 
// Module Name:    led_driver 
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
module led_driver(
		input wire CLK,
		input wire RST,
		input wire [23:0] rgb_data,
		output reg DATA
    );
	 
//Dla 50MHz
//parameter TH = 41;
//parameter TL = 23;
//parameter TP = 64;
//parameter TR = 2560;

//Dla 12MHz
parameter TH = 10;
parameter TL = 5;
parameter TP = 15;
parameter TR = 780; //65 us resetu
parameter LED_NUM = 7;

reg [11:0] bit_counter;
reg [4:0] rgb_counter;
reg [4:0] led_counter;

localparam STATE_DATA = 0;
localparam STATE_RESET = 1;

reg [1:0] state;

always @(posedge CLK) begin
	if(!RST) begin
		state <= STATE_RESET;
		bit_counter <= TR;
		led_counter <= LED_NUM - 1;
		DATA <= 0;
	end
	else begin
		case(state)
			STATE_RESET : begin
				rgb_counter <= 5'd23;
				led_counter <= LED_NUM - 1;
				DATA <= 0;
				bit_counter <= bit_counter - 1;
				if(bit_counter == 0) begin
					state <= STATE_DATA;
					bit_counter <= TP;
				end
			end
			STATE_DATA : begin
				if(rgb_data[rgb_counter]) begin
					DATA <= bit_counter > (TP - TH);
				end
				else begin
					DATA <= bit_counter > (TP - TL);
				end
				bit_counter <= bit_counter - 1;
				if(bit_counter == 0) begin
					bit_counter <= TP;
					rgb_counter <= rgb_counter - 1;
					if(rgb_counter == 0) begin
						rgb_counter <= 5'd23;
						bit_counter <= TP;
						led_counter <= led_counter - 1;
						if(led_counter == 0) begin
							state <= STATE_RESET;
							led_counter <= LED_NUM - 1;
							bit_counter <= TR;
						end
					end
				end
			end
		endcase
	end
end

endmodule
