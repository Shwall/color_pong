`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:05 11/10/2016 
// Design Name: 
// Module Name:    neopixel_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define T0H 15
`define T0L 45
`define T1H 30
`define T1L 30
`define TRST 4000

module neopixel_driver(
    input clk,
    input [31:0] p1color,
    input [31:0] p2color,
    input [31:0] ballcolor,
    input [5:0] ballpixel,
    output reg dout
    );
	reg iclk;
	reg [12:0] count;
	reg [5:0]  index;
	reg [7:0]  pixel;
	reg [1:0] icount;
	reg [31:0] color;
	
	reg [2:0] state;
	
	initial begin
		count = 0;
		state = 0;
		dout = 0;
		index = 23;
		pixel = 0;
		iclk = 0;
		icount = 0;
	end
	always @ (posedge clk) begin
	   if (count == 3 ) begin
	       iclk <= ~iclk;
	       icount <=0;
       end
       else begin
           icount <= icount + 1;
       end
    end
       
	always @(posedge iclk) begin
		case (state)
			// Waiting:
			2'b00: begin
				if (count >= 60) begin
					count <= 0;
					state <= 2'b01;					
					dout <= 1;
				end
				else
					count <= count + 1;
			end
			2'b01: begin
				if ((!(color[index])&&(count >= 15))||((color[index])&&(count>=30))) begin
					count <= 0;
					state <= 2'b11;
					dout <= 0;
				end
				else
					count <= count + 1;
			end
			2'b11: begin
				if ((!(color[index])&&(count >= 45))||((color[index])&&(count>=30))) begin
					count <= 0;
					state <= 2'b10;
					//dout <= 0;
				end
				else
					count <= count + 1;
			end
			2'b10: begin
				if (index == 0) begin
					if (pixel < 5 ) begin
							state <= 2'b00;
							color <= p1color;
				    end
					else if ( 4 < pixel < 54  ) begin
					        state <= 2'b00;
					        if ( ballpixel == pixel) begin
					                color <= ballcolor;
					        end
					        else begin
					           color <= 0;
					        end
					end
					else if ( pixel > 54 ) begin
					        state <= 2'b00;
					        color <= p2color;
					end
					else if ( pixel == 59 )begin
					        pixel = 0;
					end
					else begin    
						index <= 31;
						pixel <= pixel + 1;
						state <= 2'b01;
						dout <= 1;
					end
				end
				else begin
					index <= index - 1;
					state <= 2'b01;
					dout <= 1;
				end
			end
		endcase
	end

endmodule
