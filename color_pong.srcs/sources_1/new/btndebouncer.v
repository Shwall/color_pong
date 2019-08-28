`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2019 06:07:41 PM
// Design Name: 
// Module Name: btndebouncer
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


module btndebouncer(
    input clk,
    input b,
    output reg d
    );

    reg [1:0] state;
    
    
    initial begin
        state =0;
    end
    
    always @(posedge clk) begin
        case (state)
            2'b00: begin
                state <= {1'b0,b};
                d <= 0;
            end
            2'b01: begin
                state <= {b,b};
                d <= 0;
            end
            2'b11: begin
                state <= {1'b1,b};
                d <= 0;
            end
            2'b10: begin
                state <= 2'b00;
                d <= ~b;
            end
        endcase        
    end   
   
endmodule
