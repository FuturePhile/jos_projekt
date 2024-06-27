module led_driver (
    input CLK,
    input RST,
    input [23:0] color,
    output LED
);

//parametry dla 50MHz

parameter T0H = 21;
parameter T0L = 43;
parameter T1H = 41;
parameter T1L = 23;
parameter TP = 64;
parameter TR = 2560;

reg [4:0] bit_counter;
reg [23:0] color_data;
reg [11:0] counter;
wire data;


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        bit_counter <= 5'b00000;
        counter <= 11'd0;
        color_data <= color;
    end
    else if (CLK) begin
        if (bit_counter < 5'b1100) begin
            if (color_data[bit_counter] == 1'b1) begin
                if (counter < T1H) begin
                    data <= 1'b1;
                    counter <= counter + 1;
                end else if (counter < T1L) begin
                    data <= 1'b0;
                    counter <= counter + 1;
                end else begin
                    counter <= 11'b0;
                end
            end else if (color_data[bit_counter] == 1'b0) begin
                if (coutnter < T0H) begin
                    data <= 1'b1;
                    counter <= counter + 1;
                end else if (counter < T0L) begin
                    data <= 1'b0;
                    counter <= counter + 1;
                end else begin
                    counter <= 11'b0;
                end
            end else if (bit_counter == 5'b11000) begin
                if (counter < TR) begin
                    data <= 1'b1;
                    counter <= counter + 1;
                end
            end else begin
                bit_counter <= bit_counter + 1;
            end

        end else begin
            bit_counter <= 5'b00000;
        end

    end
end

assign LED <= data;

endmodule