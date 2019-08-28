`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 05:58:37 PM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(
    input clkin,
    output reg clkout
    );
    reg [28:0] count;
    initial begin
        clkout = 0;
        count = 0;
    end
    
    always @(posedge clkin) begin
        if( count == 28'd100_000_000) begin
            count <= 0;
            clkout = ~ clkout;
        end
        else begin
            count <= count +1;
        end
    end 
endmodule
