module top_module (
    input CLK,
    input RST,
    input [3:0] SW,
    output reg [6:0] DISP,
    output LED
);

reg [23:0] color;

display display_control(
    .CLK(CLK),
    .RST(RST),
    .SW(SW),
    .DISP(DISP)
);

rom rom_internal (
    .CLK(CLK),
    .RST(RST),
    .SW(SW),
    .color(color)
);

led_driver led_driver_internal (
    .CLK(CLK),
    .RST(RST),
    .color(color),
    .LED(LED)
);

endmodule