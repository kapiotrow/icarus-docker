`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 08:34:06 PM
// Design Name: 
// Module Name: tb_and_cascade
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_top(

    );
localparam LENGTH = 8;

reg [LENGTH-1:0] stimuli = 0;
wire [LENGTH-1:0] stimuli_w;
wire observed;
reg clk = 1'b0;

assign stimuli_w = stimuli;

initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_top);
    while(1)
    begin
        #1;
        clk = ~clk;;

    end
end

always @(posedge clk) begin
    stimuli = stimuli + 1'b1;
    if (stimuli == 8'b11111111) $finish;
end
    
long_and #(
    .LENGTH(LENGTH)
)
dut
(
    .x(stimuli_w),
    .y(observed)
);
endmodule
