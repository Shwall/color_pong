`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2017 09:55:40 AM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    
    reg mclk;
    wire dout;
    
    neopixel_test DUT(
        .mclk(mclk),
        .dout(dout)
        );
    initial begin
        mclk = 0;
        
        forever #10 mclk = ~mclk;
    end
endmodule
