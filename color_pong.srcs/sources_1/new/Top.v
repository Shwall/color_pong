`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 06:18:45 PM
// Design Name: 
// Module Name: Top
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


module Top(
input mclk,
input btnU,
input btnD,
input btnR,
input btnL,
input btnC,
//output [7:0] LED, //modify to be seg and AN when using seven segment display
output dout
    );

wire [3:0] p1score;
wire [3:0] p2score;
wire start;
wire startbtn;
wire [1:0] p1;
wire [1:0] p2;
wire gameclk;    
wire [31:0] p1color;
wire [31:0] p2color;
wire [31:0] ballcolor;
wire [5:0] ballpixel;

    btndebouncer pause (
        .clk(mclk),
        .b(btnC),
        .d(startbtn)
    );
    
    game_controller play (
        .clk(mclk),
        .p1score(p1score),
        .p2score(p2score),
        .startbtn(startbtn),
        .start(start)
    );
    
    btndebouncer p1d1 (
        .clk(mclk),
        .b(btnU),
        .d(p1[0])
    );  
    
    btndebouncer p1d2 (
    .clk(mclk),
    .b(btnR),
    .d(p1[1])
    );
    
    btndebouncer p2d1 (
        .clk(mclk),
        .b(btnD),
        .d(p2[0])
    );  
    
    btndebouncer p2d2 (
    .clk(mclk),
    .b(btnL),
    .d(p2[1])
    );
 
    clockdivider gameclock (
    .clkin(mclk),
    .clkout(gameclk)
    );
    
    color_driver c1 (
    .clk(mclk),
    .ballpixel(ballpixel),
    .p1btn(p1),
    .p2btn(p2),
    .p1color(p1color),
    .p2color(p2color),
    .ballcolor(ballcolor)
    );
    
    Game_driver game (
    .gameclk(gameclk),
    .p1color(p1color),
    .p2color(p2color),
    .ballcolor(ballcolor),
    .start(start),
    .p1score(p1score),
    .p2score(p2score),
    .ballpixel(ballpixel)
    );
    
    neopixel_driver strip (
    .clk(mclk),
    .p1color(p1color),
    .p2color(p2color),
    .ballcolor(ballcolor),
    .ballpixel(ballpixel),
    .dout(dout)
    );
    
endmodule
