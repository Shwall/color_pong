`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 05:51:01 PM
// Design Name: 
// Module Name: game_controller
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


module game_controller(
    input clk,
    input [3:0] p1score,
    input [3:0] p2score,
    input startbtn,
    output reg start
    );
  initial begin
    start = 0;
  end  
    always @(posedge clk) begin
        if (startbtn) begin
            start <= ~start;
        end
        else if (p1score > 5 ) begin
            start <= 0;
        end
        else if (p2score > 5 ) begin
            start <= 0;
        end 
        
    end
endmodule
