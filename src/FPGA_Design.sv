`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2025 17:43:51
// Design Name: 
// Module Name: DivideBy4
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


module DivideBy4(
    input logic clk,
    input logic reset,
    input logic data_in,
    output logic [1:0] data_out
    );
localparam logic [1:0] idle_state = 2'b00;
logic [1:0] current_state = 2'b00;
logic [1:0] next_state = 2'b00;    
always_ff @(posedge clk) begin
    if (reset == 1) begin
        current_state <= idle_state;
        data_out <= idle_state;
    end else begin
        current_state <= next_state;
        data_out <= next_state;
    end
end
always_comb begin
    unique case (current_state)
        2'b00: begin
            if (data_in == 0) begin
                next_state = 2'b01;
            end else if (data_in == 1) begin
                next_state = 2'b11;
            end
        end
        2'b01: begin
            if (data_in == 0) begin
                next_state = 2'b10;
            end else if (data_in == 1) begin
                next_state = 2'b00;
            end
        end
        2'b10: begin
            if (data_in == 0) begin
                next_state = 2'b11;
            end else if (data_in == 1) begin
                next_state = 2'b01;
            end
        end
        2'b11: begin
            if (data_in == 0) begin
                next_state = 2'b00;
            end else if (data_in == 1) begin
                next_state = 2'b10;
            end
        end
    endcase
end
            
                
     
        
    

endmodule
