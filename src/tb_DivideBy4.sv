`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2025 18:14:19
// Design Name: 
// Module Name: tb_DivideBy4
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


module tb_DivideBy4;
logic clk;
logic reset;
logic data_in;
logic [1:0] data_out;
DivideBy4 uut (
            .clk(clk),
            .reset(reset),
            .data_in(data_in),
            .data_out(data_out));
initial begin
    clk = 0;
    reset = 1;
    data_in = 0;
    repeat (2) @(posedge clk);
    reset = 0;
    // Count up
    check_count(2'b01, "count up 0->1");
    check_count(2'b10, "count up 1->2");
    check_count(2'b11, "count up 2->3");
    check_count(2'b00, "count up 3->0");

    // Count down
    data_in = 1;
    check_count(2'b01, "count up 0->1"); //a cycle delay
    check_count(2'b00, "count up 1->0");
    check_count(2'b11, "count up 0->3");
    check_count(2'b10, "count down 3->2");
    check_count(2'b01, "count down 2->1");
    check_count(2'b00, "count down 1->0");

    $display("Test completed");
    $finish;
end
task check_count(input[1:0] expected, input string msg); 
    begin
    @(posedge clk);   // wait for current edge 
    if (data_out === expected) 
        $display("PASS: %s at %0t, value=%b", msg, $time, data_out);
    else
        $display("FAIL: %s at %0t, expected=%b got=%b",msg, $time, expected, data_out);
    end


endtask
always begin
    #10 clk = ~clk; // 50MHz clock
end

                      
endmodule

