module rom (
    input CLK,
    input RST,
    input [3:0] SW,
    output reg [23:0] color
);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        color <= 23'h00_00_00;
    end
    else if (CLK) begin
        case (SW)
            4'b0000 : color <= 23'hFF_FF_FF;
            4'b0001 : color <= 23'hFF_00_00;
            4'b0010 : color <= 23'h00_FF_00;
            4'b0011 : color <= 23'h00_00_FF;
            4'b0100 : color <= 23'hFF_FF_00;
            4'b0101 : color <= 23'hFF_00_FF;
            4'b0110 : color <= 23'h00_FF_FF;
            4'b0111 : color <= 23'h00_00_00;
            4'b1000 : color <= 23'h00_00_00;
            4'b1001 : color <= 23'h00_00_00;
            default : color <= 23'h00_00_00;
        endcase
    end
end

endmodule