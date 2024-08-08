`timescale 1ns/1ps
`include "led_driver.v"

module led_driver_tb;

reg clk;
reg clr;
reg [23:0] color_test;
wire led_out;

led_driver UUT(
    .CLK(clk),
    .RST(clr),
    .rgb_data(color_test),
    .DATA(led_out)
);

initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial begin
    #0 clr = 1'b0; color_test = 24'hAA_AA_AA;
    #10 clr = 1'b1;
    #8000 $finish;
end

initial begin
    $monitor("Time: %t  clk: %b clr: %b color_test: %h  led_out: %b", $time, clk, clr, color_test, led_out);
    $dumpfile("led_driver.vcd");
    $dumpvars(0, UUT);
end

endmodule