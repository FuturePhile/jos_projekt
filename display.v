module display(
    input CLK,
    input RST,
    input [3:0] SW,
    output reg [6:0] DISP
);



always @(posedge CLK or posedge RST) begin
    if (RST) begin
        DISP <= 7'b0000000;
    end
    else if (CLK) begin
        case (SW)
            4'b0000 : DISP <= 7'b1111110;
            4'b0001 : DISP <= 7'b0110000;
            4'b0010 : DISP <= 7'b1101101;
            4'b0011 : DISP <= 7'b1111001;
            4'b0100 : DISP <= 7'b0110011;
            4'b0101 : DISP <= 7'b1011011;
            4'b0110 : DISP <= 7'b1011111;
            4'b0111 : DISP <= 7'b1110000;
            4'b1000 : DISP <= 7'b1111111;
            4'b1001 : DISP <= 7'b1111011;
            default : DISP <= 7'b0000000;
        endcase
    end
end

endmodule