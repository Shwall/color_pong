`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 03:33:28 PM
// Design Name: 
// Module Name: Game_driver
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


module Game_driver(
    input gameclk,
    input [31:0] p1color,
    input [31:0] p2color,
    input [31:0] ballcolor,
    input start,
    output reg [0:3] p1score,
    output reg [0:3] p2score,
    output reg [0:5] ballpixel
    );
    
    reg direction;
    
    initial begin
    p1score = 0;
    p2score = 0;
    ballpixel = 29;
    direction = 0;
    end
    
    always @ (posedge gameclk) begin
    
        if ( ballpixel < 5) begin
            ballpixel <= 21;
            direction = 1;
            p2score <= p2score +1;
        end
        
        if ( ballpixel > 56 ) begin
            ballpixel <=21;
            direction = 0;
            p1score <= p1score +1;
        end
        
        if ( start & direction ) begin
                ballpixel <= ballpixel + 1;
        end
        else if (start & ~direction) begin
                ballpixel <= ballpixel - 1;
        end
         
    end    
    
endmodule
