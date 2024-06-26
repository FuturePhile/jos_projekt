module led_driver (
    input CLK,
    input RST,
    input [23:0] color,
    output LED
);

//parametry dla 50MHz

parameter T0H = 20;
parameter T0L = 43;
parameter T1H = 41;
parameter T1L = 23;
parameter TR = 2560;

reg [4:0] bit_counter;
reg [23:0] color_data;


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        bit_counter <= 5'b00000;
        color_data <= color;
    end
    else if (CLK) begin
        if (bit_counter < 5'b1100) begin
            if (color_data[bit_counter] == 1'b1) begin

            end else if (color_data[bit_counter] == 1'b0) begin

            end else begin
                bit_counter <= bit_counter + 1;
            end

        end else begin
            bit_counter <= 5'b00000;
        end

    end
end

endmodule