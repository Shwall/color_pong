`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 03:48:24 PM
// Design Name: 
// Module Name: color_driver
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


module color_driver(
   input clk,
   input [5:0] ballpixel,
   input [1:0] p1btn,
   input [1:0] p2btn,
   output reg [31:0] p1color,
   output reg [31:0] p2color,
   output reg [31:0] ballcolor
    );
    reg [2:0] p1;
    reg [2:0] p2;
    reg [8:0] rand;
    reg [31:0] colors [5:0]; //6 deep arrray of 32 bit registers
    // color is defined R, G , B, Gamma 

    initial begin 
    colors[0] = 32'hFF000088; //red
    colors[1] = 32'hFF800088; //oragne
    colors[2] = 32'hFFFF0088; //yellow
    colors[3] = 32'h00FF0088; //green
    colors[4] = 32'h0000FF88; //blue 
    colors[5] = 32'h4c009988; //violet
    
    p1color = colors[0];
    p2color = colors[0];
    ballcolor = colors[6];
    p1 = 0;
    p2 = 0;
    rand = 5;
    end
    
    always @ (posedge clk) begin
        if ( p1btn[0]) begin
            if (p1 < 6) begin
                p1 <= p1 +1;
            end
            else begin
                p1 <= 0;
            end
        end
        else if (p1btn[1]) begin
            if (p1 > 0 ) begin
                p1 <= p1 -1;
            end
            else begin
                p1 <= 5;
             end
        end        
        if ( p2btn[0]) begin
            if (p1 < 6) begin
                p1 <= p1 +1;
            end
            else begin
                p1 <= 0;
            end
        end
        else if (p2btn[1]) begin
            if (p2 > 0 ) begin
                p2 <= p2 -1;
            end
            else begin
                p2 <= 5;
             end
        end
        p1color <= colors[p1];
        p2color <= colors[p2];
        
        if ( ballpixel > 9 ) begin //keep the ball the same color for last 5 
            if (ballpixel < 50 ) begin
                rand <= (p1 + p2) * ballpixel % 5;   
                ballcolor <= colors[rand];
            end
        end
    end
    
endmodule

